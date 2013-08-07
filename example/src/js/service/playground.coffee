app = angular.module 'example.api.playground', []

app.factory 'User', ['$q', ($q) ->
    storage = {}
    
    class MockUser
        constructor: (params) ->
            for key, value of params
                @[key] = value
        @query: ->
            dfr = $q.defer()
            values = (val for key, val of storage)
            dfr.resolve(values)
            values.$promise = dfr.promise
            return values
        @save: (params) ->
            user = new @(params)
            user.$save()
            return user
        $save: ->
            storage[@username] = @
            dfr = $q.defer()
            dfr.resolve(@)
            return dfr.promise
        $delete: ->
            delete storage[@username]
            dfr = $q.defer()
            dfr.resolve()
            return dfr.promise
    
    for username in ['bob', 'sally', 'joe', 'rachel']
        user = new MockUser(username: username)
        storage[user.username] = user
    
    return MockUser
]