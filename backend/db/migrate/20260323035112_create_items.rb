class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :url
      t.decimal :last_price, precision: 8, scale: 2
      t.decimal :current_price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
