app = angular.module 'example.app.editor', ['example.api', 'example.app.photos']

app.controller 'EditController', ['$scope', 'Post', ($scope, Post) ->
    
    $scope.newPost = new Post()
    $scope.save = ->
        $scope.newPost.$save().then (result) ->
            $scope.posts.push result
        .then ->
            # Reset our editor to a new blank post
            $scope.newPost = new Post()
        .then ->
            # Clear any errors
            $scope.errors = null
        , (rejection) ->
            $scope.errors = rejection.data
]
