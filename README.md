# README

This project was built in ruby 2.6.1 and Rails 5.2.3.

After installing ruby and rails, run bundle install.
Next you should run rails db:create db:migrate.
If you want to populate the database, run a get request to /populate_me and wait a few seconds.
This action finds randomicaly 5 sites throgh google and save the data on database. But why only 5? Just to avoid break heroku timeout :D.

There is an API /api/v1/shor where you can run get requests to retrieve long URL passing a short URL, 
something like this: /api/v1/shor?long_url=https://medium.com.

Worker fetch_titles_worker
here i am using Mechanize gem to retrieve data from urls. This way i can find title of the page and some other things.

Service Shortify
here is the mos important topic of the project. How to shortify?

After read some articles and watch some videos about it, i decided create a shor url using this: 
[(0..9).to_a,('A'..'Z').to_a,('a'..'z').to_a].flatten.sample(7).join to get something like this: 'A4ntR45'. 
Then i concatenate this string with domain and that is it. 
I just need a long URl to transform it into this short URL.

Please take a look at services/sites/shortify.

You can find the project running on Heroku here: https://bluecodingshortifytest.herokuapp.com/sites

If by anychance you have any comments, feel free to help.

Cheers!


