#!/usr/bin/env ruby
#encoding: utf-8

ci = `git diff HEAD^ HEAD`

out = ci

puts ci

new_todo = []
old_todo = []

ext = 'rb'

def pt(todo,sign)
  puts "#{sign} : #{todo}"
end
# main
ci.split('\n').each do |line|
  file_ext = /diff --git a\/(\w*\/){0,}(\w*)\.(\w*)/.match(line)

  diff_line = /^[-|+]\s*/.match(line)

  if file_ext.nil? and not diff_line.nil?
    case ext
    when 'rb'
      # ruby source
      if line.gsub(/^[-|+]\s*/, "")[0] == '#'
        tm = /#\s*(\[TODO:)(.*)(\])/.match(line)

        todo = tm[2] if not tm.nil?
        todo.gsub!(/^\s*/,"").gsub!(/\s*$/,"")
        pt todo, line[0]
      end
    when 'php','java'
      # comment use // or /** */
    end
  elsif not file_ext.nil? and file_ext.size == 4
    ext = file_ext[3].downcase
  end


  todo = nil
end
