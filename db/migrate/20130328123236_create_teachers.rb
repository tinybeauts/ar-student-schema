require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |s|
      s.string :first_name
      s.string :last_name
      s.string :email
      s.string :phone
    end
  end
end
