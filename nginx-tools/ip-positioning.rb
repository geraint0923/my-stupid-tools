#/usr/bin/env ruby

require 'net/http'
require 'json'

INPUT_FILE = "ip.count"
#API_URL = "http://ip-api.com/json/"
#API_URL = "http://freegeoip.net/json/"
API_URL = "http://www.telize.com/geoip/"

def locate_ip(ip)
#TODO should add ip look up code here
#    puts ip
#    JSON.parse(Net::HTTP.get(URI(API_URL + ip)))
    puts API_URL + ip
    JSON.parse(Net::HTTP.get(URI(API_URL + ip)))
end

file = File.open(INPUT_FILE)
res = Hash.new
file.each_line do |line|
    sl = line.split
    val = Hash.new
    val[:count] = sl[1]
    vv = locate_ip sl[0]
    vv.each do |kk, vv|
	val[kk] = vv
    end
    res[sl[0]] = val
end

#just for test
res.each do |key, val|
    puts "#{key}---#{val}"
end
