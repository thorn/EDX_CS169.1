class String
  def anagram_for?(word)
    return false if word.object_id == self.object_id
    self.downcase.split('').uniq.sort == word.downcase.split('').uniq.sort
  end
end

def check_for_anagram(list, word)
  current_group = list.inject([word]) do |res, wrd|
    if wrd.anagram_for?(word)
      res << wrd
      list.delete_at(list.index(wrd))
    end
    res
  end
  current_group
end

def combine_anagrams(words)
  res = words.inject([]) do |res, word|
    res << check_for_anagram(words, word)
  end
  res
end

p combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'Scar', 'scar', 'creams', 'scream','scream', 'h', 'H', 'h'])
