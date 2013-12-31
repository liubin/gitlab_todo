#!/usr/bin/env ruby
#encoding: utf-8
# [TODO: test1 ]
git_cmd = "git log -1 HEAD -p "
ci = `#{git_cmd}`

puts ci
