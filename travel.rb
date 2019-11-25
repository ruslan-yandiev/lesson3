require_relative 'station'
require_relative 'route'
require_relative 'train'


station1 = Station.new('Санкт-Петербург')
station2 = Station.new('Владикавказ')
station3 = Station.new('Москва')
station4 = Station.new('Краснодар')

route1 = Route.new(station1, station2)
route1.add_route(station3, station4)

# route1.show_way

train1 = Train.new('Поезд №1', 'Пасажирский', 10)

train1.speed(100)
train1.show_speed
train1.stop
train1.show_speed
train1.change_carriages(-1)
train1.type_train
puts
train1.add_route(route1)

station1.show_trains_info
station1.show_trains_info(1)


train1.show_where
train1.go(1)
train1.show_where
train1.go(1)
train1.show_where

train1.show_route
train1.show_route(1)

train1.go(1)
train1.show_where
train1.go(1)
train1.show_where
puts
train1.go(-1)
train1.show_where
train1.go(-1)
train1.show_where

train1.show_route
train1.show_route(1)

train1.go(-1)
train1.show_where
train1.go(-1)
train1.show_where
