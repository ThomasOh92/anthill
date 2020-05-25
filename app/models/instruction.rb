class Instruction < ApplicationRecord
  belongs_to :project
  has_one_attached :document

  validate :document_validation

  def document_validation
    error_message = ''
    document_valid = true
    if document.attached?
      if !document.blob.content_type.in?(%w(application/pdf))
        document_valid = false
        error_message = 'The document wrong format'
      elsif document.blob.byte_size > (0.1 * 1024 * 1024) && document.blob.content_type.in?(%w(application/pdf))
        document_valid = false
        error_message = 'The document oversize limited (0.1MB)'
      end
    end
    unless document_valid
      errors.add(:document, error_message)
      self.document.purge
    end
  end
end