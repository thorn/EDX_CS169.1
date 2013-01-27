class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')

    if @@currencies.has_key?(singular_currency)
      result = self * @@currencies[singular_currency]
      result.instance_variable_set("@currency", singular_currency)
      result
    else
      super
    end
  end

  def in(curr)
    self * @@currencies[@currency]
  end

end
p 6.euro.in(:dollar)
# 10 долларов в евро = 10 * 1 * 1/1.292

# 10 евро в долларах = 10 * 1.292 * 1/1

# 10 рупий в долларах = 10 * 0.019 * 1/1

# 10 рупий в евро = 10 * 0.019 * 1/1.292

class String
  def palindrome?
    cleared = self.split(/[^a-zA-Z]/i).reject{|s| s.empty? }.map(&:downcase).join('')
    cleared.reverse == cleared
  end
end

module Enumerable
  # YOUR CODE HERE
end
