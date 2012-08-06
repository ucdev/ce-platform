/*! ce.Controllers.Sessions extends Backbone.Controller */
ce.module("Controllers",function(self,ce,Backbone,Marionette,$,_) {
	this.Sessions = (function() {
		function sessions() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('sessions'));
			window.col = this.collection;
			main.removeData('sessions');
		}
		
		sessions.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		sessions.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		sessions.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return sessions;
		
	})();
});
