class Train
  attr_reader :number, :type

  def initialize(number, *type)
    @number = number
    @type = type
    @speed = 0
    @route
    @arr_station = []
    @have_route = false
    @train_now = nil
    @sum = 0
  end

  def type_train
    @type.each { |x| puts x}
  end

  def speed(arg)
    @speed += arg
  end

  def show_speed
    puts @speed
  end

  def stop
    @speed = 0
  end

  def show_carriages
    puts @type[1]
  end

  def show_route(arg = nil)
    if arg
      @route.show_way(@train_now)
     else
      @route.show_way
    end
  end

  def add_carrig
    if speed.zero?
      @type[1] += 1
    else
      puts "На ходу нельзя цеплять вагоны!"
    end
  end

  def delete_carrig
    if @type[1].zero?
      puts "Вагонов уже не осталось."
    elsif speed.zero?
      @type[1] -= 1
    else
      puts "На ходу нельзя отцеплять вагоны!"
    end
  end

  def add_route(route_train)
    @have_route = true
    @route = route_train
    @route.route.each { |x| @arr_station << x}
    @arr_station[@sum].get_train(self)
    @train_now = @arr_station[@sum]
  end

  def go(step)
    @sum += step #счетчик

    #проверяет конечный ли маршрут, сравнивая счетчик с размером массива - 1
    #прерывает движение по маршруту и устанавливает счетчик в максимальное значение индекса массива.
    if @sum > @arr_station.size - 1
      puts "Поезд на конечной станции: #{@train_now.name}, но скоро он отправится в обратный путь."
      return @sum = @arr_station.size - 1
      #проверяет движется ли поезд по отрицательному значению индекса массива и прерывает движение устанавливая счетчик в нуливое значение.
    elsif @sum < 0
      puts "Поезд на конечной станции: #{@train_now.name}, но скоро он отправится в обратный путь."
      return @sum = 0
    end

    if @have_route == true && step == 1 || @have_route == true && step == -1
      @train_now.send_train(self)

      @arr_station[@sum].get_train(self)

      @train_now = @arr_station[@sum]
    else
      puts 'Нет маршрута следования. За раз можно проехать только одну станцию.'
    end
  end

  def show_where
    puts "Поезд находится на станции: #{@train_now.name}"
  end
end
