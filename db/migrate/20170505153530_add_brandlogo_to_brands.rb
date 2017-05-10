class AddBrandlogoToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :brandlogo, :string
  end
end
