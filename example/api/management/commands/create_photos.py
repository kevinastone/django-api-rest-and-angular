import os
import os.path

from django.core.management.base import BaseCommand, CommandError
from django.conf import settings

from example.api.models import Photo, Post


class Command(BaseCommand):
	sample_dir = 'samples'

	def handle(self, *args, **options):
		sample_images = [os.path.join(self.sample_dir, fn) for fn in os.listdir(os.path.join(settings.MEDIA_ROOT, self.sample_dir))]

		posts = Post.objects.all()

		for i, image in enumerate(sample_images):
			Photo.objects.create(post=posts[i % posts.count()], image=image)
