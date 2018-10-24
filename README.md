Riquired:
sudo gem install bundler
ARCHFLAGS="-arch x86_64" bundle install
Download the Postgres.app from https://postgresapp.com/
Follow the first 2 steps of the 3 step installation instruction for the Postgres.app on https://postgresapp.com/




Instuctions:

Fork this repository and clone it to your computer.

Open up a terminal window and do the following:

Navigate to the root directory and run the command "touch .env".

Next you need to add a single line to the newly created .env file (using any method you like). It should be the declaration of the JWT_PASSWORD variable. This variable is used to help generate hard to spoof tokens for user authentication. This JWT_PASSWORD variable declaration should be written in the following manner:

JWT_PASSWORD = "ANY_LONG_STRING_OF_RANDOM_CHARACTERS"

Next download the Postgres.app from https://postgresapp.com/downloads.html
and then follow the first 2 steps of the 3 step installation instructions for the Postgres.app on https://postgresapp.com/.

After that run the following commands in terminal (you may need an admin password for some of these commands):

* sudo gem install bundler
* ARCHFLAGS="-arch x86_64" bundle install
* rails db:setup
* rails s

Make sure it is running on port 3000 and you are good to go.
