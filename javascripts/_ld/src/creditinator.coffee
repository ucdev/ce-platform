#! ce.creditinator
ce.module "creditinator", (self, ce, Backbone, Marionette, $, _, models,log,ui) ->
    self.Model = ce._core.models.Credit_request.extend({})

    self.load = (params) ->
        self.model = new self.Model()
        self.stepView = new self.views.steps.Start()
        self.trigger "loaded"
        return

    self.on "loaded", ->
        log.info "creditinator: loaded"
        return
    return
,ce._core.models,ce.log,ce.ui