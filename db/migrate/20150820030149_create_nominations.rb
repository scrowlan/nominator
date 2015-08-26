class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.text :reason
      t.string :nominator

      t.timestamps
    end
  end
end
