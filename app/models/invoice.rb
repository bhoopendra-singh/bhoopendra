class Invoice < ApplicationRecord
  
  belongs_to :user
  belongs_to :order
  
  after_create :send_mail_to_user

  def send_mail_to_user
    UserMailer.with(user: self.user,order: self.order).invoice_email.deliver_now
  end 
end
