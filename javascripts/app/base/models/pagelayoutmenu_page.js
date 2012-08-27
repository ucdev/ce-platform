/*! app/models/pagelayoutmenu_page 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu_page
*/
define("app/models/pagelayoutmenu_page",["require","app"],function(require,app) {
	var Pagelayoutmenu_pageModel = app.Model.extend({
		url: function() {
			base = "/api/pagelayoutmenu_pages/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Pagelayoutmenu_pageModel)
});
