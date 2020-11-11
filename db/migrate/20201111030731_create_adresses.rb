class CreateAdresses < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :postal,         null:false
      t.string :prefecture_id, null:false
      t.string :municipality,   null:false
      t.string :street,         null:false
      t.string :building
      t.string :phone,          null:false
      t.timestamps
    end
  end
end
