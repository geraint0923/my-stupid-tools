#/usr/bin/env ruby

require 'net/http'
require 'json'

INPUT_FILE = "ip.count"
API_URL = "http://ip-api.com/json/"
#API_URL = "http://freegeoip.net/json/"
#API_URL = "http://www.telize.com/geoip/"
TAGS = ["ISP", "Country", "City", "Region"]
TAGS_LENGTH = Hash.new
CUR_INDEX = 0

def locate_ip(ip)
    $stderr.puts CUR_INDEX.to_s + ": " + API_URL + ip
    JSON.parse(Net::HTTP.get(URI(API_URL + ip)))
end

if ARGV.length > 0
	INPUT_FILE = ARGV[0]
end

file = File.open(INPUT_FILE)
res = Hash.new
file.each_line do |line|
    sl = line.split
    val = Hash.new
    val["count"] = sl[1]
    vv = locate_ip sl[0]
    CUR_INDEX += 1
    $stderr.puts vv
    vv.each do |kk, vv|
	val[kk] = vv
	if TAGS_LENGTH.include?(kk)
	    TAGS_LENGTH[kk] = vv.to_s.length if TAGS_LENGTH[kk] < vv.to_s.length
	else
	    TAGS_LENGTH[kk] = vv.to_s.length
	end
    end
    res[sl[0]] = val
end

printf("%16s%12s", "IP", "Count")
TAGS.each do |k|
    kk = k.downcase
    TAGS_LENGTH[kk] = 12 if TAGS_LENGTH[kk] < 12
    TAGS_LENGTH[kk] = '%' + (TAGS_LENGTH[kk] + 5).to_s + 's'
    printf(TAGS_LENGTH[kk], k)
end
puts

res.each do |key, val|
    printf("%16s%12d", key, val["count"])
    TAGS.each do |v|
	printf(TAGS_LENGTH[v.downcase], val[v.downcase].to_s)
    end
    puts
end
