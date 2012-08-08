#! ce.user.auth @description: logs when user events 
ce.module "user", (self, ce, Backbone, Marionette, $, _, log) ->
  
  #LOGIN CHECK
  self.isLoggedIn = ->
    if self.model.get "loggedIn"
      self.trigger "loggedIn"
      true
    else
      self.trigger "loggedOut"
      false

  self.checkStatus = () ->
    $.ajax
      url: "/sessions/status"
      type: "post"
      dataType: "json"
      success: (data) ->
        if data.STATUS
          log.info "user status: " + data.STATUSMSG
        else
          log.warn "user status: " + data.STATUSMSG
        return
    return

  self.hasAuthority = (authorityId) ->
    if self.model.get("account").AuthorityID is authorityId
      return true
    else
      return false

  self.isAdmin = ->
    if self.model.get("account").AuthorityID  is 3
      log.info "authority: admin"
      true
    else
      log.info "authority: user"
      false

  self.LoginView = Backbone.View.extend(
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
      return

    events:
      "change input":"change"
      "click .cancel":"cancel"
      "submit":"submitLogin"
    change: (event) ->

      return

    submitLogin: (params) ->
      view = this;
      $form = $(view.el).find 'form'
      $form.ajaxSubmit
        dataType:'json'
        success: (data) ->
          if data.STATUS
            self.load(data.PAYLOAD)

            view.close()
          else
            $(view.el).find('.flash').text("Login failed!")
          return
      return false

    cancel: () ->

      return


  )

  #LOGIN FUNCTION
  self.login = (params) ->
    view = new self.LoginView()
    ce.dialog.show view
    self.trigger "loggedIn"
    return

  
  #LOGOUT FUNCTION
  self.logout = (params) ->
    self.trigger "loggedOut"
    return

  return
,ce.log
