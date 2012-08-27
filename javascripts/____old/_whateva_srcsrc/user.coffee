define "app/user",["require","backbone","jquery"],(require,Backbone,$) ->
    class User extends Backbone.View
        constructor: (params) ->
            @model = new self.Model(params)
            @trigger "loaded"
            @isLoggedIn()
            
            return

            $ ->
                $(".loginLink").click (ev) ->
                    user.login {}

                    ev.preventDefault()
                    false
                return
            return

            module.setExports(user)
        Model: require("app/models/Person")