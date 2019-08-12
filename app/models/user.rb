
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable     
  validates :first_name, :last_name, :address, :contact_no, presence: true
  has_one :cart
  has_many :orders
  has_many :invoices
  has_many :subscriptions
end
