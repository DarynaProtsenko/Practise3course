#!/usr/bin/ruby
require_relative 'person'

class PersonRepository
  @persons = []

  def self.add_person(first_name = nil, last_name = nil, inn = nil, birth_date = nil)
    if first_name && last_name && inn && birth_date
      new_pesron = Person.new(first_name, last_name, inn, birth_date)
    else
      new_pesron = Person.new
    end

    if new_pesron.is_a?(Person)
      @persons << new_pesron
    end
    puts new_pesron
  end

  def self.remove_person(person)
    @persons.delete(person)
    puts "Person removed successfully."
  end

  def self.list_persons
    if @persons.empty?
      puts "No persons in the repository."
    else
      @persons.each_with_index do |person, index|
        puts "Person #{index + 1}:"
        puts "First Name: #{person.first_name}"
        puts "Last Name: #{person.last_name}"
        puts "INN: #{person.inn}"
        puts "Birth Date: #{person.birth_date}"
        puts "-" * 20
      end
    end
  end

  def self.get_person_by_inn(inn)
    @persons.find { |person| person.inn == inn }
  end

  def self.get_persons_by_name(name)
    @persons.select { |person| person.first_name.include?(name) || person.last_name.include?(name) }
  end

  def self.all()
    @persons
  end

  def self.edit(inn)
    person = get_person_by_inn(inn)
    if person.nil?
      puts "Person with INN #{inn} does not exist."
      return
    end

    person.first_name = ConsoleInput.write_first_name
    person.last_name = ConsoleInput.write_last_name
    person.birth_date = ConsoleInput.write_date

    puts "Person with INN #{inn} has been updated."
  end

  def self.delete_person_by_inn(inn)
    person = get_person_by_inn(inn)
    if person.nil?
      puts "Person with INN #{inn} does not exist."
      return
    end

    @persons.delete(person)
    puts "Person with INN #{inn} has been deleted."
  end

  def self.get_persons_by_date_range(from_date, to_date)
    persons = @persons.select do |person|
      person.birth_date >= from_date && person.birth_date <= to_date
    end

    if persons.empty?
      puts "No persons found within the specified date range."
    else
      puts "Persons within the specified date range:"
      persons.each do |person|
        puts "First Name: #{person.first_name}"
        puts "Last Name: #{person.last_name}"
        puts "INN: #{person.inn}"
        puts "Birth Date: #{person.birth_date}"
        puts "-" * 20
      end
    end
  end

end


# Adding persons
puts "Adding persons..."
PersonRepository.add_person # Add person with console input
PersonRepository.add_person('Petro', 'Doe', 'AA1234567890', Date.new(1990, 1, 1)) # Add person with arguments
PersonRepository.add_person('Anataliy', 'Shevchenko', 'AA2233445566', Date.new(2000, 2, 2)) # Add person with arguments
PersonRepository.add_person('Zoryana', 'Danylenko', 'AB3235337860', Date.new(1995, 5, 12)) # Add person with arguments


# Listing persons
puts "\nListing persons..."
PersonRepository.list_persons

# Getting person by INN
inn = 'AA1234567890'
person_by_inn = PersonRepository.get_person_by_inn(inn)
if person_by_inn
  puts "\nPerson with INN #{inn}:"
  puts "First Name: #{person_by_inn.first_name}"
  puts "Last Name: #{person_by_inn.last_name}"
  puts "INN: #{person_by_inn.inn}"
  puts "Birth Date: #{person_by_inn.birth_date}"
else
  puts "\nPerson with INN #{inn} does not exist."
end

# Getting person by name
name = 'Petro'
persons_by_name = PersonRepository.get_persons_by_name(name)
if persons_by_name
  puts "\nPerson(s) with name '#{name}':"
  persons_by_name.each do |person|
    puts "First Name: #{person.first_name}"
    puts "Last Name: #{person.last_name}"
    puts "INN: #{person.inn}"
    puts "Birth Date: #{person.birth_date}"
    puts "-" * 20
  end
else
  puts "\nNo person(s) found with name '#{name}'."
end

# Editing person by INN
puts "\nEditing person with INN #{inn}..."
PersonRepository.edit(inn)

# Listing persons
puts "\nListing persons..."
PersonRepository.list_persons

# Deleting person by INN
puts "\nDeleting person with INN #{inn}..."
PersonRepository.delete_person_by_inn(inn)

# Getting all persons
puts "\nAll persons:"
all_persons = PersonRepository.all
if all_persons.empty?
  puts "No persons in the repository."
else
  all_persons.each_with_index do |person, index|
    puts "Person #{index + 1}:"
    puts "First Name: #{person.first_name}"
    puts "Last Name: #{person.last_name}"
    puts "INN: #{person.inn}"
    puts "Birth Date: #{person.birth_date}"
    puts "-" * 20
  end
end

# Getting persons within a date range
from_date = Date.new(1990, 1, 1)
to_date = Date.new(2000, 12, 31)
puts "\nPersons within the date range #{from_date} - #{to_date}:"
PersonRepository.get_persons_by_date_range(from_date, to_date)


