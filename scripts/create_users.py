#!/usr/bin/env python

from example.api.models import User

users = ['Bob', 'Sally', 'Joe', 'Rachel']
for user in users:
    username = user.lower()
    User.objects.create(username=username, email="{}@example.com".format(username), first_name=user)
