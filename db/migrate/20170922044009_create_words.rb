class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :content
      t.integer :boggle_id, null: false

      t.timestamps
    end

    add_index :words, :boggle_id
  end
end
