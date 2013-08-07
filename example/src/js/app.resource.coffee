app = angular.module 'example.app.resource', ['example.api']

app.controller 'AppController', ['$scope', 'Post', ($scope, Post) ->
    $scope.posts = Post.query()
]
