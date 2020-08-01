class RemoveGenreFromManga < ActiveRecord::Migration[6.0]
  def change
    remove_column :mangas, :genre, :string
  end
end
