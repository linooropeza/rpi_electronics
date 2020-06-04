# frozen_string_literal: true

require_relative '../../base/effector_binary'

describe EffectorBinary do
  describe 'when just created' do
    subject(:pin) { 6 }

    it 'initializes the pin and sets it low' do
      effector = EffectorBinary.new(pin, :low)
      expect(effector.state(pin)).to eq(:low)
    end
  end
end
