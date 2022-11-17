class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :last_name, presence: ture
  validates :first_name, presence: ture
  validates :last_name_kana, presence: ture
  validates :first_name_kana, presence: ture
  validates :post_code, presence: ture
  validates :address, presence: ture
  validates :phone_number, presence: ture
         
  has_many :shipping_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
end
