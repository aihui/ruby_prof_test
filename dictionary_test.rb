require 'rubygems'
require 'ruby-prof'
#require "dictionary_array"
require "trie_dictionary"

search_text = "fr"
#-----switch file name to test small/big datasets
#file_name = "names.txt"
file_name = "products.csv"

#--- switch test to ensure correct filename is produced
#test = "array"
test = "trie"

file = File.open(file_name, "r")
d = Dictionary.new

#read file and put words into dictionary
RubyProf.start
  file.each do |data|
   d.add(data)
  end
result = RubyProf.stop
File.open "#{test}_#{file_name.slice(/\w*(?=\.\w*)/)}_addword.txt", 'w' do |file|
 RubyProf::FlatPrinter.new(result).print(file)
end


#find words that begin with fi
RubyProf.start
  found = d.find(search_text)
foundresult = RubyProf.stop  
File.open "#{test}_#{file_name.slice(/\w*(?=\.\w*)/)}_findword.txt", 'w' do |file|
	RubyProf::FlatPrinter.new(foundresult).print(file)
end

