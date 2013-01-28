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
    singular_currency = curr.to_s.gsub( /s$/, '')
    self / @@currencies[singular_currency]
  end

end

class String
  def palindrome?
    cleared = self.split(/[^a-zA-Z1-9]/i).reject{|s| s.empty? }.map(&:downcase).join('')
    p cleared
    cleared.reverse == cleared
  end
end

module Enumerable
  def palindrome?
    self.join(' ').palindrome?
  end
end
