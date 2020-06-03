# frozen_string_literal: true

require_relative '../../base/effector_digital'

describe EffectorDigital do
  describe 'when first created' do
    subject(:pins) { { r: 6, g: 13, b: 19 } }

    it 'initializes the pins and sets them low' do
      effector = EffectorDigital.new pins, :low

      expect(effector.states). to eq({ 6 => :low, 13 => :low, 19 => :low })
    end

    it 'initializes the pins and sets them high' do
      effector = EffectorDigital.new pins, :high

      expect(effector.states). to eq({ 6 => :high, 13 => :high, 19 => :high })
    end

    it 'initializes the pins as low by default' do
      effector = EffectorDigital.new pins

      expect(effector.states). to eq({ 6 => :low, 13 => :low, 19 => :low })
    end
  end

  describe 'describe states' do
    subject(:effector) { EffectorDigital.new({ r: 6, g: 13, b: 19 }) }

    it 'returns the state of one of the pins by its name' do
      expect(effector.state(:r)).to eq(:low)
    end
    it 'returns the state of one of the pins by its number' do
      expect(effector.state(6)).to eq(:low)
    end
    it 'checks logic depending on and off when on' do
      effector.turn_on(:b)
      expect(effector.on?(:b)).to eq(true)
      expect(effector.off?(:b)).to eq(false)
    end
    it 'checks logic depending on and off when off' do
      effector.turn_off(:b)
      expect(effector.on?(:b)).to eq(false)
      expect(effector.off?(:b)).to eq(true)
    end
  end

  describe 'change state' do
    subject(:effector) { EffectorDigital.new({ r: 6, g: 13, b: 19 }) }

    it 'should turn the pin on by name' do
      effector.turn_on(:r)
      expect(effector.state(:r)).to eq(:high)
    end
    it 'should turn the pin on by number' do
      effector.turn_on(13)
      expect(effector.state(13)).to eq(:high)
    end
    it 'should turn the pin off by name' do
      effector.turn_off(:r)
      expect(effector.state(:r)).to eq(:low)
    end
    it 'should turn the pin on by number' do
      effector.turn_off(13)
      expect(effector.state(13)).to eq(:low)
    end
    it 'should switch from on to off' do
      effector.turn_on(:r)
      effector.switch(:r)
      expect(effector.off?(:r)).to eq(true)
    end
    it 'should switch from off to on' do
      effector.turn_off(:r)
      effector.switch(:r)
      expect(effector.on?(:r)).to eq(true)
    end
  end
end
