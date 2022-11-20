class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum method_of_payment: {credit_card: 0, transfer: 1}
  enum order_status: {waiting: 0, confirmation: 1, production: 2, preparing: 3 , shipped: 4}

  # def address_display　おそらく不要
  #   '〒' + post_code + ' ' + address + ' ' + last_name + ' ' + first_name
  # end
  
end


# 入金待ち　入金確認　製作準備中　発送準備中　発送済