/*! app/models/assesstmpl 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assesstmpl
*/
define("app/models/assesstmpl",["require"],function(require) {
	var AppModel = require("app/model");
	var AssesstmplModel = AppModel.extend({
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
