class Triangle
  attr_accessor :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    [side_a, side_b, side_c].each do |side|
      Triangle.validate_side(side)
    end
    Triangle.validate_inequality(side_a, side_b, side_c)

    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end

  def kind
    if side_a == side_b and side_a == side_c
      :equilateral
    elsif side_a != side_b and
      side_a != side_c and
      side_b != side_c
      :scalene
    else
      :isosceles
    end
  end

  private
  def self.validate_side(length)
    if length <= 0
      raise TriangleError
    end
  end

  def self.validate_inequality(a, b, c)
    unless a + b > c and b + c > a and a + c > b
      raise TriangleError
    end
  end

  public
  class TriangleError < StandardError

  end
end
