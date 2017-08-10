namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they have overtime or not"
  task sms: :environment do
  	if Time.now.sunday?
  	  employees = Employee.all
      notification_message = "Please log into the overtime management dashboard to request overtime or confirm your hours for last week: https://w1p-overtime.herokuapp.com"
      # 4. Send a message that has instrictions and a link to log time
  	  # 5. No spaces or dashes in the number, exactly 10 caracters and alll the characters have to be a number
      employees.each do |employee|
        SmsTool.send_sms(number: employee.phone ,message: notification_message)
     end
    end
  end

  desc "Sends mail notification to managers (admin users) each day to inform of pending overtime requests"
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end