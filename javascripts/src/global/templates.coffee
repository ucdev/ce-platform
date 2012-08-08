#! ce.templates @description: template cache 
ce.module "templates", (self, ce, Backbone, Marionette, $, _) ->
  self.get = (tmplKey) ->
    self.cache = {}  unless self.cache
    tmpl = self.cache[tmplKey]
    template = ""
    unless tmpl
      $.ajax
        url: "/tmpls/loader/" + tmplKey
        async: false
        success: (data) ->
          template = data

      
      #ce.log.info(template);
      
      # precompile the template, for underscore.js templates
      tmpl = template
      self.cache[tmplKey] = tmpl
    return tmpl

  self.clear = ->
    self.cache = {}

Backbone.Marionette.TemplateCache::loadTemplate = (templateId) ->
  myTemplate = ce.templates.get(templateId)
  myTemplate