/*! app/models/account 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Account
*/
define("app/models/account",["require"],function(require) {
	var AppModel = require("app/model");
	var AccountModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Action
*/
define("app/models/action",["require"],function(require) {
	var AppModel = require("app/model");
	var ActionModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity
*/
define("app/models/activity",["require"],function(require) {
	var AppModel = require("app/model");
	var ActivityModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_accme
*/
define("app/models/activity_accme",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_accmeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_application
*/
define("app/models/activity_application",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_applicationModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_categorylm
*/
define("app/models/activity_categorylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_categorylmModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_cdc
*/
define("app/models/activity_cdc",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_cdcModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_comment
*/
define("app/models/activity_comment",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_commentModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_committee
*/
define("app/models/activity_committee",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_committeeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_container
*/
define("app/models/activity_container",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_containerModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_credit
*/
define("app/models/activity_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_creditModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_faculty
*/
define("app/models/activity_faculty",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_facultyModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finbudget
*/
define("app/models/activity_finbudget",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_finbudgetModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finfee
*/
define("app/models/activity_finfee",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_finfeeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finledger
*/
define("app/models/activity_finledger",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_finledgerModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_finsupport
*/
define("app/models/activity_finsupport",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_finsupportModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_note
*/
define("app/models/activity_note",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_noteModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_other
*/
define("app/models/activity_other",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_otherModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_participant
*/
define("app/models/activity_participant",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_participantModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_profile
*/
define("app/models/activity_profile",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_profileModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubcomponent
*/
define("app/models/activity_pubcomponent",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_pubcomponentModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_publish
*/
define("app/models/activity_publish",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_publishModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_pubstep
*/
define("app/models/activity_pubstep",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_pubstepModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_site
*/
define("app/models/activity_site",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_siteModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_specialtylm
*/
define("app/models/activity_specialtylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_specialtylmModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_step
*/
define("app/models/activity_step",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_stepModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag_relate
*/
define("app/models/activity_tag_relate",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_tag_relateModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_tag
*/
define("app/models/activity_tag",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_tagModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_user
*/
define("app/models/activity_user",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_userModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Activity_vote
*/
define("app/models/activity_vote",["require"],function(require) {
	var AppModel = require("app/model");
	var Activity_voteModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Agenda
*/
define("app/models/agenda",["require"],function(require) {
	var AppModel = require("app/model");
	var AgendaModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessanswer
*/
define("app/models/assessanswer",["require"],function(require) {
	var AppModel = require("app/model");
	var AssessanswerModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessment
*/
define("app/models/assessment",["require"],function(require) {
	var AppModel = require("app/model");
	var AssessmentModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessquestion
*/
define("app/models/assessquestion",["require"],function(require) {
	var AppModel = require("app/model");
	var AssessquestionModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assessresult
*/
define("app/models/assessresult",["require"],function(require) {
	var AppModel = require("app/model");
	var AssessresultModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assesssection
*/
define("app/models/assesssection",["require"],function(require) {
	var AppModel = require("app/model");
	var AssesssectionModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Assesstmpl
*/
define("app/models/assesstmpl",["require"],function(require) {
	var AppModel = require("app/model");
	var AssesstmplModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee
*/
define("app/models/attendee",["require"],function(require) {
	var AppModel = require("app/model");
	var AttendeeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_address
*/
define("app/models/attendee_address",["require"],function(require) {
	var AppModel = require("app/model");
	var Attendee_addressModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_component
*/
define("app/models/attendee_component",["require"],function(require) {
	var AppModel = require("app/model");
	var Attendee_componentModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_phone
*/
define("app/models/attendee_phone",["require"],function(require) {
	var AppModel = require("app/model");
	var Attendee_phoneModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendee_step
*/
define("app/models/attendee_step",["require"],function(require) {
	var AppModel = require("app/model");
	var Attendee_stepModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendeecdc
*/
define("app/models/attendeecdc",["require"],function(require) {
	var AppModel = require("app/model");
	var AttendeecdcModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Attendeecredit
*/
define("app/models/attendeecredit",["require"],function(require) {
	var AppModel = require("app/model");
	var AttendeecreditModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Authority
*/
define("app/models/authority",["require"],function(require) {
	var AppModel = require("app/model");
	var AuthorityModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Authoritypage
*/
define("app/models/authoritypage",["require"],function(require) {
	var AppModel = require("app/model");
	var AuthoritypageModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Category
*/
define("app/models/category",["require"],function(require) {
	var AppModel = require("app/model");
	var CategoryModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Cert
*/
define("app/models/cert",["require"],function(require) {
	var AppModel = require("app/model");
	var CertModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Cert_credit
*/
define("app/models/cert_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Cert_creditModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Certificate
*/
define("app/models/certificate",["require"],function(require) {
	var AppModel = require("app/model");
	var CertificateModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Comment
*/
define("app/models/comment",["require"],function(require) {
	var AppModel = require("app/model");
	var CommentModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_cert
*/
define("app/models/credit_cert",["require"],function(require) {
	var AppModel = require("app/model");
	var Credit_certModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_request
*/
define("app/models/credit_request",["require"],function(require) {
	var AppModel = require("app/model");
	var Credit_requestModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_email
*/
define("app/models/credit_request_email",["require"],function(require) {
	var AppModel = require("app/model");
	var Credit_request_emailModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Credit_request_import
*/
define("app/models/credit_request_import",["require"],function(require) {
	var AppModel = require("app/model");
	var Credit_request_importModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Degree
*/
define("app/models/degree",["require"],function(require) {
	var AppModel = require("app/model");
	var DegreeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Degree_credit
*/
define("app/models/degree_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Degree_creditModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity
*/
define("app/models/entity",["require"],function(require) {
	var AppModel = require("app/model");
	var EntityModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_activity
*/
define("app/models/entity_activity",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_activityModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_credit
*/
define("app/models/entity_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_creditModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_entityrole
*/
define("app/models/entity_entityrole",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_entityroleModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_entitytype
*/
define("app/models/entity_entitytype",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_entitytypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_person
*/
define("app/models/entity_person",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_personModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_relate
*/
define("app/models/entity_relate",["require"],function(require) {
	var AppModel = require("app/model");
	var Entity_relateModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entityrole
*/
define("app/models/entityrole",["require"],function(require) {
	var AppModel = require("app/model");
	var EntityroleModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Entitytype
*/
define("app/models/entitytype",["require"],function(require) {
	var AppModel = require("app/model");
	var EntitytypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.File
*/
define("app/models/file",["require"],function(require) {
	var AppModel = require("app/model");
	var FileModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Filegroup
*/
define("app/models/filegroup",["require"],function(require) {
	var AppModel = require("app/model");
	var FilegroupModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Geoname
*/
define("app/models/geoname",["require"],function(require) {
	var AppModel = require("app/model");
	var GeonameModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Group
*/
define("app/models/group",["require"],function(require) {
	var AppModel = require("app/model");
	var GroupModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Grouptype
*/
define("app/models/grouptype",["require"],function(require) {
	var AppModel = require("app/model");
	var GrouptypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.History
*/
define("app/models/history",["require"],function(require) {
	var AppModel = require("app/model");
	var HistoryModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Hub
*/
define("app/models/hub",["require"],function(require) {
	var AppModel = require("app/model");
	var HubModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Image
*/
define("app/models/image",["require"],function(require) {
	var AppModel = require("app/model");
	var ImageModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Imagetype
*/
define("app/models/imagetype",["require"],function(require) {
	var AppModel = require("app/model");
	var ImagetypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Location
*/
define("app/models/location",["require"],function(require) {
	var AppModel = require("app/model");
	var LocationModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Locationtype
*/
define("app/models/locationtype",["require"],function(require) {
	var AppModel = require("app/model");
	var LocationtypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Model
*/
define("app/models/model",["require"],function(require) {
	var AppModel = require("app/model");
	var ModelModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Object
*/
define("app/models/object",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectdatum
*/
define("app/models/objectdatum",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectdatumModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectfield
*/
define("app/models/objectfield",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectfieldModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectfieldtype
*/
define("app/models/objectfieldtype",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectfieldtypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objectform
*/
define("app/models/objectform",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjectformModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Objecttype
*/
define("app/models/objecttype",["require"],function(require) {
	var AppModel = require("app/model");
	var ObjecttypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Occupation
*/
define("app/models/occupation",["require"],function(require) {
	var AppModel = require("app/model");
	var OccupationModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Page
*/
define("app/models/page",["require"],function(require) {
	var AppModel = require("app/model");
	var PageModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Page_element
*/
define("app/models/page_element",["require"],function(require) {
	var AppModel = require("app/model");
	var Page_elementModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Page_section
*/
define("app/models/page_section",["require"],function(require) {
	var AppModel = require("app/model");
	var Page_sectionModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Pagelayout
*/
define("app/models/pagelayout",["require"],function(require) {
	var AppModel = require("app/model");
	var PagelayoutModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu
*/
define("app/models/pagelayoutmenu",["require"],function(require) {
	var AppModel = require("app/model");
	var PagelayoutmenuModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu_page
*/
define("app/models/pagelayoutmenu_page",["require"],function(require) {
	var AppModel = require("app/model");
	var Pagelayoutmenu_pageModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person
*/
define("app/models/person",["require"],function(require) {
	var AppModel = require("app/model");
	var PersonModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_address
*/
define("app/models/person_address",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_addressModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_client
*/
define("app/models/person_client",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_clientModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_degree
*/
define("app/models/person_degree",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_degreeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_email
*/
define("app/models/person_email",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_emailModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_file
*/
define("app/models/person_file",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_fileModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_interest_except
*/
define("app/models/person_interest_except",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_interest_exceptModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_note
*/
define("app/models/person_note",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_noteModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_pref
*/
define("app/models/person_pref",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_prefModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_specialtylm
*/
define("app/models/person_specialtylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_specialtylmModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Person_user
*/
define("app/models/person_user",["require"],function(require) {
	var AppModel = require("app/model");
	var Person_userModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Process
*/
define("app/models/process",["require"],function(require) {
	var AppModel = require("app/model");
	var ProcessModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Process_person
*/
define("app/models/process_person",["require"],function(require) {
	var AppModel = require("app/model");
	var Process_personModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Processmanager
*/
define("app/models/processmanager",["require"],function(require) {
	var AppModel = require("app/model");
	var ProcessmanagerModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Processstep
*/
define("app/models/processstep",["require"],function(require) {
	var AppModel = require("app/model");
	var ProcessstepModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Processstep_activity
*/
define("app/models/processstep_activity",["require"],function(require) {
	var AppModel = require("app/model");
	var Processstep_activityModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Professionarea
*/
define("app/models/professionarea",["require"],function(require) {
	var AppModel = require("app/model");
	var ProfessionareaModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Project
*/
define("app/models/project",["require"],function(require) {
	var AppModel = require("app/model");
	var ProjectModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Relicensure
*/
define("app/models/relicensure",["require"],function(require) {
	var AppModel = require("app/model");
	var RelicensureModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Stat_entry
*/
define("app/models/stat_entry",["require"],function(require) {
	var AppModel = require("app/model");
	var Stat_entryModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Stat_log
*/
define("app/models/stat_log",["require"],function(require) {
	var AppModel = require("app/model");
	var Stat_logModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Subscription
*/
define("app/models/subscription",["require"],function(require) {
	var AppModel = require("app/model");
	var SubscriptionModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_activityrole
*/
define("app/models/sys_activityrole",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_activityroleModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitysteptype
*/
define("app/models/sys_activitysteptype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_activitysteptypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_activitytype
*/
define("app/models/sys_activitytype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_activitytypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_addresstype
*/
define("app/models/sys_addresstype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_addresstypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_apiclient
*/
define("app/models/sys_apiclient",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_apiclientModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_assessquestiontype
*/
define("app/models/sys_assessquestiontype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_assessquestiontypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_assessresultstatu
*/
define("app/models/sys_assessresultstatu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_assessresultstatuModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_assesstype
*/
define("app/models/sys_assesstype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_assesstypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_attendeestatu
*/
define("app/models/sys_attendeestatu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_attendeestatuModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_categorylm
*/
define("app/models/sys_categorylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_categorylmModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbafund
*/
define("app/models/sys_cbafund",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_cbafundModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_cbofund
*/
define("app/models/sys_cbofund",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_cbofundModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_component
*/
define("app/models/sys_component",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_componentModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_country
*/
define("app/models/sys_country",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_countryModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_credit
*/
define("app/models/sys_credit",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_creditModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_degree
*/
define("app/models/sys_degree",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_degreeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_emailstyle
*/
define("app/models/sys_emailstyle",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_emailstyleModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_entrytype
*/
define("app/models/sys_entrytype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_entrytypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_ethnicity
*/
define("app/models/sys_ethnicity",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_ethnicityModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_filetype
*/
define("app/models/sys_filetype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_filetypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrc
*/
define("app/models/sys_funrc",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_funrcModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_funrn
*/
define("app/models/sys_funrn",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_funrnModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouping
*/
define("app/models/sys_grouping",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_groupingModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouptype
*/
define("app/models/sys_grouptype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_grouptypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_historystyle
*/
define("app/models/sys_historystyle",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_historystyleModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_historytype
*/
define("app/models/sys_historytype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_historytypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_market
*/
define("app/models/sys_market",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_marketModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_occclass
*/
define("app/models/sys_occclass",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_occclassModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_orgtype
*/
define("app/models/sys_orgtype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_orgtypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_personstatu
*/
define("app/models/sys_personstatu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_personstatuModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_prinemp
*/
define("app/models/sys_prinemp",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_prinempModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_profc
*/
define("app/models/sys_profc",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_profcModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_profn
*/
define("app/models/sys_profn",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_profnModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_projecttype
*/
define("app/models/sys_projecttype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_projecttypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_report
*/
define("app/models/sys_report",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_reportModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_role
*/
define("app/models/sys_role",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_roleModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_sitelm
*/
define("app/models/sys_sitelm",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_sitelmModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_specialtylm
*/
define("app/models/sys_specialtylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_specialtylmModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_stat_log_type
*/
define("app/models/sys_stat_log_type",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_stat_log_typeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_stat_type
*/
define("app/models/sys_stat_type",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_stat_typeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_state
*/
define("app/models/sys_state",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_stateModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_statu
*/
define("app/models/sys_statu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_statuModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_stepstatu
*/
define("app/models/sys_stepstatu",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_stepstatuModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_subscriptiontype
*/
define("app/models/sys_subscriptiontype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_subscriptiontypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporter
*/
define("app/models/sys_supporter",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_supporterModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_supporttype
*/
define("app/models/sys_supporttype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_supporttypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_testtype
*/
define("app/models/sys_testtype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_testtypeModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Twilio_log
*/
define("app/models/twilio_log",["require"],function(require) {
	var AppModel = require("app/model");
	var Twilio_logModel = AppModel.extend({
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
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Wheel
*/
define("app/models/wheel",["require"],function(require) {
	var AppModel = require("app/model");
	var WheelModel = AppModel.extend({
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


























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































