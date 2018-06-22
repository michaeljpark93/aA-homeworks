class Map
  def initialize
    @map_array = []
  end

  def set(key, value)
    if @map_array.none? { |el| el[0] == key }
      kv_pair = [key, value]
      @map_array << kv_pair
    else
      @map_array.index do |k|
        if @map_array[0] == key
          @map_array[k][1] = value
        end
      end
    end
    value
  end

  def get(key)
    @map_array.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end
    nil
  end

  def delete(key)
    value = get(key)
    @map_array.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(@map_array)
  end

  private

  attr_reader :map_array

  def deep_dup(arr)
    @map_array.map do |el|
      if el.is_a?(Array)
        deep_dup(el)
      else
        el
      end
    end
  end

end
