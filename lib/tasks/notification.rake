namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they have overtime or not"
  task sms: :environment do
  	# 1. Schedule to run at Sunday at 5pm
  	# 2. Iterate over all employees
  	# 3. Skip AdminUsers
  	# 4. Send a message that has instrictions and a link to log time
  	# 5. No spaces or dashes in the number, exactly 10 caracters and alll the characters have to be a number
  	User.all.each do |user|
  		SmsTool.send_sms()
  	end
  end
end
