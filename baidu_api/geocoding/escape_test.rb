#!/usr/bin/env ruby

require 'uri'

str = "http://api.map.baidu.com/geocoder?address=%E5%8C%97%E4%B8%80%E7%8E%AF%E8%B7%AF%E5%92%8C%E9%98%9C%E9%98%B3%E8%B7%AF%E7%9A%84%E4%BA%A4%E5%8F%89%E8%B7%AF%E5%8F%A3&output=json&key=37492c0ee6f924cb5e934fa08c6b1676"

unen_uri = URI.unescape(str)
p unen_uri
