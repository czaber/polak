# -*- encoding: utf-8 -*-

class FunctionCall < Struct.new(:name)
  def to_s
    "#{name}()"
  end

  def inspect
    "«#{self}»"
  end
end
