#!/usr/bin/env ruby

def URLDecode(str)
    str.gsub!(/%[a-fA-F0-9]{2}/) { |x| x = x[1..2].hex.chr }
end

def URLEncode(str)
    str.gsub!(/[^\w$&\-+.,\/:;=?@]/) { |x| x = format("%%%x", x[0]) }
end
