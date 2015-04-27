class DiyHash

  define_method(:initialize) do
    @key_array = []
    @value_array = []
  end

  define_method(:store) do |key, value|
    is_replacing = false
    @key_array.each_index() do |index|
      if (key == @key_array[index])
        @value_array[index] = value
        is_replacing = true
      end
    end
    if (!is_replacing)
      @key_array.push(key)
      @value_array.push(value)
    end
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
    hash_to_merge.get_keys().each() do |key|
      store(key, hash_to_merge.fetch(key))
    end
  end

  define_method(:get_keys) do
    return @key_array
  end

  define_method(:get_values) do
    return @value_array
  end

end
