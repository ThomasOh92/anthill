class Project < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :teacher
  has_many :tasks
end
