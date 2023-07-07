#!/usr/bin/ruby
require 'test/unit'
require_relative '../task2/validation' # If the Person class is required for the tests

class ValidationTest < Test::Unit::TestCase

  # Test valid names
  ['John-Doe', 'Mary', 'Zoryana-Danylenko', 'Анна-Марія', 'Mary-Jane'].each_with_index do |name, index|
    define_method("test_valid_name_#{index + 1}") do
      assert(Validation.valid_name?(name))
    end
  end

  # Test invalid names
  ['', nil, 123, 'John Doe', 'John-Doe-', '-John-Doe', 'John--Doe', 'a' * 41, '-'].each_with_index do |name, index|
    define_method("test_invalid_name_#{index + 1}") do
      assert_false(Validation.valid_name?(name))
    end
  end

  # Test valid INNs
  ['AA1234567890', 'AB0000000000', 'CD9876543210'].each_with_index do |inn, index|
    define_method("test_valid_inn_#{index + 1}") do
      assert(Validation.valid_inn?(inn))
    end
  end

  # Test invalid INNs
  ['', nil, 123_456_789_012, 'AB00000000001', 'A12345678901', 'AB123456789A'].each_with_index do |inn, index|
    define_method("test_invalid_inn_#{index + 1}") do
      assert_false(Validation.valid_inn?(inn))
    end
  end

  # Test valid dates
  [Date.today, Date.today - 1, Date.today - 365].each_with_index do |date, index|
    define_method("test_valid_date_#{index + 1}") do
      assert(Validation.valid_date?(date))
    end
  end

  # Test invalid dates
  [Date.today + 1, Date.today + 365, '2023-01-01', 123_456_789].each_with_index do |date, index|
    define_method("test_invalid_date_#{index + 1}") do
      assert_false(Validation.valid_date?(date))
    end
  end
end
