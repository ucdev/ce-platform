#! ce.user.auth @description: logs when user events 
ce.module "user", (self, ce, Backbone, Marionette, $, _) ->
  
  #LOGIN CHECK
  self.isLoggedIn = ->
    if self.model.get("loggedIn")
      self.trigger "loggedIn"
      true
    else
      false

  self.loginView = Backbone.View.extend(
    tagName: "div"
    className: ""
    render: ->
      view = this
      $.ajax
        url: "/login"
        type: "post"
        success: (data) ->
          $(view.el).html data
          this

  )
  
  #LOGIN FUNCTION
  self.login = (params) ->
    view = new self.loginView()
    ce.dialog.show view
    self.trigger "loggedIn"

  
  #LOGOUT FUNCTION
  self.logout = (params) ->
    self.trigger "loggedOut"
