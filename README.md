# README
Application description
Project Title
“Meowbox”
a website where people can sign up for a monthly subscription for toys and treats for their favorite feline!
User stories:
- As a visitor I want to see a list of subscriptions so I can decide how much to spend a month (three subscription levels hard coded - $10/mo, $30/mo and $100/mo)
- As a visitor I want to be able to learn more about a particular description so I can decide whether or not it’s worth buying (detail page for subscription)
- As a visitor I want to be able to purchase a subscription so I can start treating my cat (don’t worry about processing payments - just ask for first name, last name and email and we’ll ignore the credit card processing piece)
- As a subscriber I want to be able to cancel my subscription at any time so I don’t have to pay for ever
- As a subscriber I want to see what boxes I have received and what each one contained so I can remember what stuff I got and where I could get more of it (this will require login including support for “forgotten password” as users who initially sign up won’t have a password, so they’ll need to have a link emailed to them to update it.
- As an administrator I want to be able to create a new box (subscription level, month and year to uniquely identify it and a title for the theme e.g. “cat coolers for summer”)
- As an administrator I want to be able to add a new item to a box (title, description, image, size, URL to buy more from amazon or other partners)
- As an administrator I want to be able to manually ship a box (when I click the “ship” button on the box it adds it to the history for all current subscribers - but not subscribers who have cancelled)
Remember that the ability to perform the admin tasks should be limited to administrative users, not just logged in users.
To meet the nested form and custom attribute writer you should be able to add up to three items to the box as part of creating the box, and if their title matches exactly an existing item, it should not create a new item, it should just join the box to an existing item. The quantity of the item should be stored in a join table joining the boxes and the items so one box may have the 3 oz kitty bright hair gel and another might have the 6oz.
To meet the nested resource requirements /boxes/1/items should show all of the items in box #1 to anyone who wants to see it and boxes/1/items/new should allow an administrator to add a new item to a box.
/items/new should also allow an admin to add a new item to a box, but they'll have to select from a drop down list of boxes

Installation guide 
fork and clone repo https://github.com/ICanDoAllThingThroughChrist/cat_store

Create your feature or improvement branch:

$ git checkout -b new-feature

Install runtime dependencies:

$ bundle install

Fix mistakes or improve, 

You should open http://localhost:3000 in your browser, and make sure your changes.
Then commit:

$ git commit -am 'add some new feature'
Push your banch to your forked brance

$ git push origin new-feature

Create new Pull Request! Thanks!

Contributing
Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

Author
Charlie Lee

License
This project is licensed under the MIT License - see the LICENSE.md file for details
https://github.com/ICanDoAllThingThroughChrist/cat_store/blob/master/LICENSE.md

Acknowledgments

