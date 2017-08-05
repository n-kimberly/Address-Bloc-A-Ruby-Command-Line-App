
# Use require_relative to load our entry model for testing.
# Thie file is a spec file. It tests entry.
require_relative '../models/address_book'

# We are using RSpec to test our code (i.e. $ rspec spec/entry_spec.rb )
RSpec.describe AddressBook do

  describe "attributes" do
    book = AddressBook.new
    it "responds to entries" do
      expect(book).to respond_to(:entries)
    end
    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end
    it "initialies entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do
    it "adds one entry to address book" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end
    it "adds the correct information to the entries" do
      book = AddressBook.new
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  describe "#remove_entry" do
    it "removes one entry from address book" do
      book = AddressBook.new

      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      book.add_entry('Kimberly Nguyen', '619.808.8973', 'kimberly.nguyen@gmail.com')
      expect(book.entries.size).to eq(2)

      book.remove_entry('Kimberly Nguyen', '619.808.8973', 'kimberly.nguyen@gmail.com')
      expect(book.entries.size).to eq(1)
      expect(book.entries[0].name).to eq('Ada Lovelace')
    end
  end

end
