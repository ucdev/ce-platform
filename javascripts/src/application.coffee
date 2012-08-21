define ["require","exports","module","log","backbone","backbone.paginator"],(require,exports,module,log,Backbone) ->
    class App extends Backbone.View
        constructor: ->
            @pagelets = {}
            @models = {}
            @views = {}
            @collections = {}
            @el = $ "#app"

            # FOR BACKWARDS COMPATIBILITY
            @log = require "log"
            class @Collection extends Backbone.Collection

            class @View extends Backbone.View

            class @Model extends Backbone.Model

            class @Pagelet extends @View
                constructor: (@el) ->

        start: ->
            return

    Backbone.Paginator.clientPager.prototype.whereExpanded = (attrs) ->
        return _.filter @origModels, (model) ->
            for key of attrs
                return false unless attrs[key] is model.get(key)
            true

    return App