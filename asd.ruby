class Car
  attr_accessor :fuel, :engine_status, :speed

  def initialize
    @fuel = 100  # уровень топлива в процентах
    @engine_status = false  # статус двигателя (включен/выключен)
    @speed = 0  # текущая скорость
  end
  def start_engine
    if @fuel > 0
      @engine_status = true
      puts "Двигатель запущен."
    else
      puts "Недостаточно топлива для запуска двигателя."
    end
  end

  def stop_engine
    @engine_status = false
    @speed = 0
    puts "Двигатель выключен."
  end

  def accelerate(amount)
    if @engine_status
      @speed += amount
      @fuel -= amount * 0.1  # расход топлива пропорционален увеличению скорости
      @fuel = 0 if @fuel < 0
      puts "Скорость увеличена до #{@speed} км/ч. Топливо осталось: #{@fuel}%."
    else
      puts "Сначала запустите двигатель."
    end
  end

  def brake(amount)
    if @engine_status
      @speed -= amount
      @speed = 0 if @speed < 0
      puts "Скорость уменьшена до #{@speed} км/ч."
    else
      puts "Сначала запустите двигатель."
    end
  end

  def refuel(amount)
    @fuel += amount
    @fuel = 100 if @fuel > 100
    puts "Заправлено до #{@fuel}%."
  end
end

# Пример использования скрипта машины
my_car = Car.new

my_car.start_engine
my_car.accelerate(30)
my_car.brake(10)
my_car.refuel(20)
my_car.stop_engine
