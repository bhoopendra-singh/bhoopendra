class ExipreSubscriptionWorker
  include Sidekiq::Worker

  def perform
    subscriptions = Subscription.all
    subscriptions.each do |subscription|
      start_reminder = subscription.expiry_date-5.days
      end_reminder = subscription.expiry_date
      if Date.today >= start_reminder && Date.today < end_reminder
        UserMailer.expiry_subscription_email_to_user(subscription).deliver_now
      elsif Date.today >= end_reminder
        UserMailer.expired_subscription_email_to_user(subscription).deliver_now
        user = subscription.user
        admin_user = AdminUser.last
        UserMailer.expiry_subscription_email_to_admin(admin_user, user).deliver_now
      end
    end
  end
end
   