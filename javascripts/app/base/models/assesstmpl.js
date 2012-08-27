/*! app/models/assesstmpl 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assesstmpl
*/
define("app/models/assesstmpl",["require","app"],function(require,app) {
	var AssesstmplModel = app.Model.extend({
		url: function() {
			base = "/api/assesstmpls/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssesstmplModel)
});
