# We tell Ruby to load the library named entry.rb relative to address_book.rb's file path using require_relative
require_relative 'entry'
require "csv"

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

  def import_from_csv(f_name)
    # Convert file to text.
    csv_text = File.read(f_name)
    # Parse text to create CSV::Table object.
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    # Create hash for each row
    csv.each do |row|
      row_hash = row.to_hash
      # Then we add each row / hash to entries.
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

end
