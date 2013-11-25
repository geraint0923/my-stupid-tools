#!/usr/bin/env ruby
require 'pp'

count_map = Hash.new
total_count = 0

$field_set = ["ISP", "Country", "City"]

def check_ip(ip)
	result = Hash.new
	tag = ""
	`curl "http://www.checkip.com/ip/#{ip}" > /tmp/tmp.checklog 2> /dev/null`
	IO.foreach("/tmp/tmp.checklog") do |line|
		if tag == ""
			$field_set.each do |item|
				if line.include? item
#					puts item
					tag = item
				end
			end
		else
			res = line.chomp
#			puts "Field: #{tag}  -> Line: #{res}"
			if />([^<]+)</.match res
				result[tag] = $1
			end
			tag = ""
		end
	end
	return result
end



IO.foreach("access.log") do |line|
	next if not line.include? "facejoke.apk"
	total_count += 1
	str_list = line.split
	if not count_map.has_key? str_list[0]
		count_map[str_list[0]] = 0
	end
	count_map[str_list[0]] += 1
#	puts str_list[0]
end
puts "Total fetch: " + total_count.to_s
puts "Total IP: " + count_map.keys.count.to_s
count_map.keys.each do |key|
	m = check_ip(key)
	printf "%18s%8d%50s%20s%20s\n", key, count_map[key], m["ISP"], m["Country"], m["City"]
end
