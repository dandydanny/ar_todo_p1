# require_relative '../../config/application.rb'

# this is where you should use an ActiveRecord migration to

class CreateTables < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :list_id
      t.boolean :completed
      t.string  :description
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :lists do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
# hey dave
