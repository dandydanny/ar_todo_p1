require 'active_record'

class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, presence: { :message => 'OOHHH HECK NO WE NEED A TASK DESCRIPTION!' } 

end
