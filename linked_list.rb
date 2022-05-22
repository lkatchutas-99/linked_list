# frozen_string_literal: false

# LinkedList
class LinkedList
  def initialize
    @list = []
  end

  def append(value)
    node = Node.new(value)
    @list[size - 1].next_node = value unless @list.empty?
    @list.push(node)
  end

  def prepend(value)
    node = Node.new(value)
    node.next_node = @list[0].value unless @list.empty?
    @list.unshift(node)
  end

  def size
    @list.length
  end

  def head
    @list[0] unless @list.empty?
  end

  def tail
    @list[size - 1] unless @list.empty?
  end

  def at(index)
    @list[index] unless @list.empty?
  end

  def pop
    return if @list.empty?

    @list[size - 2].next_node = nil
    @list.pop
  end

  def contains?(value)
    @list.value.include?(value)
  end

  def find(value)
    @list.find_index do |node|
      node.value == value
    end
  end

  def insert_at(value, index)
    node = Node.new(value)
    node.next_node = @list[index + 1]
    @list[index] = value
    @list.insert(index, node)
  end

  def remove_at(index)
    return if @list.empty?

    unless @list.length <= 1
      @list[index - 1].next_node = @list[index + 1] ? @list[index + 1].value : nil
    end
    @list.delete_at(index)
  end

  def to_s
    @list.each do |node|
      print "( #{node.value} ) -> "
    end
    puts 'nil'
  end
end

# Node
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
