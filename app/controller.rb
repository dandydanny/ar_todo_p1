class Controller
  # many arms like Vishnu


  # ARGV stuff

  def sort_first_arg
    if ARGV[0] == "new"
    elsif ARGV[0] == "display"
      sort_display_args
    elsif ARGV[0] == "complete"
    elsif ARGV[0] == "delete"
    else
      raise "Please use new, display, complete, or delete."
    end

  end


  def sort_display_args
    if ARGV[1] == "list"
      display_list
    elsif ARGV[1] == "lists"
      display_all_list
    else
      raise "Please use 'display list' or 'display lists'."
    end
  end

  def display_list
    # Use ARGV[2] as id to locate list to display
  end


  def display_all_lists
    List.all_lists
  end





  def display
  end
end
