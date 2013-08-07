app = angular.module 'example.app.basic', []

app.controller 'AppController', ['$scope', '$http', ($scope, $http) ->
    $scope.posts = []
    $http.get('/api/posts').then (result) ->
        angular.forEach result.data, (item) ->
            $scope.posts.push item
]
