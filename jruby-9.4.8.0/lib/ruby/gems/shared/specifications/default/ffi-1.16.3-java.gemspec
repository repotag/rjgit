# -*- encoding: utf-8 -*-
# stub: ffi 1.16.3 java lib

Gem::Specification.new do |s|
  s.name = "ffi".freeze
  s.version = "1.16.3"
  s.platform = "java".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/ffi/ffi/issues", "changelog_uri" => "https://github.com/ffi/ffi/blob/master/CHANGELOG.md", "documentation_uri" => "https://github.com/ffi/ffi/wiki", "mailing_list_uri" => "http://groups.google.com/group/ruby-ffi", "source_code_uri" => "https://github.com/ffi/ffi/", "wiki_uri" => "https://github.com/ffi/ffi/wiki" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Wayne Meissner".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIEBDCCAmygAwIBAgIBAjANBgkqhkiG9w0BAQsFADAoMSYwJAYDVQQDDB1sYXJz\nL0RDPWdyZWl6LXJlaW5zZG9yZi9EQz1kZTAeFw0yMzAyMTUxNzQxMTVaFw0yNDAy\nMTUxNzQxMTVaMCgxJjAkBgNVBAMMHWxhcnMvREM9Z3JlaXotcmVpbnNkb3JmL0RD\nPWRlMIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAwum6Y1KznfpzXOT/\nmZgJTBbxZuuZF49Fq3K0WA67YBzNlDv95qzSp7V/7Ek3NCcnT7G+2kSuhNo1FhdN\neSDO/moYebZNAcu3iqLsuzuULXPLuoU0GsMnVMqV9DZPh7cQHE5EBZ7hlzDBK7k/\n8nBMvR0mHo77kIkapHc26UzVq/G0nKLfDsIHXVylto3PjzOumjG6GhmFN4r3cP6e\nSDfl1FSeRYVpt4kmQULz/zdSaOH3AjAq7PM2Z91iGwQvoUXMANH2v89OWjQO/NHe\nJMNDFsmHK/6Ji4Kk48Z3TyscHQnipAID5GhS1oD21/WePdj7GhmbF5gBzkV5uepd\neJQPgWGwrQW/Z2oPjRuJrRofzWfrMWqbOahj9uth6WSxhNexUtbjk6P8emmXOJi5\nchQPnWX+N3Gj+jjYxqTFdwT7Mj3pv1VHa+aNUbqSPpvJeDyxRIuo9hvzDaBHb/Cg\n9qRVcm8a96n4t7y2lrX1oookY6bkBaxWOMtWlqIprq8JZXM9AgMBAAGjOTA3MAkG\nA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQWBBQ4h1tIyvdUWtMI739xMzTR\n7EfMFzANBgkqhkiG9w0BAQsFAAOCAYEAQAcuTARfiiVUVx5KURICfdTM2Kd7LhOn\nqt3Vs4ANGvT226LEp3RnQ+kWGQYMRb3cw3LY2TNQRPlnZxE994mgjBscN4fbjXqO\nT0JbVpeszRZa5k1goggbnWT7CO7yU7WcHh13DaSubY7HUpAJn2xz9w2stxQfN/EE\nVMlnDJ1P7mUHAvpK8X9j9h7Xlc1niViT18MYwux8mboVTryrLr+clATUkkM3yBF0\nRV+c34ReW5eXO9Tr6aKTxh/pFC9ggDT6jOxuJgSvG8HWJzVf4NDvMavIas4KYjiI\nBU6CpWaG5NxicqL3BERi52U43HV08br+LNVpb7Rekgve/PJuSFnAR015bhSRXe5U\nvBioD1qW2ZW9tXg8Ww2IfDaO5a1So5Xby51rhNlyo6ATj2NkuLWZUKPKHhAz0TKm\nDzx/gFSOrRoCt2mXNgrmcAfr386AfaMvCh7cXqdxZwmVo7ILZCYXck0pajvubsDd\nNUIIFkVXvd1odFyK9LF1RFAtxn/iAmpx\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2023-10-04"
  s.description = "Ruby FFI library".freeze
  s.email = "wmeissner@gmail.com".freeze
  s.files = ["CHANGELOG.md".freeze, "COPYING".freeze, "Gemfile".freeze, "LICENSE".freeze, "LICENSE.SPECS".freeze, "README.md".freeze, "Rakefile".freeze, "ffi.gemspec".freeze, "lib/ffi.rb".freeze, "lib/ffi/abstract_memory.rb".freeze, "lib/ffi/autopointer.rb".freeze, "lib/ffi/buffer.rb".freeze, "lib/ffi/callback.rb".freeze, "lib/ffi/compat.rb".freeze, "lib/ffi/data_converter.rb".freeze, "lib/ffi/dynamic_library.rb".freeze, "lib/ffi/enum.rb".freeze, "lib/ffi/errno.rb".freeze, "lib/ffi/ffi.rb".freeze, "lib/ffi/function.rb".freeze, "lib/ffi/io.rb".freeze, "lib/ffi/library.rb".freeze, "lib/ffi/library_path.rb".freeze, "lib/ffi/managedstruct.rb".freeze, "lib/ffi/memorypointer.rb".freeze, "lib/ffi/platform.rb".freeze, "lib/ffi/platform/aarch64-darwin/types.conf".freeze, "lib/ffi/platform/aarch64-freebsd/types.conf".freeze, "lib/ffi/platform/aarch64-freebsd12/types.conf".freeze, "lib/ffi/platform/aarch64-linux/types.conf".freeze, "lib/ffi/platform/aarch64-openbsd/types.conf".freeze, "lib/ffi/platform/aarch64-windows/types.conf".freeze, "lib/ffi/platform/arm-freebsd/types.conf".freeze, "lib/ffi/platform/arm-freebsd12/types.conf".freeze, "lib/ffi/platform/arm-linux/types.conf".freeze, "lib/ffi/platform/hppa1.1-linux/types.conf".freeze, "lib/ffi/platform/hppa2.0-linux/types.conf".freeze, "lib/ffi/platform/i386-cygwin/types.conf".freeze, "lib/ffi/platform/i386-darwin/types.conf".freeze, "lib/ffi/platform/i386-freebsd/types.conf".freeze, "lib/ffi/platform/i386-freebsd12/types.conf".freeze, "lib/ffi/platform/i386-gnu/types.conf".freeze, "lib/ffi/platform/i386-linux/types.conf".freeze, "lib/ffi/platform/i386-netbsd/types.conf".freeze, "lib/ffi/platform/i386-openbsd/types.conf".freeze, "lib/ffi/platform/i386-solaris/types.conf".freeze, "lib/ffi/platform/i386-windows/types.conf".freeze, "lib/ffi/platform/ia64-linux/types.conf".freeze, "lib/ffi/platform/loongarch64-linux/types.conf".freeze, "lib/ffi/platform/mips-linux/types.conf".freeze, "lib/ffi/platform/mips64-linux/types.conf".freeze, "lib/ffi/platform/mips64el-linux/types.conf".freeze, "lib/ffi/platform/mipsel-linux/types.conf".freeze, "lib/ffi/platform/mipsisa32r6-linux/types.conf".freeze, "lib/ffi/platform/mipsisa32r6el-linux/types.conf".freeze, "lib/ffi/platform/mipsisa64r6-linux/types.conf".freeze, "lib/ffi/platform/mipsisa64r6el-linux/types.conf".freeze, "lib/ffi/platform/powerpc-aix/types.conf".freeze, "lib/ffi/platform/powerpc-darwin/types.conf".freeze, "lib/ffi/platform/powerpc-linux/types.conf".freeze, "lib/ffi/platform/powerpc-openbsd/types.conf".freeze, "lib/ffi/platform/powerpc64-linux/types.conf".freeze, "lib/ffi/platform/powerpc64le-linux/types.conf".freeze, "lib/ffi/platform/riscv64-linux/types.conf".freeze, "lib/ffi/platform/s390-linux/types.conf".freeze, "lib/ffi/platform/s390x-linux/types.conf".freeze, "lib/ffi/platform/sparc-linux/types.conf".freeze, "lib/ffi/platform/sparc-solaris/types.conf".freeze, "lib/ffi/platform/sparcv9-linux/types.conf".freeze, "lib/ffi/platform/sparcv9-openbsd/types.conf".freeze, "lib/ffi/platform/sparcv9-solaris/types.conf".freeze, "lib/ffi/platform/sw_64-linux/types.conf".freeze, "lib/ffi/platform/x86_64-cygwin/types.conf".freeze, "lib/ffi/platform/x86_64-darwin/types.conf".freeze, "lib/ffi/platform/x86_64-dragonflybsd/types.conf".freeze, "lib/ffi/platform/x86_64-freebsd/types.conf".freeze, "lib/ffi/platform/x86_64-freebsd12/types.conf".freeze, "lib/ffi/platform/x86_64-haiku/types.conf".freeze, "lib/ffi/platform/x86_64-linux/types.conf".freeze, "lib/ffi/platform/x86_64-msys/types.conf".freeze, "lib/ffi/platform/x86_64-netbsd/types.conf".freeze, "lib/ffi/platform/x86_64-openbsd/types.conf".freeze, "lib/ffi/platform/x86_64-solaris/types.conf".freeze, "lib/ffi/platform/x86_64-windows/types.conf".freeze, "lib/ffi/pointer.rb".freeze, "lib/ffi/struct.rb".freeze, "lib/ffi/struct_by_reference.rb".freeze, "lib/ffi/struct_layout.rb".freeze, "lib/ffi/struct_layout_builder.rb".freeze, "lib/ffi/tools/const_generator.rb".freeze, "lib/ffi/tools/generator.rb".freeze, "lib/ffi/tools/generator_task.rb".freeze, "lib/ffi/tools/struct_generator.rb".freeze, "lib/ffi/tools/types_generator.rb".freeze, "lib/ffi/types.rb".freeze, "lib/ffi/union.rb".freeze, "lib/ffi/variadic.rb".freeze, "lib/ffi/version.rb".freeze, "rakelib/ffi_gem_helper.rb".freeze, "samples/getlogin.rb".freeze, "samples/getpid.rb".freeze, "samples/gettimeofday.rb".freeze, "samples/hello.rb".freeze, "samples/hello_ractor.rb".freeze, "samples/inotify.rb".freeze, "samples/pty.rb".freeze, "samples/qsort.rb".freeze, "samples/qsort_ractor.rb".freeze]
  s.homepage = "https://github.com/ffi/ffi/wiki".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.rdoc_options = ["--exclude=ext/ffi_c/.*\\.o$".freeze, "--exclude=ffi_c\\.(bundle|so)$".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Ruby FFI".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rake-compiler>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<rake-compiler-dock>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 2.14.1"])
  else
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rake-compiler>.freeze, ["~> 1.1"])
    s.add_dependency(%q<rake-compiler-dock>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.14.1"])
  end
end
