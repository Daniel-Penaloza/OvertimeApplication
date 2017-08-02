require 'rails_helper'

describe 'navigate' do
	before do
		@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)
	end

	describe 'index' do
		before do 
			visit posts_path
		end
		
		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of Posts' do
			expect(page).to have_content(/Posts/)
		end

		it 'has a list of posts' do
			visit posts_path
			expect(page).to have_content(/Rationale|Content/)
		end

		it 'has a scope so that only post creators can see their posts' do
			post1 = FactoryGirl.create(:post, user_id: @user.id)
			post2 = FactoryGirl.create(:second_post, user_id: @user.id)
			post_from_other_user = FactoryGirl.create(:post_from_other_user)
			
			visit posts_path
			expect(page).to have_content(post1.rationale && post2.rationale)
			expect(page).to_not have_content(post_from_other_user.rationale)
		end
	end

	describe 'new' do
		it 'has a link from the homepage' do
			visit root_path
			click_link("new_post_from_nav")
		end
	end

	describe 'creation' do
		before do
			visit new_post_path
		end
		
		it 'has a new form for create a post' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Some rationale"
			click_on "Save Post"

			expect(page).to have_content("Some rationale")
		end

		it 'will have a user associated it' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "User Association"
			click_on "Save Post"

			expect(User.last.posts.last.rationale).to eq("User Association")
		end
	end

	describe 'edit' do
		before do
			@post = FactoryGirl.create(:post, user_id: @user.id)
		end

		it 'can be reached by clicking edit on index page' do
			visit posts_path

			click_link("edit_#{@post.id}_post")
			expect(page.status_code).to eq(200)
		end

		it 'can be edited' do
			visit edit_post_path(@post)
			fill_in 'post[date]', with: Date.tomorrow
			fill_in 'post[rationale]', with: "Edited Content"
			click_on "Save Post"

			expect(page).to have_content("Edited Content")
		end

		it 'cannot be edited by a non authorized user' do
			logout(:user)
			non_authorized_user = FactoryGirl.create(:non_authorized_user)
			login_as(non_authorized_user, :scope => :user)

			visit edit_post_path(@post)
			expect(current_path).to eq(root_path)
		end
	end

	describe 'delete' do
		it 'can be deleted' do
			@post = FactoryGirl.create(:post, user_id: @user.id)
			visit posts_path

			click_on("delete_#{@post.id}_post")
			expect(page.status_code).to eq(200)
			expect(page).not_to have_content("Some Rationale")
		end
	end
end