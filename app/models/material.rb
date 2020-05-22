class Material < ApplicationRecord
  belongs_to :project
  has_many_attached :photos
end