Component = require("foundry/component")
auth = require("app/user/auth")
events = {}
Backbone = require("backbone")
#events = require("app/user/events")
#console.log(auth)
class User extends Component
    @include auth
    initialize: () ->

    constructor: (params) ->
        #console.log(params)
        
        @Model = require("app/model")
        @model = new @Model(params)
        #@include events
        
        return

module.setExports(User)