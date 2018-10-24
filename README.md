Requires:
--------------------
 * Ruby 2.3.3 or greater




Instuctions:
------------------------

Fork this repository and clone it to your computer.

Open up a terminal window and do the following:

Navigate to the directory that this read me resides in and run the command "touch .env" and the "open .env".

Next you need to add a single line to the newly created .env file (using any method you like) and save it. It should be the declaration of the JWT_PASSWORD variable. This variable is used to help generate hard to spoof tokens for user authentication. This JWT_PASSWORD variable declaration should be written in the following manner:

      JWT_PASSWORD = "ANY_LONG_STRING_OF_RANDOM_CHARACTERS"

Next download the Postgres.app from https://postgresapp.com/downloads.html
and then follow the first 2 steps of the 3 step installation instructions for the Postgres.app on https://postgresapp.com/.

After that run the following commands in terminal (you may need an admin password for some of these commands):

 * "sudo gem install bundler" if you don't have bundler installed yet
 * "sudo bundle install" or if that doesn't work try "sudo ARCHFLAGS="-arch x86_64" bundle install" to install all dependencies
 * "rails db:migrate" to start the database
 * "rails db:seed" to seed the database with stock data
 * "rails s" to start the server on localhost:3000

Make sure it is running on port 3000 and you are ready to go to https://github.com/alec-horwitz/AstrologyBrawl-Front and setup the frontend.
