#!/usr/bin/env python
import os
import os.path
from example.api.models import Photo, Post

from django.conf import settings

sample_dir = 'samples'
sample_images = [os.path.join(sample_dir, fn) for fn in os.listdir(os.path.join(settings.MEDIA_ROOT, sample_dir))]

posts = Post.objects.all()

for i, image in enumerate(sample_images):
    Photo.objects.create(post=posts[i % posts.count()], image=image)
