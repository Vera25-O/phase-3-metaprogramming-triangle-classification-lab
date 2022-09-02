class Triangle
  attr_reader :m, :n, :p

  def initialize(m, n, p)
    @m = m
    @n = n
    @p = p
  end

  def kind
    validate_triangle
    if m == n && n == p
      :equilateral
    elsif m == n || n == p || m == p
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [m, n, p].all?(&:positive?)
  end

  def valid_triangle_inequality?
    m + n > p && m + p > n && n + p > m
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end
  # write code here
end
