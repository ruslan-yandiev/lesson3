require_relative 'station'
require_relative 'route'

class Train
  attr_reader :number

  def initialize(number, *type)
    @number = number
    @type = type
    @speed = 0
    @route = nil
    @arr_station = []
    @bul = false
    @train_now = nil
    @sum = 0
  end

  def type
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

  def change_carriages(arg)
    if @speed == 0 && arg == 1 || @speed == 0 && arg == -1
      if arg == 1
        @type[1] = @type[1] + 1
      else
        @type[1] = @type[1] - 1
      end
    else
      puts 'Необходимо остановиться или передать 1 или -1 вагона за раз'
    end
  end

  def add_route(route_train)
    @bul = true
    @route = route_train
    @route.route.each { |x| @arr_station << x}
    @arr_station[@sum].get_train(self)
    @train_now = @arr_station[@sum]
  end

  def go(arg)
    @sum += arg

    if @sum > @arr_station.size - 1
      puts "Поезд на конечной станции: #{@train_now.name}, но скоро он отправится обратно."
      @sum -= 1
      return
    elsif @sum < 0
      puts "Поезд на конечной станции: #{@train_now.name}, но скоро он отправится обратно."
      @sum += 1
      return
    end

    if @bul == true && arg == 1 || @bul == true && arg == -1
      @train_now.send_train(self)
      @arr_station[@sum].get_train(self)

      @train_now = @arr_station[@sum]
    else
      puts 'Нет маршрута следования или слишком много станций'
    end
  end

  def show_where
    puts "Поезд находится на станции: #{@train_now.name}"
  end
end

station1 = Station.new('Санкт-Петербург')
station2 = Station.new('Владикавказ')
station3 = Station.new('Москва')
station4 = Station.new('Краснодар')

route1 = Route.new(station1, station2)
route1.add_route(station3, station4)

route1.show_way

train1 = Train.new('Поезд №1', 'Пасажирский', 10)

train1.speed(100)
train1.show_speed
train1.stop
train1.show_speed
train1.change_carriages(-1)
train1.type
puts
train1.add_route(route1)
station1.show_trains_info
station1.show_trains_info(1)

train1.show_where
train1.go(1)
train1.show_where
train1.go(1)
train1.show_where
train1.go(1)
train1.show_where
train1.go(1)
train1.show_where
puts
train1.go(-1)
train1.show_where
train1.go(-1)
train1.show_where
train1.go(-1)
train1.show_where
train1.go(-1)
train1.show_where

