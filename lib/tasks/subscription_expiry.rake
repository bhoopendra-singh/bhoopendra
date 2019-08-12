namespace :subscription_expiry do
  desc "rake tsk to subscription_expiry"
  task my_task: :environment do
  	puts "sent mail to user"
    subexp = ExipreSubscriptionWorker.perform_async
    puts "#{Time.now} - Done!" + subexp.to_s
  end
end
