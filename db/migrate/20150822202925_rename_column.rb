class RenameColumn < ActiveRecord::Migration
  def change
    remove_column :nominations, :user_id, :integer
    add_column :nominations, :employee_id, :integer

  end
end
