class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :desc
      t.integer :age
      t.string :img_path

      t.timestamps
    end
  end
end
