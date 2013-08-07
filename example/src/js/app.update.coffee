app = angular.module 'example.app.update', ['example.api']

app.controller 'AppController', ['$scope', 'User', ($scope, User) ->
    $scope.users = []
    $scope.newUsername = ""
    
    $scope.loadUsers = ->
        # Reload the users
        User.query().$promise.then (results) ->
            $scope.users = results
    
    $scope.addUser = ->
        user = new User(username: $scope.newUsername)
        $scope.newUsername = ""
        user.$save()
        .then $scope.loadUsers
    
    $scope.deleteUser = (user) ->
        user.$delete()
        .then $scope.loadUsers
        
    $scope.loadUsers()
]
