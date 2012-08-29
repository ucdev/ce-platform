BackbonePaginator = require "backbone.paginator"
BackbonePaginator.clientPager.prototype.whereExpanded = (attrs) ->
    return _.filter @origModels, (model) ->
        for key of attrs
            return false unless attrs[key] is model.get(key)
        true

class Collection_paged extends BackbonePaginator.clientPager
    constructor:() ->

module.setExports(Collection_paged)