class Category < ApplicationRecord
  validates :title, presence: true

  has_many :products

  def to_param
    return nil unless persisted?

    [id, title.parameterize].join('-')
  end
end
