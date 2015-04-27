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

  define_method(:merge) do |hash_to_merge|
    @key_array.concat(hash_to_merge.get_keys())
    @value_array.concat(hash_to_merge.get_values())
  end

  define_method(:get_keys) do
    return @key_array
  end

  define_method(:get_values) do
    return @value_array
  end

end
