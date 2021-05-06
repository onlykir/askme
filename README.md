Only Ask!
=====================
An educational application, an analogue of the previously popular askme website.

Live version [here](https://onlyask.herokuapp.com/)

The main page displays all registered users to whom you can ask questions. You can add hashtags to questions, 
which are also listed on the home page. 
In order to protect against spam, when creating a question, a recaptcha check is carried out.

### Requirements:
```
ruby '2.7.0' and Ruby on Rails 6.0.3
```

### Installation:
```
$ git clone git@github.com:onlykir/bbq.git
```

### Running:
To run the application, you need to run `bundle` in the application directory to install all the necessary gems and roll all migrations.

+ go to the desired directory
```
$ cd askme
```
+ catch the necessary gems
```
$ bundle
``` 
+ create a database and roll migrations
```
$ rails db:create
$ rails db:migrate
``` 
+ launch
```
$ rails s
``` 
And the app will be available on the local server.
