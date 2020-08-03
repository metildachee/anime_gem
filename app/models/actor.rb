class Actor < ApplicationRecord

    has_many :characters
    has_many :mangas, through: :characters
end
