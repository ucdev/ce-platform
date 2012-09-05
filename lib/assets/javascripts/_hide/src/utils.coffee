ce.module "utils", (self, ce, Backbone, Marionette, $, _) ->
    self.isBlank = (str) ->
        return (!str || /^\s*$/.test(str));

    self.template = (tmpl) ->
        return ce.templates.get tmpl

    ce = $.extend(ce,self)
    return