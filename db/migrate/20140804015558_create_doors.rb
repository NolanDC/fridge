class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.string :name
      t.string :hex
      t.boolean :private
      t.timestamps
    end
  end
end
