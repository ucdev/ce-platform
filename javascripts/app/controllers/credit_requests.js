/*! ce.Controllers.Credit_requests extends Backbone.Controller */
ce.pkg("Controllers",function(self,ce,Backbone,Marionette,$,_) {
	this.Credit_requests = (function() {
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
			
			return ce.mainRegion.show(view);
		};
		
		credit_requests.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		credit_requests.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return credit_requests;
		
	})();
});
