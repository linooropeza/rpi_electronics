# frozen_string_literal: true

# require 'rpi_gpio'

# RPi::GPIO.set_warnings(false)
# RPi::GPIO.set_numbering :bcm

# Effector: Electronic device that performs some task
class Effector
  attr_reader :name, :model

  protected

  attr_writer :name

  attr_writer :model
end
