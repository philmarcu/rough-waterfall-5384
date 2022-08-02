class CreateSupermarketItems < ActiveRecord::Migration[5.2]
  def change
    create_table :supermarket_items do |t|
      t.references :item, foreign_key: true
      t.references :supermarket, foreign_key: true
    end
  end
end
