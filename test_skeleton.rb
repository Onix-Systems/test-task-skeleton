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
    # За допомогою тернарного оператора в одну строку
    return (number % 2 == 0) ? "even" : "odd"
  end

  # https://www.codewars.com/kata/5583090cbe83f4fd8c000051
  # Convert number to reversed array of digits
  # Given a random non-negative number, you have to return the digits of this
  # number within an array in reverse order.
  # Examples:
  # TestSkeleton.new.reverse_array(348597) should return [7,9,5,8,4,3]
  # TestSkeleton.new.reverse_array(0) should return [0]
  def reverse_array(number)
    numbers_array = []

    if (number > 0)
      while (number > 0) do
        # Отримуємо із числа його останню цифру і добавляємо її в масив
        # Змінююємо розрядність числа з автоматичним приводенням його до int,
        # так ми викидаємо з нього вже додану в масив цифру (для наступної ітерації)
        numbers_array.push(number % 10)
        number = number / 10
      end

    else
      numbers_array.push(0)
    end

    return numbers_array
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
    # Розділяємо строку на масив строк та приводимо його до типу int
    int_array = test_string.split.map(&:to_i)

    # 1. Можна скористатись готовими методами ruby
    # max_and_min = int_array.minmax.reverse
    # result = max_and_min.join(" ")

    # 2. Можна спробувати зробити це самому, по-іншому  
    # Якщо передано більше ніж одне число, тоді визначаємо найбільше та найменше,
    # почерзі порівнюючи їх між собою
    first_number = int_array[0]

    if (int_array.length > 1)
      max_number = first_number
      min_number = first_number
    
      for number in int_array do
        if (number > max_number)
          max_number = number
        end
        
        if (number < min_number)
          min_number = number
        end
      end
    
      result = max_number.to_s + ' ' + min_number.to_s
    
    # В інших випадках, коли всього одне число передали, вивдимо його двічі
    else
      result = first_number.to_s + ' ' + first_number.to_s
    end

    return result
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
    # Сортуємо хеш по значенню елементів у порядку зменшення
    sorted_hash = hash.sort_by{|k, v| v}.reverse.to_h
    
    # 1 спосіб. Робимо вибірку з хешу, де значення більше або рівне 60
    # і витягуємо ключі цього хешу в строковий масив, що і буде потрібним результатом
    # result = sorted_hash.select{ |k, v| v >= 60}.keys

    # 2 спосіб. Проходимось по кожному елементу такої колекції і якщо значення елемента більше або рівне 60, 
    # тоді добавляємо ключ в новий строковий масив, який і буде результатом
    result = []

    sorted_hash.each do |k, v|
      if (v >= 60)
        result.push(k)
      end
    end
 
    return result
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
    # 1. В рубі є така можливість по замовчуванню, метод #- для масивів
    # return source_array - values_array

    # 2. Можна спробувати зробити це самому, по-іншому
    # Порівнюємо почерзі кожне значення елемента першого масиву з усіма значеннями другого масиву
    # якщо нема співпадіння, значить таке значення повинно бути в фінальному масиві на виході, 
    # добавляємо його туди. Регулюємо цей процес за допомогою додаткової булевої змінної
    result = []

    for source_array_item in source_array
      handle = false

      for values_array_item in values_array
        if (source_array_item == values_array_item)
          handle = true;
          break
        end
      end

      if (handle == false)
        result.push(source_array_item)
      end

    end  

    return result
  end

  # https://www.codewars.com/kata/5b39e91ee7a2c103300018b3
  # Your task is to remove all consecutive duplicate words from a string,
  # leaving only first words entries. Words would be separated by space
  # Examples:
  # string = "alpha beta beta gamma gamma gamma delta alpha beta beta gamma gamma gamma delta"
  # TestSkeleton.new.consecutive_duplicates(string) should return "alpha beta gamma delta alpha beta gamma delta"
  def consecutive_duplicates(string)
    # За допомогою регулярного виразу
    return string.gsub(/\b(\w+)( \1)+\b/, '\1')
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
    # Розбиваємо слово на масив символів, знаходимо індекс символу посередині
    # Якщо це слово містить парну к-ть символів, тоді беремо два символа із середини
    chars_array = test_string.chars
    middle = chars_array.length / 2

    if (chars_array.length % 2 == 0)
      result = chars_array[middle - 1].to_s + "" + chars_array[middle]
    else
      result = chars_array[middle]
    end

    return result
  end
end
