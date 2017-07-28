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

# Approval Workflow
In this way the user can make a post but the admin user need to aprove this post.
So the relational in the database is going to work in this way:

1. A user is going to enter a post.
2. A admin user is going to have the hability to review it.
3. A admin user is going to have the hability to approve or reject the post.

3.1 if we approve this we need to have the hability to lock the record after is been approved.
3.2 if is rejected it's get back to the user that enter the post.

## Todo:
1. Create a new attribute inside of posts (status).
2. Status need to be present.
3. Status need to have a default value.
4. Implement approval stages.
5. Locking.

## Stages
Record -> Approved => Lock The Record.
Record -> Rejected => Back To User.