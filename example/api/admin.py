from django.contrib import admin

from .models import User, Post, Photo


admin.site.register(User)
admin.site.register(Post)
admin.site.register(Photo)
