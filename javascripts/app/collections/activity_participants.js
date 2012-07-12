/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activity_participants
 * @def: Collection
 */
 
ce.module("activity_participants",function(self,ce,Backbone,Marionette,$,_) {
	this.collection = Backbone.Collection.extend({
		url: '/api/activity_participants',
		model: this.model
	});
});
