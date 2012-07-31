/*! ce.Models.Participant extends Backbone.Model */
ce.pkg("Models",function(self,ce,Backbone,Marionette,$,_) {
	this.Participant =  Backbone.Model.extend({
		defaults: {
			ACTIVITYID: 0,
			ATTENDEEID: 0,
			CITY: "",
			COMPLETEDATE: "",
			CREATED: "",
			CURRSTATUSDATE: "",
			DELETED: "",
			DELETEDFLAG: "N",
			EMAIL: "",
			FIRSTNAME: "",
			FULLNAME: "",
			ISDELETED: false,
			ISMD: false,
			ISREAL: false,
			ISSTATUS1: false,
			ISSTATUS2: false,
			ISSTATUS3: false,
			ISSTATUS4: false,
			LASTNAME: "",
			MDFLAG: "N",
			MIDDLENAME: "",
			PAYAMOUNT: "",
			PAYORDERNO: "",
			PAYMENTDATE: "",
			PERSONDELETED: false,
			PERSONID: 0,
			REGISTERDATE: "",
			STARTDATE: "",
			STATE: "",
			STATUSID: 0,
			STATUSnAME: "",
			TERMDATE: "",
			UPDATED: ""
		},
		
		url: function() {
			return '/activities/' + ce.activity.Model.get('id') + '/participants/' + this.get('attendeeId');
		}
	});
});
