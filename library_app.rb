class LibraryApp
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def start
    Menu.display_welcome_message

    loop do
      choice = Menu.display_menu_and_get_choice

      if (1..7).include?(choice)
        handle_menu_option(choice, @books, @people, @rentals)
        break if choice == 7
      else
        puts 'Invalid choice. Please select a valid option (1-7).'
      end
    end
  end
end