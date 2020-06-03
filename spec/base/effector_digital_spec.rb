# frozen_string_literal: true

require_relative '../../base/effector_digital'

describe EffectorDigital, 'initialization' do
  let(:pins) { { r: 6, g: 13, b: 19 } }

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
