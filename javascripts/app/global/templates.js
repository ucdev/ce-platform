/*! ce.templates @description: template cache */
ce.module("templates",function(self,ce,Backbone,Marionette,$,_) {
	self.get = function(tmplKey){
		if (!self.cache){ self.cache = {}; }
	
		var tmpl = self.cache[tmplKey];
		var template = "";
		if (!tmpl){
			$.ajax({
			   url:'/tmpls/loader/' + tmplKey,
			   type:'post',
			   dataType:'html',
			   async:false,
			   success:function(data) {
				template = data;
			   }
			});
		  // precompile the template, for underscore.js templates
		  tmpl = _.template(template.toString());
		  self.cache[tmplKey] = tmpl;
		}
	
		return tmpl;
	}
});
ce.templates.get('credit_requests-row');

Backbone.Marionette.TemplateCache.prototype.loadTemplate = function(templateId){
	var myTemplate = ce.templates.get(templateId);
	
	return myTemplate;
}