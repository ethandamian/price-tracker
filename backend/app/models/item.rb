class Item < ApplicationRecord
  belongs_to :user
  has_many :price_histories , dependent: :destroy

  # Regular expresion for URL validation
  URL_REGEXP = /\Ahttps?:\/\/[\w\.-]+\.[a-z]{2,}(\/.*)?\z/i

  before_validation :smart_add_url_protocol

  validates :name, presence: true
  validates :url, presence: true, format: { with: URL_REGEXP }
  validates :current_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true


  private
  def smart_add_url_protocol
    return if self.url.blank?

    unless self.url =~ URL_REGEXP
      self.url = "http://#{self.url}"
    end
  end
end
