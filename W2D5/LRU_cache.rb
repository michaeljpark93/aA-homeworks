class LRUCache
  def initialize(cache)
    @cache = Array.new(cache)
  end

  def count
    cache.reject { |el| el.nil? }.count
  end

  def add(el)
    if cache.include?(el)
      cache.delete(el)
      cache << el
    else
      cache.shift
      cache << el
    end
  end

  def show
    p cache
    nil
  end

  private

  attr_reader :cache
end

if $PROGRAM_NAME == __FILE__
  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end
