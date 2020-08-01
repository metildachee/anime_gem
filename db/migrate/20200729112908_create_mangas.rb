class CreateMangas < ActiveRecord::Migration[6.0]
  def change
    create_table :mangas do |t|
      t.string :title
      t.string :artist
      t.string :desc
      t.string :img_path
      t.string :genre

      t.timestamps
    end
  end
end
