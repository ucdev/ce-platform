/*! app/models/account 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Account
*/
define("app/models/account",["require","app"],function(require,app) {
	var AccountModel = app.Model.extend({
		url: function() {
			base = "/api/accounts/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AccountModel)
});
/*! app/models/action 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Action
*/
define("app/models/action",["require","app"],function(require,app) {
	var ActionModel = app.Model.extend({
		url: function() {
			base = "/api/actions/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ActionModel)
});
/*! app/models/activity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity
*/
define("app/models/activity",["require","app"],function(require,app) {
	var ActivityModel = app.Model.extend({
		url: function() {
			base = "/api/activities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ActivityModel)
});
/*! app/models/activity_accme 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_accme
*/
define("app/models/activity_accme",["require","app"],function(require,app) {
	var Activity_accmeModel = app.Model.extend({
		url: function() {
			base = "/api/activity_accmes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_accmeModel)
});
/*! app/models/activity_application 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_application
*/
define("app/models/activity_application",["require","app"],function(require,app) {
	var Activity_applicationModel = app.Model.extend({
		url: function() {
			base = "/api/activity_applications/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_applicationModel)
});
/*! app/models/activity_categorylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_categorylm
*/
define("app/models/activity_categorylm",["require","app"],function(require,app) {
	var Activity_categorylmModel = app.Model.extend({
		url: function() {
			base = "/api/activity_categorylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_categorylmModel)
});
/*! app/models/activity_cdc 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_cdc
*/
define("app/models/activity_cdc",["require","app"],function(require,app) {
	var Activity_cdcModel = app.Model.extend({
		url: function() {
			base = "/api/activity_cdcs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_cdcModel)
});
/*! app/models/activity_comment 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_comment
*/
define("app/models/activity_comment",["require","app"],function(require,app) {
	var Activity_commentModel = app.Model.extend({
		url: function() {
			base = "/api/activity_comments/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_commentModel)
});
/*! app/models/activity_committee 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_committee
*/
define("app/models/activity_committee",["require","app"],function(require,app) {
	var Activity_committeeModel = app.Model.extend({
		url: function() {
			base = "/api/activity_committees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_committeeModel)
});
/*! app/models/activity_container 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_container
*/
define("app/models/activity_container",["require","app"],function(require,app) {
	var Activity_containerModel = app.Model.extend({
		url: function() {
			base = "/api/activity_containers/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_containerModel)
});
/*! app/models/activity_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_credit
*/
define("app/models/activity_credit",["require","app"],function(require,app) {
	var Activity_creditModel = app.Model.extend({
		url: function() {
			base = "/api/activity_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_creditModel)
});
/*! app/models/activity_faculty 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_faculty
*/
define("app/models/activity_faculty",["require","app"],function(require,app) {
	var Activity_facultyModel = app.Model.extend({
		url: function() {
			base = "/api/activity_faculties/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_facultyModel)
});
/*! app/models/activity_finbudget 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_finbudget
*/
define("app/models/activity_finbudget",["require","app"],function(require,app) {
	var Activity_finbudgetModel = app.Model.extend({
		url: function() {
			base = "/api/activity_finbudgets/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finbudgetModel)
});
/*! app/models/activity_finfee 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_finfee
*/
define("app/models/activity_finfee",["require","app"],function(require,app) {
	var Activity_finfeeModel = app.Model.extend({
		url: function() {
			base = "/api/activity_finfees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finfeeModel)
});
/*! app/models/activity_finledger 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_finledger
*/
define("app/models/activity_finledger",["require","app"],function(require,app) {
	var Activity_finledgerModel = app.Model.extend({
		url: function() {
			base = "/api/activity_finledgers/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finledgerModel)
});
/*! app/models/activity_finsupport 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_finsupport
*/
define("app/models/activity_finsupport",["require","app"],function(require,app) {
	var Activity_finsupportModel = app.Model.extend({
		url: function() {
			base = "/api/activity_finsupports/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_finsupportModel)
});
/*! app/models/activity_note 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_note
*/
define("app/models/activity_note",["require","app"],function(require,app) {
	var Activity_noteModel = app.Model.extend({
		url: function() {
			base = "/api/activity_notes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_noteModel)
});
/*! app/models/activity_other 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_other
*/
define("app/models/activity_other",["require","app"],function(require,app) {
	var Activity_otherModel = app.Model.extend({
		url: function() {
			base = "/api/activity_others/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_otherModel)
});
/*! app/models/activity_participant 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_participant
*/
define("app/models/activity_participant",["require","app"],function(require,app) {
	var Activity_participantModel = app.Model.extend({
		url: function() {
			base = "/api/activity_participants/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_participantModel)
});
/*! app/models/activity_profile 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_profile
*/
define("app/models/activity_profile",["require","app"],function(require,app) {
	var Activity_profileModel = app.Model.extend({
		url: function() {
			base = "/api/activity_profiles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_profileModel)
});
/*! app/models/activity_pubcomponent 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubcomponent
*/
define("app/models/activity_pubcomponent",["require","app"],function(require,app) {
	var Activity_pubcomponentModel = app.Model.extend({
		url: function() {
			base = "/api/activity_pubcomponents/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_pubcomponentModel)
});
/*! app/models/activity_publish 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_publish
*/
define("app/models/activity_publish",["require","app"],function(require,app) {
	var Activity_publishModel = app.Model.extend({
		url: function() {
			base = "/api/activity_publishes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_publishModel)
});
/*! app/models/activity_pubstep 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubstep
*/
define("app/models/activity_pubstep",["require","app"],function(require,app) {
	var Activity_pubstepModel = app.Model.extend({
		url: function() {
			base = "/api/activity_pubsteps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_pubstepModel)
});
/*! app/models/activity_site 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_site
*/
define("app/models/activity_site",["require","app"],function(require,app) {
	var Activity_siteModel = app.Model.extend({
		url: function() {
			base = "/api/activity_sites/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_siteModel)
});
/*! app/models/activity_specialtylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_specialtylm
*/
define("app/models/activity_specialtylm",["require","app"],function(require,app) {
	var Activity_specialtylmModel = app.Model.extend({
		url: function() {
			base = "/api/activity_specialtylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_specialtylmModel)
});
/*! app/models/activity_step 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_step
*/
define("app/models/activity_step",["require","app"],function(require,app) {
	var Activity_stepModel = app.Model.extend({
		url: function() {
			base = "/api/activity_steps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_stepModel)
});
/*! app/models/activity_tag_relate 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag_relate
*/
define("app/models/activity_tag_relate",["require","app"],function(require,app) {
	var Activity_tag_relateModel = app.Model.extend({
		url: function() {
			base = "/api/activity_tag_relates/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_tag_relateModel)
});
/*! app/models/activity_tag 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag
*/
define("app/models/activity_tag",["require","app"],function(require,app) {
	var Activity_tagModel = app.Model.extend({
		url: function() {
			base = "/api/activity_tags/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_tagModel)
});
/*! app/models/activity_user 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_user
*/
define("app/models/activity_user",["require","app"],function(require,app) {
	var Activity_userModel = app.Model.extend({
		url: function() {
			base = "/api/activity_users/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_userModel)
});
/*! app/models/activity_vote 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Activity_vote
*/
define("app/models/activity_vote",["require","app"],function(require,app) {
	var Activity_voteModel = app.Model.extend({
		url: function() {
			base = "/api/activity_votes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Activity_voteModel)
});
/*! app/models/agenda 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Agenda
*/
define("app/models/agenda",["require","app"],function(require,app) {
	var AgendaModel = app.Model.extend({
		url: function() {
			base = "/api/agendas/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AgendaModel)
});
/*! app/models/assessanswer 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assessanswer
*/
define("app/models/assessanswer",["require","app"],function(require,app) {
	var AssessanswerModel = app.Model.extend({
		url: function() {
			base = "/api/assessanswers/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssessanswerModel)
});
/*! app/models/assessment 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assessment
*/
define("app/models/assessment",["require","app"],function(require,app) {
	var AssessmentModel = app.Model.extend({
		url: function() {
			base = "/api/assessments/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssessmentModel)
});
/*! app/models/assessquestion 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assessquestion
*/
define("app/models/assessquestion",["require","app"],function(require,app) {
	var AssessquestionModel = app.Model.extend({
		url: function() {
			base = "/api/assessquestions/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssessquestionModel)
});
/*! app/models/assessresult 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assessresult
*/
define("app/models/assessresult",["require","app"],function(require,app) {
	var AssessresultModel = app.Model.extend({
		url: function() {
			base = "/api/assessresults/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssessresultModel)
});
/*! app/models/assesssection 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assesssection
*/
define("app/models/assesssection",["require","app"],function(require,app) {
	var AssesssectionModel = app.Model.extend({
		url: function() {
			base = "/api/assesssections/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssesssectionModel)
});
/*! app/models/assesstmpl 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Assesstmpl
*/
define("app/models/assesstmpl",["require","app"],function(require,app) {
	var AssesstmplModel = app.Model.extend({
		url: function() {
			base = "/api/assesstmpls/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AssesstmplModel)
});
/*! app/models/attendee 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee
*/
define("app/models/attendee",["require","app"],function(require,app) {
	var AttendeeModel = app.Model.extend({
		url: function() {
			base = "/api/attendees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AttendeeModel)
});
/*! app/models/attendee_address 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee_address
*/
define("app/models/attendee_address",["require","app"],function(require,app) {
	var Attendee_addressModel = app.Model.extend({
		url: function() {
			base = "/api/attendee_addresses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Attendee_addressModel)
});
/*! app/models/attendee_component 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee_component
*/
define("app/models/attendee_component",["require","app"],function(require,app) {
	var Attendee_componentModel = app.Model.extend({
		url: function() {
			base = "/api/attendee_components/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Attendee_componentModel)
});
/*! app/models/attendee_phone 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee_phone
*/
define("app/models/attendee_phone",["require","app"],function(require,app) {
	var Attendee_phoneModel = app.Model.extend({
		url: function() {
			base = "/api/attendee_phones/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Attendee_phoneModel)
});
/*! app/models/attendee_step 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendee_step
*/
define("app/models/attendee_step",["require","app"],function(require,app) {
	var Attendee_stepModel = app.Model.extend({
		url: function() {
			base = "/api/attendee_steps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Attendee_stepModel)
});
/*! app/models/attendeecdc 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendeecdc
*/
define("app/models/attendeecdc",["require","app"],function(require,app) {
	var AttendeecdcModel = app.Model.extend({
		url: function() {
			base = "/api/attendeecdcs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AttendeecdcModel)
});
/*! app/models/attendeecredit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Attendeecredit
*/
define("app/models/attendeecredit",["require","app"],function(require,app) {
	var AttendeecreditModel = app.Model.extend({
		url: function() {
			base = "/api/attendeecredits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AttendeecreditModel)
});
/*! app/models/authority 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Authority
*/
define("app/models/authority",["require","app"],function(require,app) {
	var AuthorityModel = app.Model.extend({
		url: function() {
			base = "/api/authorities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AuthorityModel)
});
/*! app/models/authoritypage 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Authoritypage
*/
define("app/models/authoritypage",["require","app"],function(require,app) {
	var AuthoritypageModel = app.Model.extend({
		url: function() {
			base = "/api/authoritypages/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AuthoritypageModel)
});
/*! app/models/category 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Category
*/
define("app/models/category",["require","app"],function(require,app) {
	var CategoryModel = app.Model.extend({
		url: function() {
			base = "/api/categories/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(CategoryModel)
});
/*! app/models/cert 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Cert
*/
define("app/models/cert",["require","app"],function(require,app) {
	var CertModel = app.Model.extend({
		url: function() {
			base = "/api/certs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(CertModel)
});
/*! app/models/cert_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Cert_credit
*/
define("app/models/cert_credit",["require","app"],function(require,app) {
	var Cert_creditModel = app.Model.extend({
		url: function() {
			base = "/api/cert_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Cert_creditModel)
});
/*! app/models/certificate 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Certificate
*/
define("app/models/certificate",["require","app"],function(require,app) {
	var CertificateModel = app.Model.extend({
		url: function() {
			base = "/api/certificates/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(CertificateModel)
});
/*! app/models/comment 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Comment
*/
define("app/models/comment",["require","app"],function(require,app) {
	var CommentModel = app.Model.extend({
		url: function() {
			base = "/api/comments/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(CommentModel)
});
/*! app/models/credit_cert 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Credit_cert
*/
define("app/models/credit_cert",["require","app"],function(require,app) {
	var Credit_certModel = app.Model.extend({
		url: function() {
			base = "/api/credit_certs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Credit_certModel)
});
/*! app/models/credit_request 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Credit_request
*/
define("app/models/credit_request",["require","app"],function(require,app) {
	var Credit_requestModel = app.Model.extend({
		url: function() {
			base = "/api/credit_requests/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Credit_requestModel)
});
/*! app/models/credit_request_email 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_email
*/
define("app/models/credit_request_email",["require","app"],function(require,app) {
	var Credit_request_emailModel = app.Model.extend({
		url: function() {
			base = "/api/credit_request_emails/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Credit_request_emailModel)
});
/*! app/models/credit_request_import 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_import
*/
define("app/models/credit_request_import",["require","app"],function(require,app) {
	var Credit_request_importModel = app.Model.extend({
		url: function() {
			base = "/api/credit_request_imports/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Credit_request_importModel)
});
/*! app/models/degree 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Degree
*/
define("app/models/degree",["require","app"],function(require,app) {
	var DegreeModel = app.Model.extend({
		url: function() {
			base = "/api/degrees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(DegreeModel)
});
/*! app/models/degree_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Degree_credit
*/
define("app/models/degree_credit",["require","app"],function(require,app) {
	var Degree_creditModel = app.Model.extend({
		url: function() {
			base = "/api/degree_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Degree_creditModel)
});
/*! app/models/entity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity
*/
define("app/models/entity",["require","app"],function(require,app) {
	var EntityModel = app.Model.extend({
		url: function() {
			base = "/api/entities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(EntityModel)
});
/*! app/models/entity_activity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_activity
*/
define("app/models/entity_activity",["require","app"],function(require,app) {
	var Entity_activityModel = app.Model.extend({
		url: function() {
			base = "/api/entity_activities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_activityModel)
});
/*! app/models/entity_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_credit
*/
define("app/models/entity_credit",["require","app"],function(require,app) {
	var Entity_creditModel = app.Model.extend({
		url: function() {
			base = "/api/entity_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_creditModel)
});
/*! app/models/entity_entityrole 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_entityrole
*/
define("app/models/entity_entityrole",["require","app"],function(require,app) {
	var Entity_entityroleModel = app.Model.extend({
		url: function() {
			base = "/api/entity_entityroles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_entityroleModel)
});
/*! app/models/entity_entitytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_entitytype
*/
define("app/models/entity_entitytype",["require","app"],function(require,app) {
	var Entity_entitytypeModel = app.Model.extend({
		url: function() {
			base = "/api/entity_entitytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_entitytypeModel)
});
/*! app/models/entity_person 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_person
*/
define("app/models/entity_person",["require","app"],function(require,app) {
	var Entity_personModel = app.Model.extend({
		url: function() {
			base = "/api/entity_persons/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_personModel)
});
/*! app/models/entity_relate 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entity_relate
*/
define("app/models/entity_relate",["require","app"],function(require,app) {
	var Entity_relateModel = app.Model.extend({
		url: function() {
			base = "/api/entity_relates/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Entity_relateModel)
});
/*! app/models/entityrole 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entityrole
*/
define("app/models/entityrole",["require","app"],function(require,app) {
	var EntityroleModel = app.Model.extend({
		url: function() {
			base = "/api/entityroles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(EntityroleModel)
});
/*! app/models/entitytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Entitytype
*/
define("app/models/entitytype",["require","app"],function(require,app) {
	var EntitytypeModel = app.Model.extend({
		url: function() {
			base = "/api/entitytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(EntitytypeModel)
});
/*! app/models/file 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.File
*/
define("app/models/file",["require","app"],function(require,app) {
	var FileModel = app.Model.extend({
		url: function() {
			base = "/api/files/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(FileModel)
});
/*! app/models/filegroup 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Filegroup
*/
define("app/models/filegroup",["require","app"],function(require,app) {
	var FilegroupModel = app.Model.extend({
		url: function() {
			base = "/api/filegroups/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(FilegroupModel)
});
/*! app/models/geoname 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Geoname
*/
define("app/models/geoname",["require","app"],function(require,app) {
	var GeonameModel = app.Model.extend({
		url: function() {
			base = "/api/geonames/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(GeonameModel)
});
/*! app/models/group 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Group
*/
define("app/models/group",["require","app"],function(require,app) {
	var GroupModel = app.Model.extend({
		url: function() {
			base = "/api/groups/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(GroupModel)
});
/*! app/models/grouptype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Grouptype
*/
define("app/models/grouptype",["require","app"],function(require,app) {
	var GrouptypeModel = app.Model.extend({
		url: function() {
			base = "/api/grouptypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(GrouptypeModel)
});
/*! app/models/history 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.History
*/
define("app/models/history",["require","app"],function(require,app) {
	var HistoryModel = app.Model.extend({
		url: function() {
			base = "/api/histories/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(HistoryModel)
});
/*! app/models/hub 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Hub
*/
define("app/models/hub",["require","app"],function(require,app) {
	var HubModel = app.Model.extend({
		url: function() {
			base = "/api/hubs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(HubModel)
});
/*! app/models/image 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Image
*/
define("app/models/image",["require","app"],function(require,app) {
	var ImageModel = app.Model.extend({
		url: function() {
			base = "/api/images/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ImageModel)
});
/*! app/models/imagetype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Imagetype
*/
define("app/models/imagetype",["require","app"],function(require,app) {
	var ImagetypeModel = app.Model.extend({
		url: function() {
			base = "/api/imagetypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ImagetypeModel)
});
/*! app/models/location 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Location
*/
define("app/models/location",["require","app"],function(require,app) {
	var LocationModel = app.Model.extend({
		url: function() {
			base = "/api/locations/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(LocationModel)
});
/*! app/models/locationtype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Locationtype
*/
define("app/models/locationtype",["require","app"],function(require,app) {
	var LocationtypeModel = app.Model.extend({
		url: function() {
			base = "/api/locationtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(LocationtypeModel)
});
/*! app/models/model 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Model
*/
define("app/models/model",["require","app"],function(require,app) {
	var ModelModel = app.Model.extend({
		url: function() {
			base = "/api/models/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ModelModel)
});
/*! app/models/object 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Object
*/
define("app/models/object",["require","app"],function(require,app) {
	var ObjectModel = app.Model.extend({
		url: function() {
			base = "/api/objects/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectModel)
});
/*! app/models/objectdatum 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objectdatum
*/
define("app/models/objectdatum",["require","app"],function(require,app) {
	var ObjectdatumModel = app.Model.extend({
		url: function() {
			base = "/api/objectdatas/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectdatumModel)
});
/*! app/models/objectfield 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objectfield
*/
define("app/models/objectfield",["require","app"],function(require,app) {
	var ObjectfieldModel = app.Model.extend({
		url: function() {
			base = "/api/objectfields/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectfieldModel)
});
/*! app/models/objectfieldtype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objectfieldtype
*/
define("app/models/objectfieldtype",["require","app"],function(require,app) {
	var ObjectfieldtypeModel = app.Model.extend({
		url: function() {
			base = "/api/objectfieldtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectfieldtypeModel)
});
/*! app/models/objectform 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objectform
*/
define("app/models/objectform",["require","app"],function(require,app) {
	var ObjectformModel = app.Model.extend({
		url: function() {
			base = "/api/objectforms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjectformModel)
});
/*! app/models/objecttype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Objecttype
*/
define("app/models/objecttype",["require","app"],function(require,app) {
	var ObjecttypeModel = app.Model.extend({
		url: function() {
			base = "/api/objecttypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ObjecttypeModel)
});
/*! app/models/occupation 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Occupation
*/
define("app/models/occupation",["require","app"],function(require,app) {
	var OccupationModel = app.Model.extend({
		url: function() {
			base = "/api/occupations/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(OccupationModel)
});
/*! app/models/page 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Page
*/
define("app/models/page",["require","app"],function(require,app) {
	var PageModel = app.Model.extend({
		url: function() {
			base = "/api/pages/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PageModel)
});
/*! app/models/page_element 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Page_element
*/
define("app/models/page_element",["require","app"],function(require,app) {
	var Page_elementModel = app.Model.extend({
		url: function() {
			base = "/api/page_elements/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Page_elementModel)
});
/*! app/models/page_section 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Page_section
*/
define("app/models/page_section",["require","app"],function(require,app) {
	var Page_sectionModel = app.Model.extend({
		url: function() {
			base = "/api/page_sections/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Page_sectionModel)
});
/*! app/models/pagelayout 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Pagelayout
*/
define("app/models/pagelayout",["require","app"],function(require,app) {
	var PagelayoutModel = app.Model.extend({
		url: function() {
			base = "/api/pagelayouts/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PagelayoutModel)
});
/*! app/models/pagelayoutmenu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu
*/
define("app/models/pagelayoutmenu",["require","app"],function(require,app) {
	var PagelayoutmenuModel = app.Model.extend({
		url: function() {
			base = "/api/pagelayoutmenus/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PagelayoutmenuModel)
});
/*! app/models/pagelayoutmenu_page 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu_page
*/
define("app/models/pagelayoutmenu_page",["require","app"],function(require,app) {
	var Pagelayoutmenu_pageModel = app.Model.extend({
		url: function() {
			base = "/api/pagelayoutmenu_pages/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Pagelayoutmenu_pageModel)
});
/*! app/models/person 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person
*/
define("app/models/person",["require","app"],function(require,app) {
	var PersonModel = app.Model.extend({
		url: function() {
			base = "/api/people/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PersonModel)
});
/*! app/models/person_address 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_address
*/
define("app/models/person_address",["require","app"],function(require,app) {
	var Person_addressModel = app.Model.extend({
		url: function() {
			base = "/api/person_addresses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_addressModel)
});
/*! app/models/person_client 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_client
*/
define("app/models/person_client",["require","app"],function(require,app) {
	var Person_clientModel = app.Model.extend({
		url: function() {
			base = "/api/person_clients/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_clientModel)
});
/*! app/models/person_degree 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_degree
*/
define("app/models/person_degree",["require","app"],function(require,app) {
	var Person_degreeModel = app.Model.extend({
		url: function() {
			base = "/api/person_degrees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_degreeModel)
});
/*! app/models/person_email 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_email
*/
define("app/models/person_email",["require","app"],function(require,app) {
	var Person_emailModel = app.Model.extend({
		url: function() {
			base = "/api/person_emails/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_emailModel)
});
/*! app/models/person_file 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_file
*/
define("app/models/person_file",["require","app"],function(require,app) {
	var Person_fileModel = app.Model.extend({
		url: function() {
			base = "/api/person_files/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_fileModel)
});
/*! app/models/person_interest_except 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_interest_except
*/
define("app/models/person_interest_except",["require","app"],function(require,app) {
	var Person_interest_exceptModel = app.Model.extend({
		url: function() {
			base = "/api/person_interest_excepts/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_interest_exceptModel)
});
/*! app/models/person_note 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_note
*/
define("app/models/person_note",["require","app"],function(require,app) {
	var Person_noteModel = app.Model.extend({
		url: function() {
			base = "/api/person_notes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_noteModel)
});
/*! app/models/person_pref 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_pref
*/
define("app/models/person_pref",["require","app"],function(require,app) {
	var Person_prefModel = app.Model.extend({
		url: function() {
			base = "/api/person_prefs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_prefModel)
});
/*! app/models/person_specialtylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_specialtylm
*/
define("app/models/person_specialtylm",["require","app"],function(require,app) {
	var Person_specialtylmModel = app.Model.extend({
		url: function() {
			base = "/api/person_specialtylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_specialtylmModel)
});
/*! app/models/person_user 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Person_user
*/
define("app/models/person_user",["require","app"],function(require,app) {
	var Person_userModel = app.Model.extend({
		url: function() {
			base = "/api/person_users/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Person_userModel)
});
/*! app/models/process 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Process
*/
define("app/models/process",["require","app"],function(require,app) {
	var ProcessModel = app.Model.extend({
		url: function() {
			base = "/api/processes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProcessModel)
});
/*! app/models/process_person 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Process_person
*/
define("app/models/process_person",["require","app"],function(require,app) {
	var Process_personModel = app.Model.extend({
		url: function() {
			base = "/api/process_persons/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Process_personModel)
});
/*! app/models/processmanager 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Processmanager
*/
define("app/models/processmanager",["require","app"],function(require,app) {
	var ProcessmanagerModel = app.Model.extend({
		url: function() {
			base = "/api/processmanagers/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProcessmanagerModel)
});
/*! app/models/processstep 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Processstep
*/
define("app/models/processstep",["require","app"],function(require,app) {
	var ProcessstepModel = app.Model.extend({
		url: function() {
			base = "/api/processsteps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProcessstepModel)
});
/*! app/models/processstep_activity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Processstep_activity
*/
define("app/models/processstep_activity",["require","app"],function(require,app) {
	var Processstep_activityModel = app.Model.extend({
		url: function() {
			base = "/api/processstep_activities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Processstep_activityModel)
});
/*! app/models/professionarea 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Professionarea
*/
define("app/models/professionarea",["require","app"],function(require,app) {
	var ProfessionareaModel = app.Model.extend({
		url: function() {
			base = "/api/professionareas/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProfessionareaModel)
});
/*! app/models/project 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Project
*/
define("app/models/project",["require","app"],function(require,app) {
	var ProjectModel = app.Model.extend({
		url: function() {
			base = "/api/projects/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(ProjectModel)
});
/*! app/models/relicensure 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Relicensure
*/
define("app/models/relicensure",["require","app"],function(require,app) {
	var RelicensureModel = app.Model.extend({
		url: function() {
			base = "/api/relicensures/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(RelicensureModel)
});
/*! app/models/stat_entry 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Stat_entry
*/
define("app/models/stat_entry",["require","app"],function(require,app) {
	var Stat_entryModel = app.Model.extend({
		url: function() {
			base = "/api/stat_entries/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Stat_entryModel)
});
/*! app/models/stat_log 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Stat_log
*/
define("app/models/stat_log",["require","app"],function(require,app) {
	var Stat_logModel = app.Model.extend({
		url: function() {
			base = "/api/stat_logs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Stat_logModel)
});
/*! app/models/subscription 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Subscription
*/
define("app/models/subscription",["require","app"],function(require,app) {
	var SubscriptionModel = app.Model.extend({
		url: function() {
			base = "/api/subscriptions/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(SubscriptionModel)
});
/*! app/models/sys_activityrole 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_activityrole
*/
define("app/models/sys_activityrole",["require","app"],function(require,app) {
	var Sys_activityroleModel = app.Model.extend({
		url: function() {
			base = "/api/sys_activityroles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_activityroleModel)
});
/*! app/models/sys_activitysteptype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitysteptype
*/
define("app/models/sys_activitysteptype",["require","app"],function(require,app) {
	var Sys_activitysteptypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_activitysteptypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_activitysteptypeModel)
});
/*! app/models/sys_activitytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitytype
*/
define("app/models/sys_activitytype",["require","app"],function(require,app) {
	var Sys_activitytypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_activitytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_activitytypeModel)
});
/*! app/models/sys_addresstype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_addresstype
*/
define("app/models/sys_addresstype",["require","app"],function(require,app) {
	var Sys_addresstypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_addresstypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_addresstypeModel)
});
/*! app/models/sys_apiclient 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_apiclient
*/
define("app/models/sys_apiclient",["require","app"],function(require,app) {
	var Sys_apiclientModel = app.Model.extend({
		url: function() {
			base = "/api/sys_apiclients/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_apiclientModel)
});
/*! app/models/sys_assessquestiontype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_assessquestiontype
*/
define("app/models/sys_assessquestiontype",["require","app"],function(require,app) {
	var Sys_assessquestiontypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_assessquestiontypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_assessquestiontypeModel)
});
/*! app/models/sys_assessresultstatu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_assessresultstatu
*/
define("app/models/sys_assessresultstatu",["require","app"],function(require,app) {
	var Sys_assessresultstatuModel = app.Model.extend({
		url: function() {
			base = "/api/sys_assessresultstatuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_assessresultstatuModel)
});
/*! app/models/sys_assesstype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_assesstype
*/
define("app/models/sys_assesstype",["require","app"],function(require,app) {
	var Sys_assesstypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_assesstypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_assesstypeModel)
});
/*! app/models/sys_attendeestatu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_attendeestatu
*/
define("app/models/sys_attendeestatu",["require","app"],function(require,app) {
	var Sys_attendeestatuModel = app.Model.extend({
		url: function() {
			base = "/api/sys_attendeestatuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_attendeestatuModel)
});
/*! app/models/sys_categorylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_categorylm
*/
define("app/models/sys_categorylm",["require","app"],function(require,app) {
	var Sys_categorylmModel = app.Model.extend({
		url: function() {
			base = "/api/sys_categorylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_categorylmModel)
});
/*! app/models/sys_cbafund 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbafund
*/
define("app/models/sys_cbafund",["require","app"],function(require,app) {
	var Sys_cbafundModel = app.Model.extend({
		url: function() {
			base = "/api/sys_cbafunds/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_cbafundModel)
});
/*! app/models/sys_cbofund 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbofund
*/
define("app/models/sys_cbofund",["require","app"],function(require,app) {
	var Sys_cbofundModel = app.Model.extend({
		url: function() {
			base = "/api/sys_cbofunds/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_cbofundModel)
});
/*! app/models/sys_component 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_component
*/
define("app/models/sys_component",["require","app"],function(require,app) {
	var Sys_componentModel = app.Model.extend({
		url: function() {
			base = "/api/sys_components/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_componentModel)
});
/*! app/models/sys_country 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_country
*/
define("app/models/sys_country",["require","app"],function(require,app) {
	var Sys_countryModel = app.Model.extend({
		url: function() {
			base = "/api/sys_countries/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_countryModel)
});
/*! app/models/sys_credit 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_credit
*/
define("app/models/sys_credit",["require","app"],function(require,app) {
	var Sys_creditModel = app.Model.extend({
		url: function() {
			base = "/api/sys_credits/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_creditModel)
});
/*! app/models/sys_degree 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_degree
*/
define("app/models/sys_degree",["require","app"],function(require,app) {
	var Sys_degreeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_degrees/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_degreeModel)
});
/*! app/models/sys_emailstyle 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_emailstyle
*/
define("app/models/sys_emailstyle",["require","app"],function(require,app) {
	var Sys_emailstyleModel = app.Model.extend({
		url: function() {
			base = "/api/sys_emailstyles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_emailstyleModel)
});
/*! app/models/sys_entrytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_entrytype
*/
define("app/models/sys_entrytype",["require","app"],function(require,app) {
	var Sys_entrytypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_entrytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_entrytypeModel)
});
/*! app/models/sys_ethnicity 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_ethnicity
*/
define("app/models/sys_ethnicity",["require","app"],function(require,app) {
	var Sys_ethnicityModel = app.Model.extend({
		url: function() {
			base = "/api/sys_ethnicities/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_ethnicityModel)
});
/*! app/models/sys_filetype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_filetype
*/
define("app/models/sys_filetype",["require","app"],function(require,app) {
	var Sys_filetypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_filetypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_filetypeModel)
});
/*! app/models/sys_funrc 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrc
*/
define("app/models/sys_funrc",["require","app"],function(require,app) {
	var Sys_funrcModel = app.Model.extend({
		url: function() {
			base = "/api/sys_funrcs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_funrcModel)
});
/*! app/models/sys_funrn 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrn
*/
define("app/models/sys_funrn",["require","app"],function(require,app) {
	var Sys_funrnModel = app.Model.extend({
		url: function() {
			base = "/api/sys_funrns/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_funrnModel)
});
/*! app/models/sys_grouping 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouping
*/
define("app/models/sys_grouping",["require","app"],function(require,app) {
	var Sys_groupingModel = app.Model.extend({
		url: function() {
			base = "/api/sys_groupings/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_groupingModel)
});
/*! app/models/sys_grouptype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouptype
*/
define("app/models/sys_grouptype",["require","app"],function(require,app) {
	var Sys_grouptypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_grouptypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_grouptypeModel)
});
/*! app/models/sys_historystyle 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_historystyle
*/
define("app/models/sys_historystyle",["require","app"],function(require,app) {
	var Sys_historystyleModel = app.Model.extend({
		url: function() {
			base = "/api/sys_historystyles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_historystyleModel)
});
/*! app/models/sys_historytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_historytype
*/
define("app/models/sys_historytype",["require","app"],function(require,app) {
	var Sys_historytypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_historytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_historytypeModel)
});
/*! app/models/sys_market 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_market
*/
define("app/models/sys_market",["require","app"],function(require,app) {
	var Sys_marketModel = app.Model.extend({
		url: function() {
			base = "/api/sys_markets/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_marketModel)
});
/*! app/models/sys_occclass 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_occclass
*/
define("app/models/sys_occclass",["require","app"],function(require,app) {
	var Sys_occclassModel = app.Model.extend({
		url: function() {
			base = "/api/sys_occclasses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_occclassModel)
});
/*! app/models/sys_orgtype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_orgtype
*/
define("app/models/sys_orgtype",["require","app"],function(require,app) {
	var Sys_orgtypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_orgtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_orgtypeModel)
});
/*! app/models/sys_personstatu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_personstatu
*/
define("app/models/sys_personstatu",["require","app"],function(require,app) {
	var Sys_personstatuModel = app.Model.extend({
		url: function() {
			base = "/api/sys_personstatuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_personstatuModel)
});
/*! app/models/sys_prinemp 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_prinemp
*/
define("app/models/sys_prinemp",["require","app"],function(require,app) {
	var Sys_prinempModel = app.Model.extend({
		url: function() {
			base = "/api/sys_prinemps/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_prinempModel)
});
/*! app/models/sys_profc 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_profc
*/
define("app/models/sys_profc",["require","app"],function(require,app) {
	var Sys_profcModel = app.Model.extend({
		url: function() {
			base = "/api/sys_profcs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_profcModel)
});
/*! app/models/sys_profn 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_profn
*/
define("app/models/sys_profn",["require","app"],function(require,app) {
	var Sys_profnModel = app.Model.extend({
		url: function() {
			base = "/api/sys_profns/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_profnModel)
});
/*! app/models/sys_projecttype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_projecttype
*/
define("app/models/sys_projecttype",["require","app"],function(require,app) {
	var Sys_projecttypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_projecttypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_projecttypeModel)
});
/*! app/models/sys_report 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_report
*/
define("app/models/sys_report",["require","app"],function(require,app) {
	var Sys_reportModel = app.Model.extend({
		url: function() {
			base = "/api/sys_reports/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_reportModel)
});
/*! app/models/sys_role 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_role
*/
define("app/models/sys_role",["require","app"],function(require,app) {
	var Sys_roleModel = app.Model.extend({
		url: function() {
			base = "/api/sys_roles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_roleModel)
});
/*! app/models/sys_sitelm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_sitelm
*/
define("app/models/sys_sitelm",["require","app"],function(require,app) {
	var Sys_sitelmModel = app.Model.extend({
		url: function() {
			base = "/api/sys_sitelms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_sitelmModel)
});
/*! app/models/sys_specialtylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_specialtylm
*/
define("app/models/sys_specialtylm",["require","app"],function(require,app) {
	var Sys_specialtylmModel = app.Model.extend({
		url: function() {
			base = "/api/sys_specialtylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_specialtylmModel)
});
/*! app/models/sys_stat_log_type 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_stat_log_type
*/
define("app/models/sys_stat_log_type",["require","app"],function(require,app) {
	var Sys_stat_log_typeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_stat_log_types/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_stat_log_typeModel)
});
/*! app/models/sys_stat_type 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_stat_type
*/
define("app/models/sys_stat_type",["require","app"],function(require,app) {
	var Sys_stat_typeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_stat_types/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_stat_typeModel)
});
/*! app/models/sys_state 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_state
*/
define("app/models/sys_state",["require","app"],function(require,app) {
	var Sys_stateModel = app.Model.extend({
		url: function() {
			base = "/api/sys_states/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_stateModel)
});
/*! app/models/sys_statu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_statu
*/
define("app/models/sys_statu",["require","app"],function(require,app) {
	var Sys_statuModel = app.Model.extend({
		url: function() {
			base = "/api/sys_statuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_statuModel)
});
/*! app/models/sys_stepstatu 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_stepstatu
*/
define("app/models/sys_stepstatu",["require","app"],function(require,app) {
	var Sys_stepstatuModel = app.Model.extend({
		url: function() {
			base = "/api/sys_stepstatuses/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_stepstatuModel)
});
/*! app/models/sys_subscriptiontype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_subscriptiontype
*/
define("app/models/sys_subscriptiontype",["require","app"],function(require,app) {
	var Sys_subscriptiontypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_subscriptiontypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_subscriptiontypeModel)
});
/*! app/models/sys_supporter 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporter
*/
define("app/models/sys_supporter",["require","app"],function(require,app) {
	var Sys_supporterModel = app.Model.extend({
		url: function() {
			base = "/api/sys_supporters/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_supporterModel)
});
/*! app/models/sys_supporttype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporttype
*/
define("app/models/sys_supporttype",["require","app"],function(require,app) {
	var Sys_supporttypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_supporttypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_supporttypeModel)
});
/*! app/models/sys_testtype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_testtype
*/
define("app/models/sys_testtype",["require","app"],function(require,app) {
	var Sys_testtypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_testtypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_testtypeModel)
});
/*! app/models/twilio_log 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Twilio_log
*/
define("app/models/twilio_log",["require","app"],function(require,app) {
	var Twilio_logModel = app.Model.extend({
		url: function() {
			base = "/api/twilio_logs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Twilio_logModel)
});
/*! app/models/wheel 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Wheel
*/
define("app/models/wheel",["require","app"],function(require,app) {
	var WheelModel = app.Model.extend({
		url: function() {
			base = "/api/wheels/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(WheelModel)
});














































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































