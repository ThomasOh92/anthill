class Task < ApplicationRecord
  belongs_to :project 
  has_many :taskcomments, dependent: :destroy 
end
