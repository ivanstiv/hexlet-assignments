# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  def test_stack_push
  	stack = Stack.new
  	stack.push! 'ruby'
  	assert { stack.size == 1 }
  end

  def test_del
  	stack = Stack.new
  	stack.push! 'java'
    stack.pop!
    assert { stack.size == 0 }
  end

  def test_clear_stack
  	stack = Stack.new
  	stack.push! 'php'
  	stack.clear!
  	assert { stack.size == 0 }
  end

  def test_stacking
    stack = Stack.new
    stack.push! 'python'
    stack.clear!    
    assert { stack.empty? == true }
  end
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?