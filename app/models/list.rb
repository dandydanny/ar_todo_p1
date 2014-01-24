require 'active_record'

class List < ActiveRecord::Base
  has_many :tasks

  validates :name, presence: { :message => 'OOHHH HECK NO WE NEED A LIST NAME!' }

  # before_destroy { |record| Task.destroy_all "list_id = #{self.id}" }
  before_destroy 'Task.destroy_all "list_id = #{self.id}"'

  def add_task(description)
    self.tasks.create(description: description)
  end

  def self.all_lists #display ALL lists
    all_lists = ""
    num = 1
    self.all.each do |list|
      all_lists += "#{num}. #{list.name}\n"
      num += 1
    end
    all_lists
  end

  def self.list_by_id(id)
    self.find_by(id).name
  end

  def get_all_tasks
    all_tasks = self.tasks.to_a # array of Task objects
    formatted_task_list = ""
    num = 1
    all_tasks.each do |task|
      spacer = " " if num < 10
      formatted_task_list << "#{num}. #{spacer}#{task.to_s}\n"
      num += 1
    end
    formatted_task_list
  end

  def to_s
    "#{self.name}"
  end
end
