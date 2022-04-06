# frozen_string_literal: true

class TestSkeleton
  # https://www.codewars.com/kata/53da3dbb4a5168369a0000fe
  # Create a function that takes an integer as an argument and returns "Even"
  # for even numbers or "Odd" for odd numbers.
  # Example:
  # TestSkeleton.new.even_or_odd(1) should return "odd"
  # TestSkeleton.new.even_or_odd(2) should return "even"
  # TestSkeleton.new.even_or_odd(0) should return "even"
  # TestSkeleton.new.even_or_odd(-42) should return "even"
  def even_or_odd(number)
    if number % 2 == 0
      return 'even'
    else
      return 'odd'
    end
  end

  # https://www.codewars.com/kata/5583090cbe83f4fd8c000051
  # Convert number to reversed array of digits
  # Given a random non-negative number, you have to return the digits of this
  # number within an array in reverse order.
  # Examples:
  # TestSkeleton.new.reverse_array(348597) should return [7,9,5,8,4,3]
  # TestSkeleton.new.reverse_array(0) should return [0]
  def reverse_array(number)
    return number.to_s.split('').reverse.map { |item| item.to_i }
  end

  # https://www.codewars.com/kata/554b4ac871d6813a03000035
  # In this little assignment you are given a string of space separated numbers,
  # and have to return the highest and lowest number.
  # Examples:
  # TestSkeleton.new.high_and_low("1 2 3 4 5")  should return "5 1"
  # TestSkeleton.new.high_and_low("1 2 -3 4 5") should return "5 -3"
  # TestSkeleton.new.high_and_low("1 9 3 4 -5") should return "9 -5"
  # Notes
  # All numbers are valid Int32, no need to validate them.
  # There will always be at least one number in the input string.
  # Output string must be two numbers separated by a single space, and highest number is first.
  def high_and_low(test_string)
    return test_string.split(' ').minmax_by { |item| item.to_i }.reverse.join(' ')
  end

  # https://www.codewars.com/kata/5b16490986b6d336c900007d
  # You are given a dictionary/hash/object containing some languages and your test results in the
  # given languages. Return the list of languages where your test score is at least 60,
  # in descending order of the results.
  # Note: the scores will always be unique (so no duplicate values)
  # Examples:
  # TestSkeleton.new.my_languages({"Java" => 10, "Ruby" => 80, "Python" => 65}) should return ["Ruby", "Python"]
  # TestSkeleton.new.my_languages({"Hindi" => 60, "Dutch" => 93, "Greek" => 71}) should return ["Dutch", "Greek", "Hindi"]
  # TestSkeleton.new.my_languages({"C++" => 50, "ASM" => 10, "Haskell" => 20}) should return [] 
  def my_languages(hash)
    minScore = 60
    return hash.select { |lang, score| score >= minScore }.sort_by { |key, value| -value }.to_h.keys
  end

  # https://www.codewars.com/kata/563089b9b7be03472d00002b
  # Define a method/function that removes from a given array of integers all the values contained in a second array.
  # Examples:
  # integer_list =  [1, 1, 2 ,3 ,1 ,2 ,3 ,4]
  # values_list = [1, 3]
  # TestSkeleton.new.remove_array_elements(integer_list, values_list) should return [2, 2, 4]
  # integer_list = [1, 1, 2 ,3 ,1 ,2 ,3 ,4, 4, 3 ,5, 6, 7, 2, 8]
  # values_list = [1, 3, 4, 2]
  # TestSkeleton.new.remove_array_elements(integer_list, values_list) should return [5, 6 ,7 ,8]
  def remove_array_elements(source_array, values_array)
    return source_array - values_array
  end

  # https://www.codewars.com/kata/5b39e91ee7a2c103300018b3
  # Your task is to remove all consecutive duplicate words from a string,
  # leaving only first words entries. Words would be separated by space
  # Examples:
  # string = "alpha beta beta gamma gamma gamma delta alpha beta beta gamma gamma gamma delta"
  # TestSkeleton.new.consecutive_duplicates(string) should return "alpha beta gamma delta alpha beta gamma delta"
  def consecutive_duplicates(string)
    words_list = string.split(' ')
    if words_list.count == 0 || words_list.count == 1
      return string
    end

    result_array = []

    for i in 0..words_list.count - 1
      if words_list[i] != words_list[i + 1]
        result_array.append(words_list[i])
      end
    end

    return result_array.join(' ')
  end

  # https://www.codewars.com/kata/56747fd5cb988479af000028
  # You are going to be given a word. Your job is to return the middle character of the word.
  # If the word's length is odd, return the middle character. If the word's length is even,
  # return the middle 2 characters.
  # Examples:
  # TestSkeleton.new.middle_chars("test") should return "es"
  # TestSkeleton.new.middle_chars("testing") should return "t"
  # TestSkeleton.new.middle_chars("middle") should return "dd"
  # TestSkeleton.new.middle_chars("A") should return "A"
  # Input:
  # A word (string) of length 0 < str < 1000
  # You do not need to test for this.
  # Output:
  # The middle character(s) of the word represented as a string.
  def middle_chars(test_string)
    stringLength = test_string.length
    if stringLength % 2 == 0
      left = test_string[stringLength / 2 - 1]
      right = test_string[stringLength / 2]
      return left + right
    else 
      return test_string[stringLength / 2]
    end
  end
end
