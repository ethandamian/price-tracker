class CreatePriceHistories < ActiveRecord::Migration[8.1]
  def change
    create_table :price_histories do |t|
      t.references :item, null: false, foreign_key: true
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
