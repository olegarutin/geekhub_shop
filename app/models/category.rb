class Category < ApplicationRecord
  validates :title, presence: true

  has_many :products, dependent: :destroy
  has_many :subcategories, dependent: :destroy

  def to_param
    return nil unless persisted?

    [id, title.parameterize].join('-')
  end
end
