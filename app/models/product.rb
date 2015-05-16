class Product < ActiveRecord::Base
  # belongs_to :category
  belongs_to :subcategory
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  validates :author,  presence: true, length: { maximum: 50 }
  validates :format,  presence: true, length: { maximum: 10 }
  validates :description,  presence: true
  validates :image_url,  presence: true, format: { with: %r{\.(gif|jpg|png)$}i, multiline: true, message: 'must be a URL for GIF, JPG ' + 'or PNG image.'}
  validates :price,  presence: true, numericality: true
  validate :price_at_least_fifty_soms
  validates :year,  presence: true, length: { maximum: 4 }
  validates :papers_count,  presence: true

  protected
  def price_at_least_fifty_soms
    errors.add(:price, 'should be at least 50 soms' ) if price.nil? ||
        price < 50
  end

end
