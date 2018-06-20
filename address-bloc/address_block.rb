# We tell Ruby to load the library named entry.rb relative to address_book.rb's file path using require_relative
require_relative 'controllers/menu_controller'

# Initialize our menu for user
menu = MenuController.new

# Clear the command line
system "clear"

# Welcomes user.
puts "Welcome to AddressBlock"

# Prints the main menu items for user.
menu.main_menu
