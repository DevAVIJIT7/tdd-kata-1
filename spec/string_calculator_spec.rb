require_relative '../string_calculator'

RSpec.describe StringCalculator do
  subject(:string_calculator) { described_class.new(input_string).add }
  let(:input_string) { '' }

  context '.add' do
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
  end
end