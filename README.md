# Overtime App 
## We are going to use ruby 2.4.1 for accomplish this application.

##High level requirement
Company needs documentation that salaried employees did or did not get overtime each week.

We are going to have this models:
- Post
This is the post hourly posting for the employe.
Attributes:
-Date
-Rationale

- User
This will be a devise user.

- AdminUser
We are going to use a STI (single table inheritance), so this will be inside of the user model with the type of AdminUser

#Features:
1. We need to have some approval workflow.
2. We need to send sms messages.
3. Admin dashboard we are going to use the gem Administrate.
4. Email summary to the AdminUsers for approval.
5. Need documentation for no overtime.

Stuff that we need.
- Twlio.
- Devise.
- Administrative Gem.
- Dotenv Gem.
- Bootstrap.

# RSPEC AND CAPYBARA FOR TESTING.
