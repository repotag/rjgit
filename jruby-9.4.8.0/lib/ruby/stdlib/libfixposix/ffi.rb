require 'ffi'
		
module LFP
	extend FFI::Library
	ffi_lib LFPFile.local_so
	INTERFACE_VERSION = "0.5.1"
	
	# enums
	enum :memsize_measure_unit, [:octets, 0, :kb, :kib, :mb, :mib, :gb, :gib, :tb, :tib, :pb, :pib, :eb, :eib]
	enum :flags, [:setsigmask, 1, :setsigdefault, 2, :setpgroup, 4, :resetids, 8, :setcwd, 64, :setsid, 128, :setctty, 256, :usevfork, 512, :setumask, 1024, :setrlimit, 2048]
	
	# callbacks
	# typedef void (*lfp_sighandler_t)(int);
	callback :sighandler, [:int32], :void
	
	def self.const_missing( sym )
		value = enum_value( sym )
		return super unless value
		value
	end

	
	# structs and classes
	class Rlimit < FFI::Struct
		
		# main data
		layout :resource, :int32, # int resource;
			:rlim_cur, :rlim_t, # struct rlimit rlim; - The current (soft) limit
			:rlim_max, :rlim_t # struct rlimit rlim; - The hard limit
		
		def self.const_missing( sym )
			value = enum_value( sym )
			return super unless value
			value
		end
	
	end

	class Buildinfo < FFI::Struct
		
		# main data
		layout :release, :uint64, # unsigned long int release;
			:vcsid, [:uint8, 33] # char vcsid[32 + 1];
		
		def self.const_missing( sym )
			value = enum_value( sym )
			return super unless value
			value
		end
	
	end

	class SpawnFileActions
		SIZEOF = 32
		def initialize
			if block_given? 
				ret = nil # ffi doesn't return the result, must save it manually
				FFI::MemoryPointer.new(:uint8, SIZEOF) do |ptr|
					@this = ptr
					ret = yield self
				end
				ret
			else
				@this = FFI::MemoryPointer.new(:uint8, SIZEOF)
			end
		end
		attr_reader :this
		alias :to_ptr :this #ffi casting
		
		# forwarding proxies
		
		# int (lfp_spawn_file_actions_t *file_actions, int fd)
		def addclose(*args); LFP.spawn_file_actions_addclose(@this, *args); end

		# int (lfp_spawn_file_actions_t *file_actions, int fd, int newfd)
		def adddup2(*args); LFP.spawn_file_actions_adddup2(@this, *args); end

		# int (lfp_spawn_file_actions_t *file_actions, int fd)
		def addkeep(*args); LFP.spawn_file_actions_addkeep(@this, *args); end

		# int (lfp_spawn_file_actions_t *file_actions, int fd, const char *path, unsigned long int oflags, mode_t mode)
		def addopen(*args); LFP.spawn_file_actions_addopen(@this, *args); end

		# int (lfp_spawn_file_actions_t *file_actions)
		def destroy(*args); LFP.spawn_file_actions_destroy(@this, *args); end

		# int (lfp_spawn_file_actions_t *file_actions)
		def init(*args); LFP.spawn_file_actions_init(@this, *args); end

	end

	class Spawnattr
		SIZEOF = 320
		def initialize
			if block_given? 
				ret = nil # ffi doesn't return the result, must save it manually
				FFI::MemoryPointer.new(:uint8, SIZEOF) do |ptr|
					@this = ptr
					ret = yield self
				end
				ret
			else
				@this = FFI::MemoryPointer.new(:uint8, SIZEOF)
			end
		end
		attr_reader :this
		alias :to_ptr :this #ffi casting
		
		# forwarding proxies
		
		# int (lfp_spawnattr_t *attr)
		def destroy(*args); LFP.spawnattr_destroy(@this, *args); end

		# int (lfp_spawnattr_t *attr, char **path)
		def getctty(*args); LFP.spawnattr_getctty(@this, *args); end
		def ctty(); LFP.spawnattr_getctty(@this); end

		# int (lfp_spawnattr_t *attr, char **path)
		def getcwd(*args); LFP.spawnattr_getcwd(@this, *args); end
		def cwd(); LFP.spawnattr_getcwd(@this); end

		# int (lfp_spawnattr_t *attr, unsigned int *flags)
		def getflags(*args); LFP.spawnattr_getflags(@this, *args); end
		def flags(); LFP.spawnattr_getflags(@this); end

		# int (lfp_spawnattr_t *attr, pid_t *pgroup)
		def getpgroup(*args); LFP.spawnattr_getpgroup(@this, *args); end
		def pgroup(); LFP.spawnattr_getpgroup(@this); end

		# int (lfp_spawnattr_t *attr, lfp_rlimit_t **rlim, size_t *rlim_size)
		def getrlimit(*args); LFP.spawnattr_getrlimit(@this, *args); end
		def rlimit(); LFP.spawnattr_getrlimit(@this); end

		# int (lfp_spawnattr_t *attr, struct sigset_t *sigdefault)
		def getsigdefault(*args); LFP.spawnattr_getsigdefault(@this, *args); end
		def sigdefault(); LFP.spawnattr_getsigdefault(@this); end

		# int (lfp_spawnattr_t *attr, struct sigset_t *sigmask)
		def getsigmask(*args); LFP.spawnattr_getsigmask(@this, *args); end
		def sigmask(); LFP.spawnattr_getsigmask(@this); end

		# int (lfp_spawnattr_t *attr, mode_t *umask)
		def getumask(*args); LFP.spawnattr_getumask(@this, *args); end
		def umask(); LFP.spawnattr_getumask(@this); end

		# int (lfp_spawnattr_t *attr)
		def init(*args); LFP.spawnattr_init(@this, *args); end

		# int (lfp_spawnattr_t *attr, const char *path)
		def setctty(*args); LFP.spawnattr_setctty(@this, *args); end
		def ctty=(value); LFP.spawnattr_setctty(@this, value); end

		# int (lfp_spawnattr_t *attr, const char *path)
		def setcwd(*args); LFP.spawnattr_setcwd(@this, *args); end
		def cwd=(value); LFP.spawnattr_setcwd(@this, value); end

		# int (lfp_spawnattr_t *attr, const unsigned int flags)
		def setflags(*args); LFP.spawnattr_setflags(@this, *args); end
		def flags=(value); LFP.spawnattr_setflags(@this, value); end

		# int (lfp_spawnattr_t *attr, const pid_t pgroup)
		def setpgroup(*args); LFP.spawnattr_setpgroup(@this, *args); end
		def pgroup=(value); LFP.spawnattr_setpgroup(@this, value); end

		# int (lfp_spawnattr_t *attr, const lfp_rlimit_t *rlim, size_t rlim_size)
		def setrlimit(*args); LFP.spawnattr_setrlimit(@this, *args); end
		def rlimit=(value); LFP.spawnattr_setrlimit(@this, value); end

		# int (lfp_spawnattr_t *attr)
		def setsid(*args); LFP.spawnattr_setsid(@this, *args); end
		def sid=(value); LFP.spawnattr_setsid(@this, value); end

		# int (lfp_spawnattr_t *attr, const struct sigset_t *sigdefault)
		def setsigdefault(*args); LFP.spawnattr_setsigdefault(@this, *args); end
		def sigdefault=(value); LFP.spawnattr_setsigdefault(@this, value); end

		# int (lfp_spawnattr_t *attr, const struct sigset_t *sigmask)
		def setsigmask(*args); LFP.spawnattr_setsigmask(@this, *args); end
		def sigmask=(value); LFP.spawnattr_setsigmask(@this, value); end

		# int (lfp_spawnattr_t *attr, const mode_t umask)
		def setumask(*args); LFP.spawnattr_setumask(@this, *args); end
		def umask=(value); LFP.spawnattr_setumask(@this, value); end

	end

	
	# methods
	
	# int (int sockfd, struct sockaddr *addr, socklen_t *addrlen, unsigned long int flags)
	attach_function :accept, :lfp_accept, [:int32, :pointer, :buffer_inout, :uint64], :int32
	
	# int (struct lfp_buildinfo *v)
	attach_function :buildinfo, :lfp_buildinfo, [Buildinfo.by_ref], :int32
	
	# int (void)
	attach_function :clearenv, :lfp_clearenv, [], :int32
	
	# int (int clk_id, struct timespec *res)
	attach_function :clock_getres, :lfp_clock_getres, [:int32, :pointer], :int32
	
	# int (int clk_id, struct timespec *tp)
	attach_function :clock_gettime, :lfp_clock_gettime, [:int32, :pointer], :int32
	
	# int (int clk_id, struct timespec *tp)
	attach_function :clock_settime, :lfp_clock_settime, [:int32, :pointer], :int32
	
	# int (struct opaque_ptr *dirp)
	attach_function :closedir, :lfp_closedir, [:pointer], :int32
	
	# void (void)
	attach_function :closelog, :lfp_closelog, [], :void
	
	# void *(struct cmsghdr *cmsg)
	attach_function :cmsg_data, :lfp_cmsg_data, [:pointer], :pointer
	
	# struct cmsghdr *(struct msghdr *msgh)
	attach_function :cmsg_firsthdr, :lfp_cmsg_firsthdr, [:pointer], :pointer
	
	# size_t (size_t length)
	attach_function :cmsg_len, :lfp_cmsg_len, [:size_t], :size_t
	
	# struct cmsghdr *(struct msghdr *msgh, struct cmsghdr *cmsg)
	attach_function :cmsg_nxthdr, :lfp_cmsg_nxthdr, [:pointer, :pointer], :pointer
	
	# size_t (size_t length)
	attach_function :cmsg_space, :lfp_cmsg_space, [:size_t], :size_t
	
	# int (const char *pathname, mode_t mode)
	attach_function :creat, :lfp_creat, [:string, :mode_t], :int32
	
	# int (void)
	attach_function :errno, :lfp_errno, [], :int32
	
	# int (const char *path, char *const argv[], char *const envp[])
	attach_function :execve, :lfp_execve, [:string, :pointer, :pointer], :int32
	
	# int (const char *file, char *const argv[], char *const envp[])
	attach_function :execvpe, :lfp_execvpe, [:string, :pointer, :pointer], :int32
	
	# void (int fd, struct opaque_ptr *set)
	attach_function :fd_clr, :lfp_fd_clr, [:int32, :pointer], :void
	
	# _Bool (int fd, struct opaque_ptr *set)
	attach_function :fd_isset, :lfp_fd_isset, [:int32, :pointer], :bool
	
	# void (int fd, struct opaque_ptr *set)
	attach_function :fd_set, :lfp_fd_set, [:int32, :pointer], :void
	
	# void (struct opaque_ptr *set)
	attach_function :fd_zero, :lfp_fd_zero, [:pointer], :void
	
	# int (int fd, struct stat *buf)
	attach_function :fstat, :lfp_fstat, [:int32, :pointer], :int32
	
	# int (int fd, off_t length)
	attach_function :ftruncate, :lfp_ftruncate, [:int32, :off_t], :int32
	
	# char **(void)
	attach_function :get_environ, :lfp_get_environ, [], :pointer
	
	# char *(char *const envp[])
	attach_function :getpath, :lfp_getpath, [:pointer], :string
	
	# int (int socket, uid_t *euid, gid_t *egid)
	attach_function :getpeereid, :lfp_getpeereid, [:int32, :buffer_inout, :buffer_inout], :int32
	
	# int (int resource, struct rlimit *rlim)
	attach_function :getrlimit, :lfp_getrlimit, [:int32, :pointer], :int32
	
	# int (int fd)
	attach_function :is_fd_cloexec, :lfp_is_fd_cloexec, [:int32], :int32
	
	# int (int fd)
	attach_function :is_fd_nonblock, :lfp_is_fd_nonblock, [:int32], :int32
	
	# int (int fd)
	attach_function :is_fd_open, :lfp_is_fd_open, [:int32], :int32
	
	# _Bool (mode_t mode)
	attach_function :isblk, :lfp_isblk, [:mode_t], :bool
	
	# _Bool (mode_t mode)
	attach_function :ischr, :lfp_ischr, [:mode_t], :bool
	
	# _Bool (mode_t mode)
	attach_function :isdir, :lfp_isdir, [:mode_t], :bool
	
	# _Bool (mode_t mode)
	attach_function :isfifo, :lfp_isfifo, [:mode_t], :bool
	
	# _Bool (mode_t mode)
	attach_function :islnk, :lfp_islnk, [:mode_t], :bool
	
	# _Bool (mode_t mode)
	attach_function :isreg, :lfp_isreg, [:mode_t], :bool
	
	# _Bool (mode_t mode)
	attach_function :issock, :lfp_issock, [:mode_t], :bool
	
	# int (int priority)
	attach_function :log_mask, :lfp_log_mask, [:int32], :int32
	
	# int (int priority)
	attach_function :log_upto, :lfp_log_upto, [:int32], :int32
	
	# off_t (int fd, off_t offset, int whence)
	attach_function :lseek, :lfp_lseek, [:int32, :off_t, :int32], :off_t
	
	# int (const char *path, struct stat *buf)
	attach_function :lstat, :lfp_lstat, [:string, :pointer], :int32
	
	# int (char *tmplate, unsigned long int flags)
	attach_function :mkostemp, :lfp_mkostemp, [:buffer_inout, :uint64], :int32
	
	# int (char *tmplate)
	attach_function :mkstemp, :lfp_mkstemp, [:buffer_inout], :int32
	
	# void *(void *addr, size_t length, int prot, int flags, int fd, off_t offset)
	attach_function :mmap, :lfp_mmap, [:buffer_inout, :size_t, :int32, :int32, :int32, :off_t], :pointer
	
	# int (void *addr, size_t length)
	attach_function :munmap, :lfp_munmap, [:buffer_inout, :size_t], :int32
	
	# int (int incr, int *new_nice)
	attach_function :nice_k, :lfp_nice_k, [:int32, :buffer_inout], :int32
	
	# int (int *newfd, const char *pathname, unsigned long int flags, mode_t mode)
	attach_function :open_k, :lfp_open_k, [:buffer_inout, :string, :uint64, :mode_t], :int32
	
	# struct opaque_ptr *(const char *name)
	attach_function :opendir, :lfp_opendir, [:string], :pointer
	
	# void (const char *ident, int options, int facility)
	attach_function :openlog, :lfp_openlog, [:string, :int32, :int32], :void
	
	# int (unsigned long int flags)
	attach_function :openpt, :lfp_openpt, [:uint64], :int32
	
	# long int (const char *s, enum lfp_memsize_measure_unit default_unit)
	attach_function :parse_memsize, :lfp_parse_memsize, [:string, :memsize_measure_unit], :int64
	
	# int (int pipefd[2], unsigned long int flags)
	attach_function :pipe, :lfp_pipe, [:buffer_in, :uint64], :int32
	
	# ssize_t (int fd, void *buf, size_t count, off_t offset)
	attach_function :pread, :lfp_pread, [:int32, :buffer_inout, :size_t, :off_t], :ssize_t
	
	# int (int masterfd, char *buf, size_t buflen)
	attach_function :ptsname, :lfp_ptsname, [:int32, :buffer_inout, :size_t], :int32
	
	# ssize_t (int fd, const void *buf, size_t count, off_t offset)
	attach_function :pwrite, :lfp_pwrite, [:int32, :buffer_inout, :size_t, :off_t], :ssize_t
	
	# int (struct opaque_ptr *dirp, struct dirent *entry, struct dirent **result)
	attach_function :readdir, :lfp_readdir, [:pointer, :pointer, :pointer], :int32
	
	# void (struct opaque_ptr *dirp)
	attach_function :rewinddir, :lfp_rewinddir, [:pointer], :void
	
	# void (struct opaque_ptr *dirp, long int offset)
	attach_function :seekdir, :lfp_seekdir, [:pointer, :int64], :void
	
	# int (int nfds, struct opaque_ptr *readfds, struct opaque_ptr *writefds, struct opaque_ptr *exceptfds, const struct timespec *timeout)
	attach_function :select, :lfp_select, [:int32, :pointer, :pointer, :pointer, :pointer], :int32
	
	# ssize_t (int out_fd, int in_fd, off_t offset, size_t nbytes)
	attach_function :sendfile, :lfp_sendfile, [:int32, :int32, :off_t, :size_t], :ssize_t
	
	# int (char **newenv)
	attach_function :set_environ, :lfp_set_environ, [:buffer_inout], :int32
	
	# int (int value)
	attach_function :set_errno, :lfp_set_errno, [:int32], :int32
	
	# int (int fd, _Bool enabled)
	attach_function :set_fd_cloexec, :lfp_set_fd_cloexec, [:int32, :bool], :int32
	
	# int (int fd, _Bool enabled)
	attach_function :set_fd_nonblock, :lfp_set_fd_nonblock, [:int32, :bool], :int32
	
	# int (int maskpri)
	attach_function :setlogmask, :lfp_setlogmask, [:int32], :int32
	
	# int (int resource, const struct rlimit *rlim)
	attach_function :setrlimit, :lfp_setrlimit, [:int32, :pointer], :int32
	
	# lfp_sighandler_t (void)
	attach_function :sig_dfl, :lfp_sig_dfl, [], :sighandler
	
	# lfp_sighandler_t (void)
	attach_function :sig_err, :lfp_sig_err, [], :sighandler
	
	# lfp_sighandler_t (void)
	attach_function :sig_hold, :lfp_sig_hold, [], :sighandler
	
	# lfp_sighandler_t (void)
	attach_function :sig_ign, :lfp_sig_ign, [], :sighandler
	
	# int (void)
	attach_function :sigrtmax, :lfp_sigrtmax, [], :int32
	
	# int (void)
	attach_function :sigrtmin, :lfp_sigrtmin, [], :int32
	
	# int (int domain, int type, int protocol, unsigned long int flags)
	attach_function :socket, :lfp_socket, [:int32, :int32, :int32, :uint64], :int32
	
	# int (pid_t *restrict pid, const char *restrict path, char *const argv[], char *const envp[], const lfp_spawn_file_actions_t *restrict file_actions, const lfp_spawnattr_t *restrict attr)
	attach_function :spawn, :lfp_spawn, [:buffer_inout, :string, :pointer, :pointer, :pointer, :pointer], :int32
	
	# int (pid_t *restrict pid, const char *restrict file, char *const argv[], char *const envp[], const lfp_spawn_file_actions_t *restrict file_actions, const lfp_spawnattr_t *restrict attr)
	attach_function :spawnp, :lfp_spawnp, [:buffer_inout, :string, :pointer, :pointer, :pointer, :pointer], :int32
	
	# int (const char *path, struct stat *buf)
	attach_function :stat, :lfp_stat, [:string, :pointer], :int32
	
	# char *(const char *s, size_t maxlen)
	attach_function :strndup, :lfp_strndup, [:string, :size_t], :string
	
	# size_t (const char *s, size_t maxlen)
	attach_function :strnlen, :lfp_strnlen, [:string, :size_t], :size_t
	
	# long int (struct opaque_ptr *dirp)
	attach_function :telldir, :lfp_telldir, [:pointer], :int64
	
	# int (const char *path, off_t length)
	attach_function :truncate, :lfp_truncate, [:string, :off_t], :int32
	
	# void (int priority, const char *msg, va_list args)
	attach_function :vsyslog, :lfp_vsyslog, [:int32, :string, :pointer], :void
	
	# _Bool (int status)
	attach_function :wcoredump, :lfp_wcoredump, [:int32], :bool
	
	# int (int status)
	attach_function :wexitstatus, :lfp_wexitstatus, [:int32], :int32
	
	# _Bool (int status)
	attach_function :wifcontinued, :lfp_wifcontinued, [:int32], :bool
	
	# _Bool (int status)
	attach_function :wifexited, :lfp_wifexited, [:int32], :bool
	
	# _Bool (int status)
	attach_function :wifsignaled, :lfp_wifsignaled, [:int32], :bool
	
	# _Bool (int status)
	attach_function :wifstopped, :lfp_wifstopped, [:int32], :bool
	
	# int (int status)
	attach_function :wstopsig, :lfp_wstopsig, [:int32], :int32
	
	# int (int status)
	attach_function :wtermsig, :lfp_wtermsig, [:int32], :int32
	
	# int (lfp_spawn_file_actions_t *file_actions, int fd)
	attach_function :spawn_file_actions_addclose, :lfp_spawn_file_actions_addclose, [:pointer, :int32], :int32
	
	# int (lfp_spawn_file_actions_t *file_actions, int fd, int newfd)
	attach_function :spawn_file_actions_adddup2, :lfp_spawn_file_actions_adddup2, [:pointer, :int32, :int32], :int32
	
	# int (lfp_spawn_file_actions_t *file_actions, int fd)
	attach_function :spawn_file_actions_addkeep, :lfp_spawn_file_actions_addkeep, [:pointer, :int32], :int32
	
	# int (lfp_spawn_file_actions_t *file_actions, int fd, const char *path, unsigned long int oflags, mode_t mode)
	attach_function :spawn_file_actions_addopen, :lfp_spawn_file_actions_addopen, [:pointer, :int32, :string, :uint64, :mode_t], :int32
	
	# int (lfp_spawn_file_actions_t *file_actions)
	attach_function :spawn_file_actions_destroy, :lfp_spawn_file_actions_destroy, [:pointer], :int32
	
	# int (lfp_spawn_file_actions_t *file_actions)
	attach_function :spawn_file_actions_init, :lfp_spawn_file_actions_init, [:pointer], :int32
	
	# int (lfp_spawnattr_t *attr)
	attach_function :spawnattr_destroy, :lfp_spawnattr_destroy, [:pointer], :int32
	
	# int (lfp_spawnattr_t *attr, char **path)
	attach_function :spawnattr_getctty, :lfp_spawnattr_getctty, [:pointer, :buffer_inout], :int32
	
	# int (lfp_spawnattr_t *attr, char **path)
	attach_function :spawnattr_getcwd, :lfp_spawnattr_getcwd, [:pointer, :buffer_inout], :int32
	
	# int (lfp_spawnattr_t *attr, unsigned int *flags)
	attach_function :spawnattr_getflags, :lfp_spawnattr_getflags, [:pointer, :buffer_inout], :int32
	
	# int (lfp_spawnattr_t *attr, pid_t *pgroup)
	attach_function :spawnattr_getpgroup, :lfp_spawnattr_getpgroup, [:pointer, :buffer_inout], :int32
	
	# int (lfp_spawnattr_t *attr, lfp_rlimit_t **rlim, size_t *rlim_size)
	attach_function :spawnattr_getrlimit, :lfp_spawnattr_getrlimit, [:pointer, :pointer, :buffer_inout], :int32
	
	# int (lfp_spawnattr_t *attr, struct sigset_t *sigdefault)
	attach_function :spawnattr_getsigdefault, :lfp_spawnattr_getsigdefault, [:pointer, :pointer], :int32
	
	# int (lfp_spawnattr_t *attr, struct sigset_t *sigmask)
	attach_function :spawnattr_getsigmask, :lfp_spawnattr_getsigmask, [:pointer, :pointer], :int32
	
	# int (lfp_spawnattr_t *attr, mode_t *umask)
	attach_function :spawnattr_getumask, :lfp_spawnattr_getumask, [:pointer, :buffer_inout], :int32
	
	# int (lfp_spawnattr_t *attr)
	attach_function :spawnattr_init, :lfp_spawnattr_init, [:pointer], :int32
	
	# int (lfp_spawnattr_t *attr, const char *path)
	attach_function :spawnattr_setctty, :lfp_spawnattr_setctty, [:pointer, :string], :int32
	
	# int (lfp_spawnattr_t *attr, const char *path)
	attach_function :spawnattr_setcwd, :lfp_spawnattr_setcwd, [:pointer, :string], :int32
	
	# int (lfp_spawnattr_t *attr, const unsigned int flags)
	attach_function :spawnattr_setflags, :lfp_spawnattr_setflags, [:pointer, :uint32], :int32
	
	# int (lfp_spawnattr_t *attr, const pid_t pgroup)
	attach_function :spawnattr_setpgroup, :lfp_spawnattr_setpgroup, [:pointer, :pid_t], :int32
	
	# int (lfp_spawnattr_t *attr, const lfp_rlimit_t *rlim, size_t rlim_size)
	attach_function :spawnattr_setrlimit, :lfp_spawnattr_setrlimit, [:pointer, :pointer, :size_t], :int32
	
	# int (lfp_spawnattr_t *attr)
	attach_function :spawnattr_setsid, :lfp_spawnattr_setsid, [:pointer], :int32
	
	# int (lfp_spawnattr_t *attr, const struct sigset_t *sigdefault)
	attach_function :spawnattr_setsigdefault, :lfp_spawnattr_setsigdefault, [:pointer, :pointer], :int32
	
	# int (lfp_spawnattr_t *attr, const struct sigset_t *sigmask)
	attach_function :spawnattr_setsigmask, :lfp_spawnattr_setsigmask, [:pointer, :pointer], :int32
	
	# int (lfp_spawnattr_t *attr, const mode_t umask)
	attach_function :spawnattr_setumask, :lfp_spawnattr_setumask, [:pointer, :mode_t], :int32
	
end
