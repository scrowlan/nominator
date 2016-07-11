class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
