# This controller contains the following menu items:
# main_menu, view_all_entries, entry_submenu, create_entry, search_entries, and read_csv.

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
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      when 5
        puts "Good-bye!"
        exit(0)
      else  # Catch invalid user input and proper user to retry.
        system "clear"
        puts "Sorry, that is not a valid input."
        main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      # entry_submenu(entry)
    end
  end

  def entry_submenu
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp
    case selection
      when n
      when d
      when e
      when m
      else  # Catch invalid user input and proper user to retry.
        system "clear"
        puts "#{selection} is not a valid input."
        entry_submenu(entry)
    end
  end

  def create_entry
    system "clear"
    puts "New AddressBlock Entry"
    print "Name:"
    name = gets.chomp # Chomp deletes the new line at the end of a user input.
    print "Phone Number:"
    phone_number = gets.chomp
    print "Email:"
    email = gets.chomp
    address_book.add_entry(name, phone_number, email)
    system "clear"
    puts "Entry created for #{name}."
  end

end
#
# def search_entries
#
# end
#
# def read_csv
#
# end
