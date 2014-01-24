class Controller
  # many arms like Vishnu
  # ARGV stuff

  def run
    if ARGV[0] == "new"
      new_options
    elsif ARGV[0] == "display"
      display_options
    elsif ARGV[0] == "complete"
      complete_options
    elsif ARGV[0] == "delete"
      delete_options
    else
      raise "Please use 'new', 'display', 'complete', or 'delete'."
    end
  end

  def new_options
    if ARGV[2] == "task" && ARGV.size == 4
      List.find(ARGV[4].to_i).add_task(ARGV[3])
      display_list
    elsif ARGV[1] == "list" && ARGV.size == 3
      List.create(name: ARGV[2])
      display_all_lists
    else
      raise "Please use correct magical syntax. (DO ETTT.)"
    end
  end

  def display_options
    if ARGV[1] == "list"
      display_list
    elsif ARGV[1] == "lists"
      display_all_lists
    else
      raise "Please use 'display list' or 'display lists'."
    end
  end

  def complete_options
    if ARGV[1] == "list" && ARGV[3] == "task" && ARGV.size == 5
      List.find(ARGV[2].to_i).tasks.find(ARGV[4].to_i).complete
      display_list
    else
      raise "Please use correct magical syntax. (DO ETTT.)"
    end
  end

  def delete_options
    if ARGV[1] == "task" && ARGV.size == 3
      Task.destroy(ARGV[2])
      display_list
    elsif ARGV[1] == "list"
      List.find(ARGV[2].to_i).destroy
    else
      raise "Please use correct magical syntax. (DO ETTT.)"
    end
  end


  def display_list
    # Use ARGV[2] as id to locate list to display
  end


  def display_all_lists
    List.all_lists
  end



end
