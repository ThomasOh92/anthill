class Instruction < ApplicationRecord
  belongs_to :project
  has_one_attached :document
end
