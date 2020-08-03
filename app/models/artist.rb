class Artist < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3 }
    validates :desc, presence: true
    validates :age, presence: true
    validates :img_path, presence: true

    has_many :mangas
end
