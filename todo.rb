#!/usr/bin/env ruby
#encoding: utf-8

ci = `git diff HEAD^ HEAD`

out = ci
# [TODO: todo2]

new_todo = []
old_todo = []

ci.split('\n').each do |line|

end