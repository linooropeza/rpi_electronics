# frozen_string_literal: true

require 'rpi_gpio'
require_relative 'effector'

RPi::GPIO.set_warnings(false)
RPi::GPIO.set_numbering :bcm

# EffectorDigital: An effector that is control digitally.
# This effectors can control multiple pins
class EffectorDigital < Effector
  attr_reader :states

  def initialize(pins, state = :low)
    @states = {}
    @pins = pins
    @pins.each_value do |pin|
      RPi::GPIO.setup pin, as: :output, initialize: state
      @states[pin] = state
    end
    @pin = pins.values[0] # default pin
  end

  # State related methods
  def state(pin = @pin)
    @states[pin_number(pin)]
  end

  def on?(pin = @pin)
    @states[pin_number(pin)] == :high
  end

  def off?(pin = @pin)
    @states[pin_number(pin)] == :low
  end

  # Change state methods
  def turn_on(pin = @pin)
    RPi::GPIO.set_high pin_number(pin)
    @states[pin_number(pin)] = :high
  end

  def turn_off(pin = @pin)
    RPi::GPIO.set_low pin_number(pin)
    @states[pin_number(pin)] = :low
  end

  def switch(pin = @pin)
    if on?(pin)
      turn_off(pin)
    else
      turn_on(pin)
    end
  end

  private

  def pin_number(pin)
    if pin.class.name == 'Integer' # by number
      pin
    elsif @pins[pin] # by name
      @pins[pin]
    end
  end
end
