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
end
