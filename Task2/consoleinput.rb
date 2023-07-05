#!/usr/bin/ruby

require 'date'
require_relative "validation"

module ConsoleInput
  include Validation
  def self.write_first_name
    loop do
      print "Enter a first name: "
      name = gets.chomp
      if Validation.valid_name?(name)
        return name
      else
        puts "Invalid first name. Please try again."
      end
    end
  end

    def self.write_last_name
    loop do
      print "Enter a last name: "
      name = gets.chomp
      if Validation.valid_name?(name)
        return name
      else
        puts "Invalid last name. Please try again."
      end
    end
  end

  def self.write_date
    loop do
      print "Enter a date (YYYY-MM-DD): "
      date = gets.chomp
      begin
        date = Date.parse(date)
        if Validation.valid_date?(date)
          return date
        else
          puts "Invalid date. Please try again."
        end
      rescue Date::Error
        puts "Invalid date format. Please try again."
      end
    end
  end


  def self.write_inn
    loop do
      print "Enter an INN: "
      inn = gets.chomp
      if Validation.valid_inn?(inn)
        return inn
      else
        puts "Invalid INN. Please try again."
      end
    end
  end
end
