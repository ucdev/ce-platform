CE.Controllers.<%= NamePluralLowercase =%> = Backbone.Controller.extend({
	routes: {
		"<%= NamePluralLowercase =%>/edit/:id": "edit",
		"<%= NamePluralLowercase =%>/show/:id": "show",
		"": "index",
		"new": "newObj"
    },
    
	/*	INDEX
	 *	@URL: /<%= NamePluralLowercase =%>/index
	 */
    index: function() {
        var objs = new CE.Collections.<%= NamePluralLowercase =%>();
        
		objs.fetch({
            success: function() {
                new CE.Views.<%= NamePluralLowercase =%>.index({ collection: <%= NamePluralLowercase =%> });
            },
            error: function() {
                new Error({ message: "Error loading <%= NamePluralLowercase =%>." });
            }
        });
    },
	
	/*	EDIT
	 *	@URL: /<%= NamePluralLowercase =%>/edit
	 */
    edit: function(id) {
        var obj = new <%= NameSingularLowercase =%>({ id: id });
        
		<%= NameSingularLowercase =%>.fetch({
            success: function(model, resp) {
                new CE.Views.<%= NamePluralLowercase =%>.edit({ model: <%= NameSingularLowercase =%> });
            },
            error: function() {
                new Error({ message: 'Could not find that <%= NameSingularLowercase =%>.' });
                window.location.hash = '#';
            }
        });
    },
	
	/*	SHOW
	 *	@URL: /<%= NamePluralLowercase =%>/show
	 */
    show: function(id) {
        var obj = new <%= NameSingularLowercase =%>({ id: id });
        
		obj.fetch({
            success: function(model, resp) {
                new CE.Views.<%= NamePluralLowercase =%>.edit({ model: <%= NameSingularLowercase =%> });
            },
            error: function() {
                new Error({ message: 'Could not find that <%= NameSingularLowercase =%>.' });
                window.location.hash = '#';
            }
        });
    },
	
    newObj: function() {
        new CE.Views.<%= NamePluralLowercase =%>.edit({ model: new <%= NameSingularLowercase =%>() });
    }
});

