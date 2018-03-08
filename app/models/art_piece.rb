class ArtPiece < ApplicationRecord
  belongs_to :gallery

  validates_presence_of :title, :year, :artist
end
