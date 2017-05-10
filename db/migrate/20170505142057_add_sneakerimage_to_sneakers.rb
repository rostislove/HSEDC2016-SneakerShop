class AddSneakerimageToSneakers < ActiveRecord::Migration[5.1]
  def change
    add_column :sneakers, :sneakerimage, :string
  end
end
