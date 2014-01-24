require 'active_record'

class Task < ActiveRecord::Base

  after_initialize :init

  belongs_to :list

  validates :description, presence: { :message => 'OOHHH HECK NO WE NEED A TASK DESCRIPTION!' }
  def init
    self.completed ||= false
  end

  def complete
    self.update(completed: true)
  end

  def incomplete
    self.update(completed: false)
  end

  def to_s
    done = self.completed ? "X" : " "
    "#{self.id}. [#{done}]  #{self.description}"
  end
end
