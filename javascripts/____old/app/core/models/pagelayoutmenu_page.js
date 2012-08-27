/*! app/models/pagelayoutmenu_page 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu_page
*/
define("app/models/Pagelayoutmenu_page",function(require,app) {
	app.models.Pagelayoutmenu_page = app.Model.extend({
			url: function() {
				base = "/api/pagelayoutmenu_pages/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
