#!/usr/bin/env ruby

WORK_DIR = ARGV[0]

Dir.foreach(WORK_DIR) do |file|
	if file.to_s =~ /[0-9]+/
		if file.to_s =~ /(\([^\)]+\))\.mp4$/
			new_name = file.to_s.gsub(/\s*(\([^\)]+\))\.mp4$/, ".mp4")
			puts new_name
			`mv \"#{file.to_s}\" \"#{new_name}\"`
		end
	end
end
