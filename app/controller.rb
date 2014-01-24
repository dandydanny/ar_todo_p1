class Controller
  # many arms like Vishnu
  def initialize
    @viewer = View.new
  end

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
    List.find_by(id: ARGV[2].to_i)
  end


  def display_all_lists
    @viewer.output(List.all_lists)
  end





  def display
  end
end
