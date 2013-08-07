# Django API with Django Rest Framework and AngularJS-Resource

This sample project is the companion of a [blog post](http://kevinastone.github.io/getting-started-with-django-rest-framework-and-angularjs.html) on how to get started with Django Rest Framework and AngularJS.

## Dependencies

To setup and run the sample code, you're going to need `npm` from NodeJS available to install the frontend code.

## Setup

You're encouraged to setup a `virtualenv` to work in prior to configuring the dependencies.

1. Install Python Requirements

        pip install -r requirements.txt
        python setup.py develop

2. Install Assets

        npm install
        bower install

3. Compile Assets

        grunt

4. Setup the Database

        make create_database; make make_fixtures

5. Run the Server

        ./manage.py runserver

