class UserMailer < ApplicationMailer
  default from: 'bhoopendra2010singh@gmail.com'
  def invoice_email
    @user = params[:user]
    @order = params[:order]
    if @order.subscription.present?
      @order.generate_pdf_of_subscription
      attachments["subscription.pdf"] = open("/home/rails/rails_work/ofos/subscription.pdf").read
      mail(to: @user.email, subject: 'Subscription of monthly thali')
    else
      @order.generate_pdf_of_invoice
      attachments["invoice.pdf"] = open("/home/rails/rails_work/ofos/invoice.pdf").read
      mail(to: @user.email, subject: 'Invoice of food_items') 
    end
  end

  def expiry_subscription_email_to_user(subscription)
    @user = subscription.user
    mail(to: @user.email, subject: 'Subscription expiring')

  end

  def expired_subscription_email_to_user(subscription)
    @user = subscription.user
    mail(to: @user.email, subject: 'Subscription expired')

  end

  def expiry_subscription_email_to_admin(admin_user, user)
    @user = user
    @admin_user = admin_user
    mail(to: @admin_user.email, subject: 'Subscription expired')
  end
end