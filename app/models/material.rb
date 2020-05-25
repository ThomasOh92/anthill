class Material < ApplicationRecord
  belongs_to :project
  has_one_attached :photo

  validate :image_validation

  def image_validation
    if photo.attached?
      if !photo.blob.content_type.in?(%w(photo/jpeg photo/jpg photo/png))
        photo.purge_later
        errors.add(:photo, 'The photo wrong format')
      elsif photo.blob.content_type.in?(%w(photo/jpeg photo/jpg photo/png)) && photo.blob.byte_size > (5 * 1024 * 1024) # Limit size 5MB
        photo.purge_later
        errors.add(:photo, 'The photo oversize limited (5MB)')
      end
    elsif photo.attached? == false
      photo.purge_later
      errors.add(:photo, 'The photo required.')
    end
  end
end