require 'active_record'

class List < ActiveRecord::Base
  has_many :tasks

  validates :name, presence: { :message => 'OOHHH HECK NO WE NEED A LIST NAME!' }

end
