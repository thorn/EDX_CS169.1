class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(val)
        @#{attr_name}_history ||= [nil]
        @#{attr_name}_history << val
        @#{attr_name}=val
      end
    }
  end
end

class Foo
    attr_accessor_with_history :bar
end

# f = Foo.new     # => #<Foo:0x127e678>
# puts f.bar = 3       # => 3
# puts f.bar = :wowzo  # => :wowzo
# puts f.bar = 'boo!'  # => 'boo!'
# puts f.bar
# p f.bar_history   # => [nil, 3, :wowzo, 'boo!']

