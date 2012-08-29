#! ce.user.auth @description: logs when user events 
ce.module "user", (self, ce, Backbone, Marionette, $, _, log, user) ->
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
,ce.log,ce.user