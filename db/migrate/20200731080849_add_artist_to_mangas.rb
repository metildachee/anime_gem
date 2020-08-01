class AddArtistToMangas < ActiveRecord::Migration[6.0]
  def change
    add_reference :mangas, :artist, null: true, foreign_key: true
  end
end
