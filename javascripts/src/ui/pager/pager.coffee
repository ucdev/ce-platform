ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
  self.Pager = Backbone.View.extend
    pagingTemplate: _.template ce.templates.get "ui-pager"
    initialize: ->
      @collection.on "change", @render, this
      @collection.on "reset", @render, this

    events:
      "click a.js-next-page": "nextPage"
      "click a.js-page": "selectPage"
      "click a.js-prev-page": "prevPage"

    render: ->
      # FORM THE TEMPLATE AND APPEND THE TEMPLATE HTML
      @$el.html @pagingTemplate @collection.info()
      self.trigger "pager_loaded"
      @el

    nextPage: ->
      @collection.nextPage()
      self.trigger "pager_next"

    prevPage: ->
      @collection.previousPage()
      self.trigger "pager_prev"

    selectPage: ->
      pageNo = parseInt($(arguments[0].currentTarget).attr("id").split("-")[1])
      @collection.goTo pageNo
      self.trigger "pager_page_selected"

    updatePageDropdown: ->
      dropdown = @$el.find ".js-pages"
      pageNo = 1

      while pageNo <= @collection.totalPages
        pageEl = $("<li>")
        pageLink = $("<a />").addClass("js-page").text(pageNo).append pageLink
        pageEl.appendTo dropdown
        pageNo++
      self.trigger "pager_dropdown_loaded"
