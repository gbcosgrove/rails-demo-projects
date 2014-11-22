class AddCoverPathToBooks < ActiveRecord::Migration
  def change
    add_column :books, :cover_path, :string
  end
end
