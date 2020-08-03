class Manga < ApplicationRecord
    validates :title, presence: true, length: { minimum: 3 }
    validates :desc, presence: true
    validates :img_path, presence: true

    belongs_to :artist
    has_and_belongs_to_many :genres
end
