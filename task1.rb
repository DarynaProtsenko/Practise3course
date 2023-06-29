#!/usr/bin/ruby
#Create module Validation with methods
#valid_name?(string) (valid name example Maria-Anna, max length is 40),
#valid_inn?(string) (valid inn example: AZ1234543456),
#after_date?(date) (is date may be date of birth)

require 'date'

module Validation
  def self.valid_name?(string)
    #check whether name is a string
    return false unless string.is_a?(String)
    #whether name not empty and not overflow length 40
    return false if string.empty? || string.length > 40
    # Check if the name starts or ends with '-'
    return false if string.match?(/\A-|-\z/)
    #whether name contain only letters a-z, A-Z and '-' symbol. First letter is uppercase.

    return false unless string.match?(/\A(?:[A-Z][a-z]*|-?[А-ЯҐЄІЇ][а-яґєії]*)(?:-[A-Z][a-z]*|-?[А-ЯҐЄІЇ][а-яґєії]*)*\z/)
    #\A - start of the string
    #(?: ... ) - non-captiruing group that allows grouping without capturing
    # [A-Z] - English UpperCase symbols
    # [a-z] - Engligh lowercase symbols
    # | - logical OR
    # [-? - matches '-' symbol
    # [А-ЯҐЄІЇ] - matches uppercase Ukrainian letters
    # [а-яґєії] - matches lowercase ukrainian letters. * means matches zero or more letters
    # * - match zero or more occurrences of preceding group
    # \z - end of string

    # (?:[A-Z][a-z]*|-?[А-ЯҐЄІЇ][а-яґєії]*)
    # Matches:
    #  [A-Z][a-z]* - one uppercase english letter with 0 or many lowercase english letter
    #  -?[А-ЯҐЄІЇ][а-яґєії]* - optional '-' symbol, one uppercase Ukrainial letter
    #  and 0 or more lowercase Ukrainian letter
    #  This part captures the first letter of a name,
    #  allowing either English or Ukrainian letters
    #  with an optional '-'.
    #
    true
  end

  def self.valid_inn?(string)
    #check whether inn is string
    return false unless string.is_a?(String)
    #check whether inn not empty and length == 12
    return false if string.empty? || string.length != 12
    #check whether inn match given pattern: 2 uppercase symbols, 10 numbers
    return false unless string.match?(/\A[A-Z]{2}\d{10}\z/)
    true
  end

  def self.after_date?(date)
    #check whether date is a correct Date
    return false unless date.is_a?(Date)
    #check whether date is in past
    return date <= Date.today
    true
  end
end

# Call the valid_name? method
name = "Anna"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

# Call the valid_name? method
name = "Anna-Maria"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

# Call the valid_name? method
name = "Каріна-Ірина"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

# Call the valid_name? method
name = "An-"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

# Call the valid_name? method
name = "-"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

# Call the valid_name? method
name = "aN"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end


# Call the valid_name? method
name = "AnnA"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

# Call the valid_name? method
name = "AnNa"
if Validation.valid_name?(name)
  puts "#{name} is a valid name."
else
  puts "#{name} is NOT a valid name."
end

# Call the valid_inn? method
inn = "AZ1234543456"
if Validation.valid_inn?(inn)
  puts "#{inn} is a valid INN."
else
  puts "#{inn} is NOT a valid INN."
end

# Call the valid_inn? method
inn = "AЯ6787787654"
if Validation.valid_inn?(inn)
  puts "#{inn} is a valid INN."
else
  puts "#{inn} is NOT a valid INN."
end

# Call the valid_inn? method
inn = "az1234567898"
if Validation.valid_inn?(inn)
  puts "#{inn} is a valid INN."
else
  puts "#{inn} is NOT a valid INN."
end

# Call the valid_inn? method
inn = "5676567656AZ"
if Validation.valid_inn?(inn)
  puts "#{inn} is a valid INN."
else
  puts "#{inn} is NOT a valid INN."
end

# Call the valid_inn? method
inn = "AZ78987"
if Validation.valid_inn?(inn)
  puts "#{inn} is a valid INN."
else
  puts "#{inn} is NOT a valid INN."
end

# Call the after_date? method
birth_date = Date.new(1990, 1, 1)
if Validation.after_date?(birth_date)
  puts "#{birth_date} is a valid date of birth."
else
  puts "#{birth_date} is NOT a valid date of birth."
end
