
# Use require_relative to load our entry model for testing.
# Thie file is a spec file. It tests entry.
require_relative '../models/address_book'
require 'csv'

# We are using RSpec to test our code (i.e. $ rspec spec/entry_spec.rb )
RSpec.describe AddressBook do

  describe "attributes" do
    let(:book) { AddressBook.new }
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
    let(:book) { AddressBook.new }
    it "adds one entry to address book" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      expect(book.entries.size).to eq(1)
    end
    it "adds the correct information to the entries" do
      book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
      new_entry = book.entries[0]
      expect(new_entry.name).to eq('Ada Lovelace')
      expect(new_entry.phone_number).to eq('010.012.1815')
      expect(new_entry.email).to eq('augusta.king@lovelace.com')
    end
  end

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end

  describe "#import_from_csv" do
    let(:book) { AddressBook.new }
    it "imports the correct number of entries" do
      book.import_from_csv('entries.csv')
      book_size = book.entries.size
      expect(book_size).to eq(5)
    end
    it "imports the 1st entry" do
      book.import_from_csv('entries.csv')
      entry_one = book.entries[0]
      check_entry(entry_one, 'Bill', '555-555-4854', 'bill@blocmail.com')
    end
    it "imports the 2nd entry" do
      book.import_from_csv('entries.csv')
      entry_one = book.entries[1]
      check_entry(entry_one, 'Bob', '555-555-5415', 'bob@blocmail.com')
    end
    it "imports the 3rd entry" do
      book.import_from_csv('entries.csv')
      entry_one = book.entries[2]
      check_entry(entry_one, 'Joe', '555-555-3660', 'joe@blocmail.com')
    end
    it "imports the 4th entry" do
      book.import_from_csv('entries.csv')
      entry_one = book.entries[3]
      check_entry(entry_one, 'Sally', '555-555-4646', 'sally@blocmail.com')
    end
  end

end
