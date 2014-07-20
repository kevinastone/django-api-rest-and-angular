from rest_framework import serializers

from .models import User, Post, Photo


class UserSerializer(serializers.ModelSerializer):
    posts = serializers.HyperlinkedIdentityField('posts', view_name='userpost-list', lookup_field='username')
    
    class Meta:
        model = User
        fields = ('id', 'username', 'first_name', 'last_name', 'posts', )


class PostSerializer(serializers.ModelSerializer):
    author = UserSerializer(required=False)
    photos = serializers.HyperlinkedIdentityField('photos', view_name='postphoto-list')
    # author = serializers.HyperlinkedRelatedField(view_name='user-detail', lookup_field='username')
    
    def get_validation_exclusions(self, instance=None):
        # Need to exclude `user` since we'll add that later based off the request
        exclusions = super(PostSerializer, self).get_validation_exclusions(instance=instance)
        return exclusions + ['author']
    
    class Meta:
        model = Post


class PhotoSerializer(serializers.ModelSerializer):
    image = serializers.Field('image.url')
    
    class Meta:
        model = Photo
