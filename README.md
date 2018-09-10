Instuctions:

Fork this repository and clone it to your computer.

Open up a terminal window and do the following:

Navigate to the root directory and run the command "touch .env".

Next you need to add a single line to the newly created .env file (using any method you like). It should be the declaration of the JWT_PASSWORD variable. This variable is used to help generate hard to spoof tokens for user authentication. This JWT_PASSWORD variable declaration should be written in the following manner:

JWT_PASSWORD = "ANY_LONG_STRING_OF_RANDOM_CHARACTERS"

After that run the following commands in terminal:

* bundle install
* rails db:migrate
* rails db:reset
* rails s

Make sure it is running on port 3000 and you are good to go.
