class Queue
  def initialize
    @que_array = []
  end

  def enqueue(el)
    @que_array.push(el)
    el
  end

  def dequeue
    @que_array.shift
  end

  def peek
    @que_array.first
  end

  private

  attr_reader :que_array
  
end
