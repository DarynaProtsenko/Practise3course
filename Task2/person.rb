#!/usr/bin/ruby
require_relative 'consoleinput'

class Person
  attr_accessor :first_name, :last_name, :inn, :birth_date
  include ConsoleInput

  def initialize(first_name = nil, last_name = nil, inn = nil, birth_date = nil)
    if first_name && last_name && inn && birth_date
      @first_name = first_name
      @last_name = last_name
      @inn = inn
      @birth_date = birth_date
    else
      @first_name = ConsoleInput.write_first_name
      @last_name = ConsoleInput.write_last_name
      @inn = ConsoleInput.write_inn
      @birth_date = ConsoleInput.write_date
    end
  end

  def display_info
    puts "First Name: #{@first_name}"
    puts "Last Name: #{@last_name}"
    puts "INN: #{@inn}"
    puts "Birth Date: #{@birth_date}"
  end
end
