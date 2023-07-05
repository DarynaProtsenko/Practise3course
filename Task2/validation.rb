 #!/usr/bin/ruby
#Module Validation from Task1 without tests.
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

  def self.valid_date?(date)
    #check whether date is a correct Date
    return false unless date.is_a?(Date)
    #check whether date is in past
    return date <= Date.today
    true
  end
end
