app = angular.module 'example.api', ['ngResource']

app.factory 'User', ['$resource', ($resource) ->
    $resource '/api/users/:username', username: '@username'
]

app.factory 'Post', ['$resource', ($resource) ->
    $resource '/api/posts/:id', id: '@id'
]

app.factory 'Photo', ['$resource', ($resource) ->
    $resource '/api/photos/:id', id: '@id'
]

# And the nested resources
app.factory 'UserPost', ['$resource', ($resource) ->
    $resource '/api/users/:username/posts/:id'
]

app.factory 'PostPhoto', ['$resource', ($resource) ->
    $resource '/api/posts/:post_id/photos/:id'
]
