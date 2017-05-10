class CreateSneakers < ActiveRecord::Migration[5.1]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :brand_id
      t.string :price
      t.string :size
      t.string :sex

      t.timestamps
    end
  end
end
