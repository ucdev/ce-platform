/*! ce.Controllers.People extends Backbone.Controller */
ce.pkg("Controllers",function(self,ce,Backbone,Marionette,$,_) {
	this.People = (function() {
		function people() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('people'));
			window.col = this.collection;
			main.removeData('people');
		}
		
		people.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		people.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		people.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return people;
		
	})();
});
