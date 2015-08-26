class AddFnameLnameEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :name
    add_column :employees, :fname, :string
    add_column :employees, :lname, :string
  end
end
