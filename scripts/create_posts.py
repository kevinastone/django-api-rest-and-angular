#!/usr/bin/env python
from example.api.models import Post, User

bodies = ['This is a great post', 'Another thing I wanted to share']

users = User.objects.all()

for i, body in enumerate(bodies):
    Post.objects.create(author=users[i % users.count()], title="Title #{}".format(i+1), body=body)
