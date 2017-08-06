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

  def binary_search(name)
    # First, pick a middle entry.
    lower = 0
    upper = entries.length - 1
    while lower <= upper
      mid = (lower + upper) / 2
      mid_name = entries[mid].name
      # If that happens to be correct, return it.
      if name == mid_name
        return entries[mid]
      # If the name is alphabetically before the middle, look lower
      elsif name < mid_name
        upper = mid - 1
      # If the name is alphabetically after the middle, look higher
      elsif name > mid_name
        lower = mid + 1
      end
    end
    # If no return made from searching, return nil.
    return nil
  end

end
