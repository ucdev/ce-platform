/*! ce.Models.Activity_participant extends Backbone.Model */
ce.module("Models",function(self,ce,Backbone,Marionette,$,_) {
	this.Activity_participant =  Backbone.Model.extend({
		defaults: {
			activityId: 0,
			attendeeId: 0,
			city: "",
			completeDate: "",
			created: "",
			currStatusDate: "",
			deleted: "",
			deletedFlag: "N",
			email: "",
			firstName: "",
			fullName: "",
			isDeleted: false,
			isMD: false,
			isReal: false,
			isStatus1: false,
			isStatus2: false,
			isStatus3: false,
			isStatus4: false,
			lastName: "",
			mdFlag: "N",
			middleName: "",
			payAmount: "",
			payOrderNo: "",
			paymentDate: "",
			personDeleted: false,
			personId: 0,
			registerDate: "",
			startDate: "",
			state: "",
			statusId: 0,
			statusName: "",
			termDate: "",
			updated: ""
		},
		
		url: function() {
			return '/activities/' + ce.activity.Model.get('id') + '/participants/' + this.get('attendeeId');
		}
	});
});