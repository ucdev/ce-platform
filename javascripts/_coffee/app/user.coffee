define "app/user",["require","backbone","jquery"],(require,Backbone,$) ->
    Mixable = require("app/mixable")
    auth = require("app/user/auth")
    #evnts = require("app/user/events")
    console.log(auth)
    class User extends Mixable
        @include auth
        #@include events
        constructor: (params) ->
            @model = new @Model(params)
            
            #@include events
            return
        Model: require("app/models/person")

    module.setExports(User)