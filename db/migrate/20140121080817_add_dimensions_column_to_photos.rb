class AddDimensionsColumnToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :dimensions, :string
  end
end
