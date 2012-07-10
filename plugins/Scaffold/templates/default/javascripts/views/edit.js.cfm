CE.Views.<%= NamePluralLowercase =%>.edit = Backbone.View.extend({
	events: {
		"submit form": "save"
	},
	
	initialize: function() {
		this.render();
	},
	
	save: function() {
		var self = this;
		var msg = this.model.isNew() ? 'Successfully created!' : "Saved!";
		
		this.model.save({ title: this.$('[name=title]').val(), body: this.$('[name=body]').val() }, {
			success: function(model, resp) {
				new App.Views.Notice({ message: msg });
				
				self.model = model;
				self.render();
				self.delegateEvents();
		
				Backbone.history.saveLocation('documents/' + model.id);
			},
			error: function() {
				new App.Views.Error();
			}
		});
	
		return false;
	},
    
    render: function() {
        $(this.el).html(out);
        $('#app').html(this.el);
    }
});

