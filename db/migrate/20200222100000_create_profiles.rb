class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string  :citizenship, null: false
      t.string  :icon
      t.string  :gender,      null: false
      t.integer :age,         null: false
      t.timestamps
    end
  end
end
