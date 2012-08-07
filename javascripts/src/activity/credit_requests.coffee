#! ce.activity.credit_requests @description: logs when credit request events 
ce.module "activity.credit_requests", (self, ce, Backbone, Marionette, $, _) ->
  self.ViewListItem = Backbone.Marionette.ItemView.extend(
    tagName: "tr"
    template: "credit_requests-row"
    className: "creditRequest"
  )
  self.ViewList = Backbone.Marionette.CompositeView.extend(
    tagName: "table"
    itemView: self.ViewListItem
    id: "credit_requests"
    className: "table-striped table-bordered"
    template: "credit_requests-table"
    appendHtml: (collectionView, itemView) ->
      collectionView.$("tbody").append itemView.el
  )
  self.load = (params) ->
    self.records = params.records
    self.collection = new ce.Collections.Credit_requests(params.records)
    self.viewList = new self.ViewList(collection: self.collection)
    ce.subpage.show self.viewList
    self.trigger "loaded"
