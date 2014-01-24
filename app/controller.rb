require_relative 'view'

# new list "name"
# new task "desc"
# complete task (task id) list (list id)
# display list (list id)
# display listsdelete task (task id) list (list id)
# delete list (list id)

class Controller
  # many arms like Vishnu

  def initialize
    @viewer = View.new
    run
  end

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
    if ARGV[1] == "task" && ARGV[3] == "list" && ARGV.size == 5
      list_id = ARGV[4].to_i - 1
      List.all[list_id].add_task(ARGV[2])
      display_list(List.all[list_id])
    elsif ARGV[1] == "list" && ARGV.size == 3
      List.create(name: ARGV[2])
      display_all_lists
    else
      raise "Please use correct magical syntax. (DO ETTT.)"
    end
  end

  def display_options
    if ARGV[1] == "list"
      raise "Please input an id: display list 'id#'" if ARGV[2] == nil
      list_id = ARGV[2].to_i - 1
      display_list(List.all[list_id])
    elsif ARGV[1] == "lists"
      display_all_lists
    else
      raise "Please use 'display list' or 'display lists'."
    end
  end

  def complete_options
    list_id = ARGV[4].to_i - 1
    task_id = ARGV[2].to_i - 1
    # Gets task obj, calls complete
    # complete task task_id for list
    if ARGV[1] == "task" && ARGV[3] == "list" && ARGV.size == 5
      # List.find(ARGV[2].to_i).tasks.find(ARGV[4].to_i).complete
      List.all[list_id].tasks.to_a[task_id].complete
      display_list(List.all[list_id])
    else
      raise "Please use correct magical syntax. (DO ETTT.)"
    end
  end

  def delete_options
    if ARGV[1] == "task" && ARGV[3] == "list" && ARGV.size == 5
      list_id = ARGV[4].to_i - 1
      task_id = ARGV[2].to_i - 1
      List.all[list_id].tasks.to_a[task_id].destroy
      display_list(List.all[list_id])
    elsif ARGV[1] == "list"
      list_id = ARGV[2].to_i - 1
      List.all[list_id].destroy
      display_all_lists
    else
      raise "Please use correct magical syntax. (DO ETTT.)"
    end
  end

  def display_list(id)
    @viewer.output(List.find(id))
    @viewer.output(List.find(id).get_all_tasks)
  end


  def display_all_lists
    @viewer.output(List.all_lists)
  end
end
