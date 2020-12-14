Leaderboard Website

This is a small proof-of-concept of what a single website leaderboard could look like. At the moment, its purely set up for Super Mario 64 70 star speedruns, but it could be used for anything that you'd want a leaderboard for. 

FUNCTIONALITY:

You're able to Sign-up and Login as you would expect. When logged in, you can upload all the times you've gotten. If you make a mistake while adding times, you can edit the times you've submnitted or just delete them. Of course, you can't delete other people's times, although having a moderator of the board could be added in the future.

HOW TO USE:

Once you clone the repository, you want to make sure you run `bundle install`. To run the website locally, all you need to do is `shotgun` and you'll be able to access it at `localhost:9393`! If you want a fresh start on the database, doing `rake db:rollback` once will drop the "runs" table, and doing it a second time will drop the "users" table. to get them back, just do `rake db:migrate`. (Only have to do it once even if you rollback twice)

BUGS:

I've fixed all the bugs I've been able to find, so as far as I know there isn't any?

License:

This CLI project is available as open source under the terms of the MIT License.

TO-DO:

-Add moderator that can edit and delete everybody's times
-Add form of verification, so the mod can reject or deny runs depending on proof added
-Make it look pretty and not just black and white

CONTRIBUTING:

If you would like to make this better, feel free to pull as much as you'd like. If you intend to make a speedrunning leaderboard, check out speedrun.com first, unless you really want a site specifically for one game.
