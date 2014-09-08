class CreateDoors < ActiveRecord::Migration
  def change
    create_table :doors do |t|
      t.string :name
      t.string :hex
      t.boolean :private, default: false
      t.timestamps
    end
  end
end
