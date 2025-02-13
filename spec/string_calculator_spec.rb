require 'spec_helper'
require_relative '../string_calculator'

RSpec.describe StringCalculator do
  subject(:string_calculator) { described_class.new(input_string).add }
  let(:input_string) { '' }

  describe '.add' do
    context 'when input_string is blank' do
      it { is_expected.to eq(0) }
    end

    context 'when input_string is nil' do
      let(:input_string) { nil }
      
      it { is_expected.to eq(0) }
    end

    context 'when input_string contains single number' do
      let(:input_string) { '1' }
      
      it { is_expected.to eq(1) }
    end

    context 'when input_string contains comma(,) as delimeter' do
      let(:input_string) { '1,2,3' }
      
      it { is_expected.to eq(6) }
    end

    context 'when input_string contains comma(,) and newline(\n) as delimeter' do
      let(:input_string) { '1\n2,3' }
      
      it { is_expected.to eq(6) }
    end

    context 'when input_string contains newline(\n) as delimeter' do
      let(:input_string) { '1\n2\n3' }
      
      it { is_expected.to eq(6) }
    end

    context 'when input_string contains custom delimeter' do
      let(:input_string) { '//;\n1;2;3' }
      
      it { is_expected.to eq(6) }
    end

    context 'when input_string contains negative number' do
      let(:input_string) { '//;\n1;2;-3;-4' }
      
      it 'raise NegativeError exception' do
        expect { subject }.to raise_error(
          StringCalculator::NegativeError, 'negatives not allowed -3,-4'
        )
      end
    end
  end

  describe '.get_called_count' do
    it 'return no off times add called' do
      expect(described_class.new('').get_called_count).to eq(8)
    end
  end
end