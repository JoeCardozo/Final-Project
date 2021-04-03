class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|

      t.string :name
      t.string :ticker
      t.integer :price
      
    end
  end
end
