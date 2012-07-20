Backbone.Marionette.TemplateCache.prototype.loadTemplate = function(templateId){
	var myTemplate = _.template(ce.templates[templateId]);
	
	return myTemplate;
}