class Route
  attr_accessor :route

  def initialize(starting, final)
    @route = [] << starting << final
  end

  def add_route(*new_route)
    new_route.each do |r|
      @route.insert(@route.size - 1, r)
    end
  end

  def delete_way(way)
    @route.delete(way)
  end

  def show_way
    @route.each {|x| puts x.name}
  end
end
