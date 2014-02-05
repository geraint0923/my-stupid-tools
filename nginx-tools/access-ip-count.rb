#/usr/bib/env ruby

WORK_DIR = ARGV[0]
SUBSTR = ["access"]
TMP_FILE = "tmp.output"

def extract_file(file_path) 
    if file_path =~ /\.gz$/
	`gzcat #{file_path} >> #{TMP_FILE}`
    else
	`cat #{file_path} >> #{TMP_FILE}`
    end
end

def match_pattern?(file_name)
    name = File.basename file_name
    SUBSTR.each do |str|    
	return true if name.include? str
    end
    false
end

def walk_dir(work_dir)
    return if !File.directory?(work_dir)
    Dir.foreach(work_dir) do |base_filename|
	file = work_dir + "/" + base_filename
	next if File.directory? file
	extract_file(file) if match_pattern? file
    end
end

def extract_ip(file)
    f = File.open(file)
    res = Hash.new
    f.each_line  do |line| 
	ip = line.split[0]
	res[ip] = 0 if !res.include?(ip)
	res[ip] += 1
    end
    res
end
    
`rm -rf #{TMP_FILE}`
walk_dir WORK_DIR
res = extract_ip TMP_FILE
res.each do |key, val|
    puts "#{key} #{val}"
end
