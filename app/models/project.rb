class Project < ApplicationRecord
  has_and_belongs_to_many :students 
  belongs_to :teacher
  has_many :tasks, dependent: :destroy 
  has_many :instructions, dependent: :destroy 
  has_many :materials, dependent: :destroy 
end
