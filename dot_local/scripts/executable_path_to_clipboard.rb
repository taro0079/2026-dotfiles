#!/usr/bin/env bundle exec ruby
require 'clipboard'

file_path = ARGV[0]
line = ARGV[1]
Clipboard.copy("#{file_path}:#{line}")
puts 'Copied to clipboard:'
