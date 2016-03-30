class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :product
      t.string :name
      t.string :kana
      t.string :num
      t.string :rarity
      t.string :image

      t.timestamps
    end
  end
end
