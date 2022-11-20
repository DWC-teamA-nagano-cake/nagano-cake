class Product < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  has_one_attached :product_image

  validates :price, presence: true

  def get_product_image
    unless product_image.attached?
      file_path=Rails.root.join('app/assets/images/no_cake_image.jpg')
      product_image.attach(io:File.open(file_path),filename:'default-image.jpg',content_type:'image/jpeg')
    end
    product_image
  end

  def with_tax_price
    tax = 1.1
    (price*tax).floor
  end

end
