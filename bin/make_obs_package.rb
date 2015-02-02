#!/usr/bin/env ruby

require 'fileutils'
require 'date'
require 'erb'

version_major = 2
version_minor = 2
version_patch = 0

package_version = "#{ version_major }.#{ version_minor }"
ruby_version = "#{ version_major }.#{ version_minor }.#{ version_patch }"
suffix = ''
version = "#{ package_version }~#{suffix}"

user_name  = `git config user.name`.chomp
user_email = `git config user.email`.chomp
user = "#{user_name} <#{user_email}>"

compat = 8

build_deps = [
  'debhelper (>= 9.0)',
  'make',
  'libc6-dev',
  'patch',
  'openssl',
  'ca-certificates',
  'libreadline6',
  'libreadline6-dev',
  'zlib1g',
  'zlib1g-dev',
  'libssl-dev',
  'libyaml-dev',
  'libsqlite3-dev',
  'sqlite3',
  'autoconf',
  'libgdbm-dev',
  'libncurses5-dev',
  'automake',
  'libtool',
  'bison',
  'pkg-config',
  'libffi-dev',
  'libjemalloc-dev (>= 3.5)',
].join(', ')


root_dir = File.expand_path('../../', __FILE__)
out_dir = File.join(root_dir, 'out')
FileUtils.rm_r(out_dir)
Dir.mkdir(out_dir)

templates_dir = File.join(root_dir, 'templates', '*.erb')
Dir.glob(templates_dir) do |template|
  file_name = File.basename(template, '.erb')
  out_file = File.join(out_dir, file_name)
  erb = ERB.new(File.read(template))
  result = erb.result(binding)
  File.write(out_file, result)
end
