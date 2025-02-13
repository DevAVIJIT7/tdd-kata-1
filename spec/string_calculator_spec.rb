require_relative '../string_calculator'

RSpec.describe StringCalculator do
  subject(:string_calculator) { described_class.new(numbers).calculator }
  let(:numbers) { '' }

  context '.calculator' do
    context 'when numbers is blank string' do
      it { is_expected.to eq(0) }
    end

    context 'when numbers is nil' do
      let(:numbers) { nil }
      
      it { is_expected.to eq(0) }
    end

    context 'when numbers contains single number' do
      let(:numbers) { '1' }
      
      it { is_expected.to eq(1) }
    end
  end
end