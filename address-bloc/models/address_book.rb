# We tell Ruby to load the library named entry.rb relative to address_book.rb's file path using require_relative
require_relative 'entry'

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    entries.each do |entry|
      index += 1 unless name < entry.name
    end
    entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    entries.each do |entry|
      entries.delete(entry) if name == entry.name && phone_number = entry.phone_number && email == entry.email
    end
  end

end
