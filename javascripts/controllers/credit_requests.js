/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: credit_requests
 * @def: Controller
 */
 
CE.module("credit_requests",function(self,CE,Backbone,Marionette,$,_) {
	this.controller = (function() {
		function credit_requests() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('credit_requests'));
			window.col = this.collection;
			main.removeData('credit_requests');
		}
		
		credit_requests.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return CE.mainRegion.show(view);
		};
		
		credit_requests.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return CE.mainRegion.show(view);
		};
		
		credit_requests.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return CE.mainRegion.show(view);
		};
		
		return credit_requests;
		
	})();
});
