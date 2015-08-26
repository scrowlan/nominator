class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :employee_image
      
      t.timestamps
    end
  end
end
