class Product < ActiveRecord::Base

  validates :sku, presence: true, uniqueness: true

  belongs_to :category, dependent: :destroy

  def price=(val)
    val.sub!(',', '.') if val.is_a?(String)
    self['price'] = val
  end

end
