# frozen_string_literal: true

require_relative '../../base/effector'

describe Effector do
  subject { Effector.new }

  it 'should have a name' do
    expect(subject.name).to eq nil
  end

  it 'should have a model' do
    expect(subject.model).to eq nil
  end
end
