class CreateMagnets < ActiveRecord::Migration
  def change
    create_table :magnets do |t|
      t.integer :x
      t.integer :y
      t.string :word
      t.datetime :locked_until
      t.integer :locked_by
      t.integer :door_id

      t.timestamps
    end
  end
end
