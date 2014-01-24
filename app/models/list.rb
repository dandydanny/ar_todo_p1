require 'active_record'

class List < ActiveRecord::Base
  has_many :tasks

  validates :name, presence: { :message => 'OOHHH HECK NO WE NEED A LIST NAME!' }

  # before_destroy { |record| Task.destroy_all "list_id = #{self.id}" }
  before_destroy 'Task.destroy_all "list_id = #{self.id}"'

  def self.all_lists #display ALL lists
    all_lists = ""
    num = 1
    self.all.each do |list|
      all_lists += "#{num}. #{list.name}\n"
      num += 1
    end
    all_lists
  end

end
