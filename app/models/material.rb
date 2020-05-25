class Material < ApplicationRecord
  belongs_to :project
  has_one_attached :photo

  validate :image_validation

  private

  def image_validation
    if photo.attached?
      if !photo.blob.content_type.in?(%w(image/jpeg image/jpg image/png))
        photo.purge_later
        errors.add(:photo, 'The image wrong format')
      elsif photo.blob.content_type.in?(%w(image/jpeg image/jpg image/png)) && photo.blob.byte_size > (5 * 1024 * 1024) # Limit size 5MB
        photo.purge_later
        errors.add(:photo, 'The image oversize limited (5MB)')
      end
    elsif photo.attached? == false
      photo.purge_later
      errors.add(:photo, 'The image required.')
    end
  end
end