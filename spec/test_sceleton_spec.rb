# frozen_string_literal: true

require_relative '../test_skeleton.rb'

RSpec.describe TestSkeleton do
  let(:suite) { described_class.new }

  describe '#even_or_odd' do
    context 'when number is given' do
      it 'should return word "even" or "odd"' do
        expect(suite.even_or_odd(0)).to eq('even')
        expect(suite.even_or_odd(121)).to eq('odd')
        expect(suite.even_or_odd(-5)).to eq('odd')
        expect(suite.even_or_odd(44)).to eq('even')
      end
    end
  end

  describe '#reverse_array' do
    context 'when number is given' do
      it 'should return reversed array of digits' do
        expect(suite.reverse_array(12)).to eq([2, 1])
        expect(suite.reverse_array(5896)).to eq([6, 9, 8, 5])
        expect(suite.reverse_array(0)).to eq([0])
        expect(suite.reverse_array(62854)).to eq([4, 5, 8, 2, 6])
      end
    end
  end

  describe '#high_and_low' do
    context 'when string with numbers is given' do
      it 'should return highest and lowest numbers' do
        expect(suite.high_and_low('0 1 2 3 4 5')).to eq('5 0')
        expect(suite.high_and_low('-3 -2 -1 0 1 2 3')).to eq('3 -3')
        expect(suite.high_and_low('0')).to eq('0 0')
        expect(suite.high_and_low('-3 -2 -1')).to eq('-1 -3')
      end
    end
  end

  describe '#my_languages' do
    context 'when hash with string keys is given' do
      it 'should return array of keys where value more than 60' do
        expect(suite.my_languages('Hindi' => 65, 'Greek' => 70, 'German' => 20)).to eq(%w[Greek Hindi])
        expect(suite.my_languages('Japanese' => 68, 'Malasian' => 62, 'Chinese' => 61, 'Arabic' => 79)).to eq(%w[Arabic Japanese Malasian Chinese])
        expect(suite.my_languages({})).to eq([])
        expect(suite.my_languages('A' => 30, 'B' => 50, 'C' => 25)).to eq([])
      end
    end
  end

  describe '#remove_array_elements' do
    context 'when two arrays is given' do
      it 'should return array of numbers that not in second array' do
        expect(suite.remove_array_elements([1, 2], [1])).to eq([2])
        expect(suite.remove_array_elements([1, 1, 2, 5, 3, 3], [1, 3])).to eq([2, 5])
        expect(suite.remove_array_elements([1, 2, 3, 4, nil, nil], [1, 2, nil])).to eq([3, 4])
      end
    end
  end

  describe '#consecutive_duplicates' do
    context 'when string with words is given' do
      it 'should return string where words not consecutive repeated' do
        expect(suite.consecutive_duplicates('aa bb bb cc dd')).to eq('aa bb cc dd')
        expect(suite.consecutive_duplicates('apple banana cherry')).to eq('apple banana cherry')
        expect(suite.consecutive_duplicates('aaa aaa aaa bbb bbb bbb aaa aaa ccc ccc ddd')).to eq('aaa bbb aaa ccc ddd')
      end
    end
  end

  describe '#middle_chars' do
    context 'when string is given' do
      it 'should return middle character(s) of string' do
        expect(suite.middle_chars('A')).to eq('A')
        expect(suite.middle_chars('Cherry')).to eq('er')
        expect(suite.middle_chars('push')).to eq('us')
        expect(suite.middle_chars('Do Androids Dream of Electric Sheep?')).to eq(' o')
      end
    end
  end
end
