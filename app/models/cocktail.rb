class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  mount_uploader :photo, PhotoUploader

  validates :name, uniqueness: true, presence: true


  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

end
