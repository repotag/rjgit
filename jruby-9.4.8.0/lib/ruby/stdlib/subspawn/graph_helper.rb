require 'set'

module SubSpawn::Internal
	class Bigraph
		def initialize
			@fwd = {}
			@rev = {}
		end
		def insert(head, tail, data)
			node = BiNode.new(head, tail, data)
			((@fwd[head] ||= {})[tail] ||= []) << node
			((@rev[tail] ||= {})[head] ||= []) << node
		end
		def unmark!
			@fwd.each do |h, ts|
				ts.each do |t, lst|
					lst.each {|n| n.marker = nil}
				end
			end
		end
		def roots
			unmark!
			roots = []
			@rev.each do |t, hs|
				hs.each do |h, lst|
					roots += lst unless @rev.key? h
				end
			end
			roots
		end
		def roots_h
			unmark!
			roots = []
			@rev.each do |t, hs|
				hs.each do |h, lst|
					roots << h unless @rev.key? h
				end
			end
			roots.uniq
		end
		def leaves
			unmark!
			leaves = []
			@fwd.each do |h, ts|
				ts.each do |t, lst|
					leaves += lst unless @fwd.key? t
				end
			end
			leaves
		end
		def find_cycle
			unmark!
			# we have a forest, do for each forestry
			rts = roots_h
			if rts.empty? # probably have a loop
				#puts "empt"
				rts = [@fwd.keys.first]
			end
			at, rts = *rts
			while at
				#puts "searching at #{at} with #{rts}"
				tmp = find_cycle_next(at)
				return tmp unless tmp.nil?
				at, rts = *rts
			end
		end
		def find_cycle_next(start)
			@fwd[start]&.each do |t, list|
				#puts "cc = [#{start} -> #{t}]"
				if list.any?(&:marker)
					return t 
				end
				list.each(&:mark)
				tmp = find_cycle_next(t)
				return tmp unless tmp.nil?
			end
			return nil
		end
		def delete_outgoing(head)
			@fwd[head].flat_map{|t, k|delete(head, t)}
		end
		def delete(head, tail)
			@fwd[head].delete(tail)
			@rev[tail].delete(head).map(&:data)
		end
		def find_unmarked
			@fwd.each do |h, ts|
				ts.each do |t, lst|
					return [h, t] unless lst.first.marker
				end
			end
			return nil
		end
		def ordered_kahn
			unmark!
			# now traverse the tree until we hit a junction, ensuring
			# dependencies are met
			# Note this assumes you removed all the cycles from your code
			# returns each graph seperately as a sort of forest
			l = []
			s = Set.new(roots_h)

			until s.empty?
				n = s.first
				#puts "checking #{n} in #{s}"
				s.delete(n)
				@fwd[n]&.each do |e, ms|
					next if ms.any?(&:marker) # already visited
					ms.each(&:mark)
					# no incoming edges
					unless @rev[e]&.any?{|nh, lst| !lst.first.marker}
						# nil -> add
						# any(unmarked) true -> none
						# all(marked) -> add
						s << e
						l += ms
						#puts "blank incoming #{e}"
					else
						#puts "had incoming #{e}: #{@rev[e]}"
					end
				end
			end

			if find_unmarked#.tap{|x| p x, "um"}
				puts to_dot
				#raise "Unmarked graph edges, an unresolved cycle probably exists. This is a bug in SubSpawn"
				nil
			else
				return l.map(&:data)
			end
		end
		
		# for debugging
		def to_dot
			body = @fwd.map do |h, ts|
				ts.map do |t, lst|
					"\"#{h}\" -> \"#{t}\" ;" #{lst.first&.marker};"
				end
			end.join("\n")
			return "digraph G {\n#{body}\n}"
		end
	end
	class BiNode
		def initialize(head, tail, data)
			@head, @tail, @data, @marker = head, tail, data, nil
		end
		attr_accessor :head, :tail, :data, :marker
		def mark
			@marker = true
		end
	end
end