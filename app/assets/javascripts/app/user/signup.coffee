#! ce.user.auth @description: logs when user events 
define "app/user/signup",["require","backbone","jquery"],(require,Backbone,$) ->
    self = {}
    self.views.SignupForm = Backbone.View.extend(
        el:"#frmRegister"
        
        render: ->
            view = this
            return
        events:
            "change input":"change"
            "click .cancel":"cancel"
            "submit":"submitLogin"
        change: (event) ->
            this
        submitSignup: (params) ->
            view = this
            $form = $(view.el).find 'form'
            $form.ajaxSubmit
                dataType:'json'
                success: (data) ->
                    if data.STATUS
                        self.load(data.PAYLOAD)

                        view.close()
                    else
                        $(view.el).find('.flash').text("Login failed!")
                    return false
        cancel: () ->
            return
    )
    return

    module.setExports(self)