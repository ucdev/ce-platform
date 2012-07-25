/*! ce.templates @description: template cache */
ce.module("templates",function(self,ce,Backbone,Marionette,$,_) {
	self.get = function(tmplKey){
		if (!self.cache){ self.cache = {}; }
	
		var tmpl = self.cache[tmplKey];
		var template = "";
		if (!tmpl){
			$.ajax({
				url:'/tmpls/loader/' + tmplKey,
				async:false,
				success:function(data) {
					template = data;
					//ce.log.info(template);
				}
			});
		  // precompile the template, for underscore.js templates
		  tmpl = template;
		  self.cache[tmplKey] = tmpl;
		}
	
		return tmpl;
	}
});
Backbone.Marionette.TemplateCache.prototype.loadTemplate = function(templateId){
	var myTemplate = ce.templates.get(templateId);
	
	return myTemplate;
}