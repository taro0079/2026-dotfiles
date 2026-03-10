#!/usr/bin/env bundle exec ruby

require 'active_support/all'

ARGF.each do |line|
  input = line.strip
  if input.include?('_')
    puts input.camelize(:lower)
  else
    puts input.underscore
  end
end
