FactoryGirl.define do
	factory :post do
		date 				Date.today
		rationale 			"Some Rationale"
		overtime_request	3.5
		user
	end

	factory :second_post, class: "Post" do
		date 				Date.yesterday
		rationale 			"Some More Content"
		overtime_request 	1.5
		user
	end

	factory :post_from_other_user, class: "Post" do
		date 				Date.yesterday
		rationale  			"This post shouldn't be seen"
		overtime_request 	0.5
		user {FactoryGirl.create(:non_authorized_user)}
	end
end