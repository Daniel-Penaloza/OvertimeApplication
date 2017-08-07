module SmsTool
	account_sid = ENV['TWILIO_ACCOUNT_SID']
	auth_thoken = ENV['TWILIO_AUTH_TOKEN']

	@client = Twilio::REST::Client.new(account_sid, auth_thoken)

	def self.send_sms(number:,message:)
		@client.messages.create(
			from: ENV['TWILIO_PHONE_NUMBER'],
			to: "+52#{number}",
			body: "#{message}"
		)
	end
end