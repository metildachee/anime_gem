class RemoveArtistFromManga < ActiveRecord::Migration[6.0]
  def change
    remove_column :mangas, :artist, :string
  end
end
