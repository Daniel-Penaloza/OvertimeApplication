@employee = Employee.create(email: "test@test.com", 
					password: "asdfasdf", 
					password_confirmation: "asdfasdf", 
					first_name: "Jon", 
					last_name: "Snow",
					phone: "6643860538")

puts "One user created"

AdminUser.create(email: "admin@test.com",
				 password: "asdfasdf", 
				 password_confirmation: "asdfasdf", 
				 first_name: "Admin", 
				 last_name: "User",
				 phone: "6195927610")

puts "One Admin User Created"

AuditLog.create!(user_id: @employee.id, status: 0, start_date: Date.today - 6.days)
AuditLog.create!(user_id: @employee.id, status: 0, start_date: Date.today - 13.days)
AuditLog.create!(user_id: @employee.id, status: 0, start_date: Date.today - 20.days)

puts "3 autid logs have been created"

100.times do |post|
	Post.create!(date: Date.today, 
		         rationale: "#{post} rationale Lorem ipsum dolor sit amet, consectetur adipisicing elit. Unde officia nam, necessitatibus quis ea iure sequi rerum dicta porro, ipsam eaque. Unde nihil molestias aut quo, voluptas neque, ad dolores.", 
		         user_id: @employee.id, 
		         overtime_request: 2.5)
end

puts "A 100 posts have been created"