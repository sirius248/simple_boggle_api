class CreateBoggles < ActiveRecord::Migration[5.1]
  def change
    create_table :boggles do |t|
      t.text :data, array: true, default: [], null: false

      t.timestamps
    end
  end
end
