FactoryGirl.define do
	factory :post do
		date 			Date.today
		rationale 		"Some Rationale"
		user
	end

	factory :second_post, class: "Post" do
		date 			Date.yesterday
		rationale 		"Some More Content"
		user
	end

	factory :post_from_other_user, class: "Post" do
		date 			Date.yesterday
		rationale  		"This post shouldn't be seen"
		user {FactoryGirl.create(:non_authorized_user)}
	end
end