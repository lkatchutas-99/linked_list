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
    @list.empty? ? 'There are no nodes' : @list[0].value
  end

  def tail
    @list.empty? ? 'There are no nodes' : @list[size - 1].value
  end

  def at(index)
    @list[index] || 'Invalid Index'
  end

  def pop
    return 'There are no nodes' if @list.empty?

    @list[size - 2].next_node = nil
    @list.pop
  end

  def contains?(value)
    return 'There are no nodes' if @list.empty?

    @list.select { |node| node.value == value }
  end

  def find(value)
    @list.find_index { |node| node.value == value } || 'Node not found'
  end

  def insert_at(value, index)
    return 'Index is too high or too low' unless index >= 0 && index <= size

    node = Node.new(value)
    @list.insert(index, node)
    @list[index].next_node = @list[index + 1] ? @list[index + 1].value : nil
    @list[index - 1].next_node = value unless index.zero?
  end

  def remove_at(index)
    return 'Node not found at index' if @list.empty? || index > size

    unless index.zero?
      @list[index - 1].next_node = @list[index + 1] ? @list[index + 1].value : nil
    end

    @list.delete_at(index)
  end

  def to_s
    if @list.empty?
      print '( nil )'
    else
      print "( #{@list[0].value} )"
      @list.each do |node|
        print " -> ( #{node.next_node.nil? ? 'nil' : node.next_node} )"
      end
    end
    puts ''
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
