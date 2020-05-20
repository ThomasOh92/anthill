class Instruction < ApplicationRecord
  belongs_to :project
  has_many_attached :images
end
