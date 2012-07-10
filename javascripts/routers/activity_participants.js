/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activity_participants
 * @def: Router
 */
 
CE.module("activity_participants",function(self,CE,Backbone,Marionette,$,_) {
	this.router = Backbone.Marionette.AppRouter.extend({
		appRoutes: {
			'': 'index',
			'activity_participants/:id': 'show',
			'activity_participants/:id': 'edit'
		}
	});
});
