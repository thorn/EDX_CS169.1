#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  cleared = str.split(/[^a-zA-Z]/i).reject{|s| s.empty? }.map(&:downcase).join('')
  cleared.reverse == cleared
end

def count_words(str)
  words = str.split(/[^a-zA-Z]/i).reject{|s| s.empty? }.map(&:downcase)
  b = Hash.new(0)
  words.each { |word| b[word] += 1}
  b
end
puts palindrome? "Madam, I'm Adam"
puts palindrome? "there goes the neighborhood"

#the code below this line will test your functions.  You should remove everything below this line prior to submitting your file


test_str = "there goes the neighborhood"

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end


test_str = "Madam, I'm Adam"

if palindrome? test_str
  puts test_str + " is a palindrome!"
else
  puts test_str + " is NOT a palindrome!"
end

test_str = "The rent is due on the first day of the month unless the first day of the month falls on a Saturday or Sunday"

word_count = count_words test_str
puts word_count
