#/usr/bin/env ruby

INPUT_FILE = "ip.count"

def locate_ip(ip)
#TODO should add ip look up code here
    puts ip
end

file = File.open(INPUT_FILE)
res = Hash.new
file.each_line do |line|
    sl = line.split
    val = Hash.new
    val[:count] = sl[1]
    res[sl[0]] = val
end

#just for test
res.each do |key, val|
    puts "#{key}---#{val}"
end
