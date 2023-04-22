class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item, null: false, default: ""
      t.string :title, null: false
      t.text :goods_detail, null: false
      t.integer :category_id, null: false
      t.integer :quality_id, null: false
      t.integer :postage_id, null: false
      t.integer :prefectures_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true     
      t.integer :delivery_id, null: false


      t.timestamps

      
    end
  end
end
