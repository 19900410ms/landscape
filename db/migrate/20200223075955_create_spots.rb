class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string     :name,           null: false
      t.string     :image,          null: false
      t.integer    :division_id,    null: false
      t.integer    :prefecture_id,  null: false
      t.string     :address
      t.string     :station
      t.text       :introduction
      t.string     :recommend_season
      t.string     :close_day
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end
