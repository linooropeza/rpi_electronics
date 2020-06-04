# frozen_string_literal: true

require_relative 'effector_digital'

# Effector Binary: It's a particular case of a digital effector.
# It only has one pin
class EffectorBinary < EffectorDigital
  def initialize(pin, state = :low)
    super({ pin: pin }, state)
    @pin = pin
  end
end
