class Project < ApplicationRecord
  has_and_belongs_to_many :students
  belongs_to :teacher
  has_many :tasks
  has_many :instructions
end
