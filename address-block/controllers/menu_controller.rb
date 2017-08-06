# This controller contains the following menu items:
# main_menu, view_all_entries, entry_submenu, create_entry, delete_entry,
# edit_entry, search_entries, search_submenu, and read_csv.

require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "
    selection = gets.to_i # gets retrieves user input from the command line.
    puts "You picked #{selection}"
    case selection
      when 1
        # system "clear"
        view_all_entries
        main_menu
      when 2
        # system "clear"
        create_entry
        main_menu
      when 3
        # system "clear"
        search_entries
        main_menu
      when 4
        # system "clear"
        read_csv
        main_menu
      when 5
        puts "Good-bye!"
        exit(0)
      else  # Catch invalid user input and proper user to retry.
        # system "clear"
        puts "Sorry, that is not a valid input."
        main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      puts entry.to_s
      entry_submenu(entry)
    end
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp
    case selection
      when "n"
      when "d"
        delete_entry(entry)
      when "e"
        # system "clear"
        edit_entry(entry)
        entry_submenu(entry)
      when "m"
        main_menu
      else  # Catch invalid user input and proper user to retry.
        # system "clear"
        puts "#{selection} is not a valid input."
        entry_submenu(entry)
    end
  end

  def create_entry
    puts "New AddressBlock Entry"
    print "Name:"
    name = gets.chomp # Chomp deletes the new line at the end of a user input.
    print "Phone Number:"
    phone_number = gets.chomp
    print "Email:"
    email = gets.chomp
    address_book.add_entry(name, phone_number, email)
    # system "clear"
    puts "Entry created for #{name}."
  end

  def delete_entry(entry)
    address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
    puts "Leave fields blank if no change desired for that field."
    print "Update name to: "
    name = gets.chomp
    print "Update phone number to:"
    phone_number = gets.chomp
    print "Update email to: "
    email = gets.chomp
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    # system "clear"
    puts "Updated entry: "
    puts entry
  end

  def search_entries
    print "Please provide the name of the person you would like to search for: "
    name = gets.chomp
    match = address_book.binary_search(name)
    # system "clear"
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def search_submenu(entry)
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp
    case selection
      when "d"
        delete_entry(entry)
        # system "clear"
        main_menu
      when "e"
        # system "clear"
        edit_entry(entry)
        # system "clear"
        main_menu
      when "m"
        # system "clear"
        main_menu
      else
        # system "clear"
        puts "#{selection} is not a valid input."
        puts entry.to_s
        search_submenu(entry)
    end
  end

  def read_csv
    print "Enter the name of the file you would like to upload: "
    file_name = gets.chomp
    if file_name.empty?
      # system "clear"
      puts "CSV file not found."
      main_menu
    end
    begin
      entry_count = address_book.import_from_csv(file_name).count
      # system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV"
      read_csv
    end
  end

end
