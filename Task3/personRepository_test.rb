#!/usr/bin/ruby
require 'test/unit'
require_relative '../task2/person'
require_relative '../task2/personrepository'

class PersonRepositoryTest < Test::Unit::TestCase
  def setup
    # Adding some sample persons for testing
    PersonRepository.add_person('John', 'Doe', 'AA1234567890', Date.new(1990, 1, 1))
    PersonRepository.add_person('Jane', 'Smith', 'BB9876543210', Date.new(1985, 6, 15))
    PersonRepository.add_person('Michael', 'Johnson', 'CC5555555555', Date.new(1995, 9, 30))
  end

  def teardown
    # Clearing the persons after each test
    PersonRepository.all.each { |person| PersonRepository.delete_person_by_inn(person.inn) }
  end

  def test_add_person_with_arguments
    PersonRepository.add_person('Test', 'Person', 'DD1111111111', Date.new(2000, 3, 20))
    assert_equal(4, PersonRepository.all.length)
  end


  def test_remove_person
    person_to_remove = PersonRepository.all.first
    PersonRepository.remove_person(person_to_remove)
    assert_not_includes(PersonRepository.all, person_to_remove)
  end


  def test_get_person_by_inn
    inn = 'AA1234567890'
    person = PersonRepository.get_person_by_inn(inn)
    assert_equal(inn, person.inn)
  end

  def test_get_persons_by_name
    name = 'Doe'
    persons = PersonRepository.get_persons_by_name(name)
    assert_equal(1, persons.length)
    assert_equal(name, persons.first.last_name)
  end

  def test_get_persons_by_date_range
    from_date = Date.new(1990, 1, 1)
    to_date = Date.new(1995, 12, 31)
    persons = PersonRepository.get_persons_by_date_range(from_date, to_date)
    assert_equal(2, persons.length)
  end
end
