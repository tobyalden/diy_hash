class DiyHash

  define_method(:initialize) do
    @key_array = []
    @value_array = []
  end

  define_method(:store) do |key, value|
    @key_array.push(key)
    @value_array.push(value)
    print @key_array
    print @value_array
  end

  define_method(:fetch) do |key|
    @key_array.each_index() do |index|
      if(key == @key_array[index])
        return @value_array[index]
      end
    end
    return nil
  end

end
