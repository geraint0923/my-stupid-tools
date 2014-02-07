#!/usr/bin/env ruby

require 'uri'
require 'net/http'
require 'json'

USER_KEY = "37492c0ee6f924cb5e934fa08c6b1676"

def nget(origin_req)
    JSON.parse(Net::HTTP.get(URI(URI.escape(origin_req))))
end

def addr_resolve(addr, city_name)
    origin_req = "http://api.map.baidu.com/geocoder?address=#{addr}&output=json&key=#{USER_KEY}&city=#{city_name}"
    nget origin_req
end

def addr_reverse(lat, lng)
    origin_req = "http://api.map.baidu.com/geocoder?location=#{lat},#{lng}&output=json&key=#{USER_KEY}"
    nget origin_req
end

res = addr_resolve("百度大厦", "北京")
puts res
