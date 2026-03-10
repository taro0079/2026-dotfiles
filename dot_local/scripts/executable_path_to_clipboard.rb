#!/usr/bin/env bundle exec ruby
require 'clipboard'

file_path = ARGV[0]
line = ARGV[1]
line_end = ARGV[2]
Clipboard.copy("#{file_path}:#{line}-#{line_end}")
puts 'Copied to clipboard:'
