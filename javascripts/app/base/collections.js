/*! app/collections/accounts
* 	@requires: app,app/models/account
* 	@extends: app.Collection
* 	@exports: app.collections.Accounts
*/
define("app/collections/accounts",["require","app","app/models"],function(require,app) {
	var AccountModel = require("app/models/account");

	var Accounts = app.Collection.extend({
		url: '/accounts/',
		model: AccountModel
	});

	module.setExports(Accounts);
});
/*! app/collections/accounts_paged
*   @requires: app,app/models/account
*   @extends: app.Collection_paged
*   @exports: app.collections.Accounts_paged
*/
define("app/collections/Accounts_paged",["require","app","app/models"],function(require,app) {
  var AccountModel = require("app/models/account");

  var Accounts_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/accounts/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AccountModel
      });

  module.setExports(Accounts_paged);
});
/*! app/collections/actions
* 	@requires: app,app/models/action
* 	@extends: app.Collection
* 	@exports: app.collections.Actions
*/
define("app/collections/actions",["require","app","app/models"],function(require,app) {
	var ActionModel = require("app/models/action");

	var Actions = app.Collection.extend({
		url: '/actions/',
		model: ActionModel
	});

	module.setExports(Actions);
});
/*! app/collections/actions_paged
*   @requires: app,app/models/action
*   @extends: app.Collection_paged
*   @exports: app.collections.Actions_paged
*/
define("app/collections/Actions_paged",["require","app","app/models"],function(require,app) {
  var ActionModel = require("app/models/action");

  var Actions_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/actions/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ActionModel
      });

  module.setExports(Actions_paged);
});
/*! app/collections/activities
* 	@requires: app,app/models/activity
* 	@extends: app.Collection
* 	@exports: app.collections.Activities
*/
define("app/collections/activities",["require","app","app/models"],function(require,app) {
	var ActivityModel = require("app/models/activity");

	var Activities = app.Collection.extend({
		url: '/activities/',
		model: ActivityModel
	});

	module.setExports(Activities);
});
/*! app/collections/activities_paged
*   @requires: app,app/models/activity
*   @extends: app.Collection_paged
*   @exports: app.collections.Activities_paged
*/
define("app/collections/Activities_paged",["require","app","app/models"],function(require,app) {
  var ActivityModel = require("app/models/activity");

  var Activities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activities/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ActivityModel
      });

  module.setExports(Activities_paged);
});
/*! app/collections/activity_accmes
* 	@requires: app,app/models/activity_accme
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_accmes
*/
define("app/collections/activity_accmes",["require","app","app/models"],function(require,app) {
	var Activity_accmeModel = require("app/models/activity_accme");

	var Activity_accmes = app.Collection.extend({
		url: '/activity_accmes/',
		model: Activity_accmeModel
	});

	module.setExports(Activity_accmes);
});
/*! app/collections/activity_accmes_paged
*   @requires: app,app/models/activity_accme
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_accmes_paged
*/
define("app/collections/Activity_accmes_paged",["require","app","app/models"],function(require,app) {
  var Activity_accmeModel = require("app/models/activity_accme");

  var Activity_accmes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_accmes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_accmeModel
      });

  module.setExports(Activity_accmes_paged);
});
/*! app/collections/activity_applications
* 	@requires: app,app/models/activity_application
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_applications
*/
define("app/collections/activity_applications",["require","app","app/models"],function(require,app) {
	var Activity_applicationModel = require("app/models/activity_application");

	var Activity_applications = app.Collection.extend({
		url: '/activity_applications/',
		model: Activity_applicationModel
	});

	module.setExports(Activity_applications);
});
/*! app/collections/activity_applications_paged
*   @requires: app,app/models/activity_application
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_applications_paged
*/
define("app/collections/Activity_applications_paged",["require","app","app/models"],function(require,app) {
  var Activity_applicationModel = require("app/models/activity_application");

  var Activity_applications_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_applications/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_applicationModel
      });

  module.setExports(Activity_applications_paged);
});
/*! app/collections/activity_categorylms
* 	@requires: app,app/models/activity_categorylm
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_categorylms
*/
define("app/collections/activity_categorylms",["require","app","app/models"],function(require,app) {
	var Activity_categorylmModel = require("app/models/activity_categorylm");

	var Activity_categorylms = app.Collection.extend({
		url: '/activity_categorylms/',
		model: Activity_categorylmModel
	});

	module.setExports(Activity_categorylms);
});
/*! app/collections/activity_categorylms_paged
*   @requires: app,app/models/activity_categorylm
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_categorylms_paged
*/
define("app/collections/Activity_categorylms_paged",["require","app","app/models"],function(require,app) {
  var Activity_categorylmModel = require("app/models/activity_categorylm");

  var Activity_categorylms_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_categorylms/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_categorylmModel
      });

  module.setExports(Activity_categorylms_paged);
});
/*! app/collections/activity_cdcs
* 	@requires: app,app/models/activity_cdc
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_cdcs
*/
define("app/collections/activity_cdcs",["require","app","app/models"],function(require,app) {
	var Activity_cdcModel = require("app/models/activity_cdc");

	var Activity_cdcs = app.Collection.extend({
		url: '/activity_cdcs/',
		model: Activity_cdcModel
	});

	module.setExports(Activity_cdcs);
});
/*! app/collections/activity_cdcs_paged
*   @requires: app,app/models/activity_cdc
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_cdcs_paged
*/
define("app/collections/Activity_cdcs_paged",["require","app","app/models"],function(require,app) {
  var Activity_cdcModel = require("app/models/activity_cdc");

  var Activity_cdcs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_cdcs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_cdcModel
      });

  module.setExports(Activity_cdcs_paged);
});
/*! app/collections/activity_comments
* 	@requires: app,app/models/activity_comment
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_comments
*/
define("app/collections/activity_comments",["require","app","app/models"],function(require,app) {
	var Activity_commentModel = require("app/models/activity_comment");

	var Activity_comments = app.Collection.extend({
		url: '/activity_comments/',
		model: Activity_commentModel
	});

	module.setExports(Activity_comments);
});
/*! app/collections/activity_comments_paged
*   @requires: app,app/models/activity_comment
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_comments_paged
*/
define("app/collections/Activity_comments_paged",["require","app","app/models"],function(require,app) {
  var Activity_commentModel = require("app/models/activity_comment");

  var Activity_comments_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_comments/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_commentModel
      });

  module.setExports(Activity_comments_paged);
});
/*! app/collections/activity_committees
* 	@requires: app,app/models/activity_committee
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_committees
*/
define("app/collections/activity_committees",["require","app","app/models"],function(require,app) {
	var Activity_committeeModel = require("app/models/activity_committee");

	var Activity_committees = app.Collection.extend({
		url: '/activity_committees/',
		model: Activity_committeeModel
	});

	module.setExports(Activity_committees);
});
/*! app/collections/activity_committees_paged
*   @requires: app,app/models/activity_committee
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_committees_paged
*/
define("app/collections/Activity_committees_paged",["require","app","app/models"],function(require,app) {
  var Activity_committeeModel = require("app/models/activity_committee");

  var Activity_committees_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_committees/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_committeeModel
      });

  module.setExports(Activity_committees_paged);
});
/*! app/collections/activity_containers
* 	@requires: app,app/models/activity_container
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_containers
*/
define("app/collections/activity_containers",["require","app","app/models"],function(require,app) {
	var Activity_containerModel = require("app/models/activity_container");

	var Activity_containers = app.Collection.extend({
		url: '/activity_containers/',
		model: Activity_containerModel
	});

	module.setExports(Activity_containers);
});
/*! app/collections/activity_containers_paged
*   @requires: app,app/models/activity_container
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_containers_paged
*/
define("app/collections/Activity_containers_paged",["require","app","app/models"],function(require,app) {
  var Activity_containerModel = require("app/models/activity_container");

  var Activity_containers_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_containers/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_containerModel
      });

  module.setExports(Activity_containers_paged);
});
/*! app/collections/activity_credits
* 	@requires: app,app/models/activity_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_credits
*/
define("app/collections/activity_credits",["require","app","app/models"],function(require,app) {
	var Activity_creditModel = require("app/models/activity_credit");

	var Activity_credits = app.Collection.extend({
		url: '/activity_credits/',
		model: Activity_creditModel
	});

	module.setExports(Activity_credits);
});
/*! app/collections/activity_credits_paged
*   @requires: app,app/models/activity_credit
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_credits_paged
*/
define("app/collections/Activity_credits_paged",["require","app","app/models"],function(require,app) {
  var Activity_creditModel = require("app/models/activity_credit");

  var Activity_credits_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_credits/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_creditModel
      });

  module.setExports(Activity_credits_paged);
});
/*! app/collections/activity_faculties
* 	@requires: app,app/models/activity_faculty
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_faculties
*/
define("app/collections/activity_faculties",["require","app","app/models"],function(require,app) {
	var Activity_facultyModel = require("app/models/activity_faculty");

	var Activity_faculties = app.Collection.extend({
		url: '/activity_faculties/',
		model: Activity_facultyModel
	});

	module.setExports(Activity_faculties);
});
/*! app/collections/activity_faculties_paged
*   @requires: app,app/models/activity_faculty
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_faculties_paged
*/
define("app/collections/Activity_faculties_paged",["require","app","app/models"],function(require,app) {
  var Activity_facultyModel = require("app/models/activity_faculty");

  var Activity_faculties_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_faculties/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_facultyModel
      });

  module.setExports(Activity_faculties_paged);
});
/*! app/collections/activity_finbudgets
* 	@requires: app,app/models/activity_finbudget
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finbudgets
*/
define("app/collections/activity_finbudgets",["require","app","app/models"],function(require,app) {
	var Activity_finbudgetModel = require("app/models/activity_finbudget");

	var Activity_finbudgets = app.Collection.extend({
		url: '/activity_finbudgets/',
		model: Activity_finbudgetModel
	});

	module.setExports(Activity_finbudgets);
});
/*! app/collections/activity_finbudgets_paged
*   @requires: app,app/models/activity_finbudget
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_finbudgets_paged
*/
define("app/collections/Activity_finbudgets_paged",["require","app","app/models"],function(require,app) {
  var Activity_finbudgetModel = require("app/models/activity_finbudget");

  var Activity_finbudgets_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_finbudgets/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_finbudgetModel
      });

  module.setExports(Activity_finbudgets_paged);
});
/*! app/collections/activity_finfees
* 	@requires: app,app/models/activity_finfee
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finfees
*/
define("app/collections/activity_finfees",["require","app","app/models"],function(require,app) {
	var Activity_finfeeModel = require("app/models/activity_finfee");

	var Activity_finfees = app.Collection.extend({
		url: '/activity_finfees/',
		model: Activity_finfeeModel
	});

	module.setExports(Activity_finfees);
});
/*! app/collections/activity_finfees_paged
*   @requires: app,app/models/activity_finfee
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_finfees_paged
*/
define("app/collections/Activity_finfees_paged",["require","app","app/models"],function(require,app) {
  var Activity_finfeeModel = require("app/models/activity_finfee");

  var Activity_finfees_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_finfees/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_finfeeModel
      });

  module.setExports(Activity_finfees_paged);
});
/*! app/collections/activity_finledgers
* 	@requires: app,app/models/activity_finledger
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finledgers
*/
define("app/collections/activity_finledgers",["require","app","app/models"],function(require,app) {
	var Activity_finledgerModel = require("app/models/activity_finledger");

	var Activity_finledgers = app.Collection.extend({
		url: '/activity_finledgers/',
		model: Activity_finledgerModel
	});

	module.setExports(Activity_finledgers);
});
/*! app/collections/activity_finledgers_paged
*   @requires: app,app/models/activity_finledger
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_finledgers_paged
*/
define("app/collections/Activity_finledgers_paged",["require","app","app/models"],function(require,app) {
  var Activity_finledgerModel = require("app/models/activity_finledger");

  var Activity_finledgers_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_finledgers/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_finledgerModel
      });

  module.setExports(Activity_finledgers_paged);
});
/*! app/collections/activity_finsupports
* 	@requires: app,app/models/activity_finsupport
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_finsupports
*/
define("app/collections/activity_finsupports",["require","app","app/models"],function(require,app) {
	var Activity_finsupportModel = require("app/models/activity_finsupport");

	var Activity_finsupports = app.Collection.extend({
		url: '/activity_finsupports/',
		model: Activity_finsupportModel
	});

	module.setExports(Activity_finsupports);
});
/*! app/collections/activity_finsupports_paged
*   @requires: app,app/models/activity_finsupport
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_finsupports_paged
*/
define("app/collections/Activity_finsupports_paged",["require","app","app/models"],function(require,app) {
  var Activity_finsupportModel = require("app/models/activity_finsupport");

  var Activity_finsupports_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_finsupports/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_finsupportModel
      });

  module.setExports(Activity_finsupports_paged);
});
/*! app/collections/activity_notes
* 	@requires: app,app/models/activity_note
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_notes
*/
define("app/collections/activity_notes",["require","app","app/models"],function(require,app) {
	var Activity_noteModel = require("app/models/activity_note");

	var Activity_notes = app.Collection.extend({
		url: '/activity_notes/',
		model: Activity_noteModel
	});

	module.setExports(Activity_notes);
});
/*! app/collections/activity_notes_paged
*   @requires: app,app/models/activity_note
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_notes_paged
*/
define("app/collections/Activity_notes_paged",["require","app","app/models"],function(require,app) {
  var Activity_noteModel = require("app/models/activity_note");

  var Activity_notes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_notes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_noteModel
      });

  module.setExports(Activity_notes_paged);
});
/*! app/collections/activity_others
* 	@requires: app,app/models/activity_other
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_others
*/
define("app/collections/activity_others",["require","app","app/models"],function(require,app) {
	var Activity_otherModel = require("app/models/activity_other");

	var Activity_others = app.Collection.extend({
		url: '/activity_others/',
		model: Activity_otherModel
	});

	module.setExports(Activity_others);
});
/*! app/collections/activity_others_paged
*   @requires: app,app/models/activity_other
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_others_paged
*/
define("app/collections/Activity_others_paged",["require","app","app/models"],function(require,app) {
  var Activity_otherModel = require("app/models/activity_other");

  var Activity_others_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_others/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_otherModel
      });

  module.setExports(Activity_others_paged);
});
/*! app/collections/activity_participants
* 	@requires: app,app/models/activity_participant
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_participants
*/
define("app/collections/activity_participants",["require","app","app/models"],function(require,app) {
	var Activity_participantModel = require("app/models/activity_participant");

	var Activity_participants = app.Collection.extend({
		url: '/activity_participants/',
		model: Activity_participantModel
	});

	module.setExports(Activity_participants);
});
/*! app/collections/activity_participants_paged
*   @requires: app,app/models/activity_participant
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_participants_paged
*/
define("app/collections/Activity_participants_paged",["require","app","app/models"],function(require,app) {
  var Activity_participantModel = require("app/models/activity_participant");

  var Activity_participants_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_participants/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_participantModel
      });

  module.setExports(Activity_participants_paged);
});
/*! app/collections/activity_profiles
* 	@requires: app,app/models/activity_profile
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_profiles
*/
define("app/collections/activity_profiles",["require","app","app/models"],function(require,app) {
	var Activity_profileModel = require("app/models/activity_profile");

	var Activity_profiles = app.Collection.extend({
		url: '/activity_profiles/',
		model: Activity_profileModel
	});

	module.setExports(Activity_profiles);
});
/*! app/collections/activity_profiles_paged
*   @requires: app,app/models/activity_profile
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_profiles_paged
*/
define("app/collections/Activity_profiles_paged",["require","app","app/models"],function(require,app) {
  var Activity_profileModel = require("app/models/activity_profile");

  var Activity_profiles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_profiles/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_profileModel
      });

  module.setExports(Activity_profiles_paged);
});
/*! app/collections/activity_pubcomponents
* 	@requires: app,app/models/activity_pubcomponent
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_pubcomponents
*/
define("app/collections/activity_pubcomponents",["require","app","app/models"],function(require,app) {
	var Activity_pubcomponentModel = require("app/models/activity_pubcomponent");

	var Activity_pubcomponents = app.Collection.extend({
		url: '/activity_pubcomponents/',
		model: Activity_pubcomponentModel
	});

	module.setExports(Activity_pubcomponents);
});
/*! app/collections/activity_pubcomponents_paged
*   @requires: app,app/models/activity_pubcomponent
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_pubcomponents_paged
*/
define("app/collections/Activity_pubcomponents_paged",["require","app","app/models"],function(require,app) {
  var Activity_pubcomponentModel = require("app/models/activity_pubcomponent");

  var Activity_pubcomponents_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_pubcomponents/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_pubcomponentModel
      });

  module.setExports(Activity_pubcomponents_paged);
});
/*! app/collections/activity_publishes
* 	@requires: app,app/models/activity_publish
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_publishes
*/
define("app/collections/activity_publishes",["require","app","app/models"],function(require,app) {
	var Activity_publishModel = require("app/models/activity_publish");

	var Activity_publishes = app.Collection.extend({
		url: '/activity_publishes/',
		model: Activity_publishModel
	});

	module.setExports(Activity_publishes);
});
/*! app/collections/activity_publishes_paged
*   @requires: app,app/models/activity_publish
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_publishes_paged
*/
define("app/collections/Activity_publishes_paged",["require","app","app/models"],function(require,app) {
  var Activity_publishModel = require("app/models/activity_publish");

  var Activity_publishes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_publishes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_publishModel
      });

  module.setExports(Activity_publishes_paged);
});
/*! app/collections/activity_pubsteps
* 	@requires: app,app/models/activity_pubstep
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_pubsteps
*/
define("app/collections/activity_pubsteps",["require","app","app/models"],function(require,app) {
	var Activity_pubstepModel = require("app/models/activity_pubstep");

	var Activity_pubsteps = app.Collection.extend({
		url: '/activity_pubsteps/',
		model: Activity_pubstepModel
	});

	module.setExports(Activity_pubsteps);
});
/*! app/collections/activity_pubsteps_paged
*   @requires: app,app/models/activity_pubstep
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_pubsteps_paged
*/
define("app/collections/Activity_pubsteps_paged",["require","app","app/models"],function(require,app) {
  var Activity_pubstepModel = require("app/models/activity_pubstep");

  var Activity_pubsteps_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_pubsteps/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_pubstepModel
      });

  module.setExports(Activity_pubsteps_paged);
});
/*! app/collections/activity_sites
* 	@requires: app,app/models/activity_site
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_sites
*/
define("app/collections/activity_sites",["require","app","app/models"],function(require,app) {
	var Activity_siteModel = require("app/models/activity_site");

	var Activity_sites = app.Collection.extend({
		url: '/activity_sites/',
		model: Activity_siteModel
	});

	module.setExports(Activity_sites);
});
/*! app/collections/activity_sites_paged
*   @requires: app,app/models/activity_site
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_sites_paged
*/
define("app/collections/Activity_sites_paged",["require","app","app/models"],function(require,app) {
  var Activity_siteModel = require("app/models/activity_site");

  var Activity_sites_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_sites/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_siteModel
      });

  module.setExports(Activity_sites_paged);
});
/*! app/collections/activity_specialtylms
* 	@requires: app,app/models/activity_specialtylm
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_specialtylms
*/
define("app/collections/activity_specialtylms",["require","app","app/models"],function(require,app) {
	var Activity_specialtylmModel = require("app/models/activity_specialtylm");

	var Activity_specialtylms = app.Collection.extend({
		url: '/activity_specialtylms/',
		model: Activity_specialtylmModel
	});

	module.setExports(Activity_specialtylms);
});
/*! app/collections/activity_specialtylms_paged
*   @requires: app,app/models/activity_specialtylm
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_specialtylms_paged
*/
define("app/collections/Activity_specialtylms_paged",["require","app","app/models"],function(require,app) {
  var Activity_specialtylmModel = require("app/models/activity_specialtylm");

  var Activity_specialtylms_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_specialtylms/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_specialtylmModel
      });

  module.setExports(Activity_specialtylms_paged);
});
/*! app/collections/activity_steps
* 	@requires: app,app/models/activity_step
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_steps
*/
define("app/collections/activity_steps",["require","app","app/models"],function(require,app) {
	var Activity_stepModel = require("app/models/activity_step");

	var Activity_steps = app.Collection.extend({
		url: '/activity_steps/',
		model: Activity_stepModel
	});

	module.setExports(Activity_steps);
});
/*! app/collections/activity_steps_paged
*   @requires: app,app/models/activity_step
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_steps_paged
*/
define("app/collections/Activity_steps_paged",["require","app","app/models"],function(require,app) {
  var Activity_stepModel = require("app/models/activity_step");

  var Activity_steps_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_steps/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_stepModel
      });

  module.setExports(Activity_steps_paged);
});
/*! app/collections/activity_tag_relates
* 	@requires: app,app/models/activity_tag_relate
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_tag_relates
*/
define("app/collections/activity_tag_relates",["require","app","app/models"],function(require,app) {
	var Activity_tag_relateModel = require("app/models/activity_tag_relate");

	var Activity_tag_relates = app.Collection.extend({
		url: '/activity_tag_relates/',
		model: Activity_tag_relateModel
	});

	module.setExports(Activity_tag_relates);
});
/*! app/collections/activity_tag_relates_paged
*   @requires: app,app/models/activity_tag_relate
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_tag_relates_paged
*/
define("app/collections/Activity_tag_relates_paged",["require","app","app/models"],function(require,app) {
  var Activity_tag_relateModel = require("app/models/activity_tag_relate");

  var Activity_tag_relates_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_tag_relates/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_tag_relateModel
      });

  module.setExports(Activity_tag_relates_paged);
});
/*! app/collections/activity_tags
* 	@requires: app,app/models/activity_tag
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_tags
*/
define("app/collections/activity_tags",["require","app","app/models"],function(require,app) {
	var Activity_tagModel = require("app/models/activity_tag");

	var Activity_tags = app.Collection.extend({
		url: '/activity_tags/',
		model: Activity_tagModel
	});

	module.setExports(Activity_tags);
});
/*! app/collections/activity_tags_paged
*   @requires: app,app/models/activity_tag
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_tags_paged
*/
define("app/collections/Activity_tags_paged",["require","app","app/models"],function(require,app) {
  var Activity_tagModel = require("app/models/activity_tag");

  var Activity_tags_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_tags/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_tagModel
      });

  module.setExports(Activity_tags_paged);
});
/*! app/collections/activity_users
* 	@requires: app,app/models/activity_user
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_users
*/
define("app/collections/activity_users",["require","app","app/models"],function(require,app) {
	var Activity_userModel = require("app/models/activity_user");

	var Activity_users = app.Collection.extend({
		url: '/activity_users/',
		model: Activity_userModel
	});

	module.setExports(Activity_users);
});
/*! app/collections/activity_users_paged
*   @requires: app,app/models/activity_user
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_users_paged
*/
define("app/collections/Activity_users_paged",["require","app","app/models"],function(require,app) {
  var Activity_userModel = require("app/models/activity_user");

  var Activity_users_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_users/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_userModel
      });

  module.setExports(Activity_users_paged);
});
/*! app/collections/activity_votes
* 	@requires: app,app/models/activity_vote
* 	@extends: app.Collection
* 	@exports: app.collections.Activity_votes
*/
define("app/collections/activity_votes",["require","app","app/models"],function(require,app) {
	var Activity_voteModel = require("app/models/activity_vote");

	var Activity_votes = app.Collection.extend({
		url: '/activity_votes/',
		model: Activity_voteModel
	});

	module.setExports(Activity_votes);
});
/*! app/collections/activity_votes_paged
*   @requires: app,app/models/activity_vote
*   @extends: app.Collection_paged
*   @exports: app.collections.Activity_votes_paged
*/
define("app/collections/Activity_votes_paged",["require","app","app/models"],function(require,app) {
  var Activity_voteModel = require("app/models/activity_vote");

  var Activity_votes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/activity_votes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Activity_voteModel
      });

  module.setExports(Activity_votes_paged);
});
/*! app/collections/agendas
* 	@requires: app,app/models/agenda
* 	@extends: app.Collection
* 	@exports: app.collections.Agendas
*/
define("app/collections/agendas",["require","app","app/models"],function(require,app) {
	var AgendaModel = require("app/models/agenda");

	var Agendas = app.Collection.extend({
		url: '/agendas/',
		model: AgendaModel
	});

	module.setExports(Agendas);
});
/*! app/collections/agendas_paged
*   @requires: app,app/models/agenda
*   @extends: app.Collection_paged
*   @exports: app.collections.Agendas_paged
*/
define("app/collections/Agendas_paged",["require","app","app/models"],function(require,app) {
  var AgendaModel = require("app/models/agenda");

  var Agendas_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/agendas/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AgendaModel
      });

  module.setExports(Agendas_paged);
});
/*! app/collections/assessanswers
* 	@requires: app,app/models/assessanswer
* 	@extends: app.Collection
* 	@exports: app.collections.Assessanswers
*/
define("app/collections/assessanswers",["require","app","app/models"],function(require,app) {
	var AssessanswerModel = require("app/models/assessanswer");

	var Assessanswers = app.Collection.extend({
		url: '/assessanswers/',
		model: AssessanswerModel
	});

	module.setExports(Assessanswers);
});
/*! app/collections/assessanswers_paged
*   @requires: app,app/models/assessanswer
*   @extends: app.Collection_paged
*   @exports: app.collections.Assessanswers_paged
*/
define("app/collections/Assessanswers_paged",["require","app","app/models"],function(require,app) {
  var AssessanswerModel = require("app/models/assessanswer");

  var Assessanswers_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/assessanswers/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AssessanswerModel
      });

  module.setExports(Assessanswers_paged);
});
/*! app/collections/assessments
* 	@requires: app,app/models/assessment
* 	@extends: app.Collection
* 	@exports: app.collections.Assessments
*/
define("app/collections/assessments",["require","app","app/models"],function(require,app) {
	var AssessmentModel = require("app/models/assessment");

	var Assessments = app.Collection.extend({
		url: '/assessments/',
		model: AssessmentModel
	});

	module.setExports(Assessments);
});
/*! app/collections/assessments_paged
*   @requires: app,app/models/assessment
*   @extends: app.Collection_paged
*   @exports: app.collections.Assessments_paged
*/
define("app/collections/Assessments_paged",["require","app","app/models"],function(require,app) {
  var AssessmentModel = require("app/models/assessment");

  var Assessments_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/assessments/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AssessmentModel
      });

  module.setExports(Assessments_paged);
});
/*! app/collections/assessquestions
* 	@requires: app,app/models/assessquestion
* 	@extends: app.Collection
* 	@exports: app.collections.Assessquestions
*/
define("app/collections/assessquestions",["require","app","app/models"],function(require,app) {
	var AssessquestionModel = require("app/models/assessquestion");

	var Assessquestions = app.Collection.extend({
		url: '/assessquestions/',
		model: AssessquestionModel
	});

	module.setExports(Assessquestions);
});
/*! app/collections/assessquestions_paged
*   @requires: app,app/models/assessquestion
*   @extends: app.Collection_paged
*   @exports: app.collections.Assessquestions_paged
*/
define("app/collections/Assessquestions_paged",["require","app","app/models"],function(require,app) {
  var AssessquestionModel = require("app/models/assessquestion");

  var Assessquestions_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/assessquestions/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AssessquestionModel
      });

  module.setExports(Assessquestions_paged);
});
/*! app/collections/assessresults
* 	@requires: app,app/models/assessresult
* 	@extends: app.Collection
* 	@exports: app.collections.Assessresults
*/
define("app/collections/assessresults",["require","app","app/models"],function(require,app) {
	var AssessresultModel = require("app/models/assessresult");

	var Assessresults = app.Collection.extend({
		url: '/assessresults/',
		model: AssessresultModel
	});

	module.setExports(Assessresults);
});
/*! app/collections/assessresults_paged
*   @requires: app,app/models/assessresult
*   @extends: app.Collection_paged
*   @exports: app.collections.Assessresults_paged
*/
define("app/collections/Assessresults_paged",["require","app","app/models"],function(require,app) {
  var AssessresultModel = require("app/models/assessresult");

  var Assessresults_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/assessresults/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AssessresultModel
      });

  module.setExports(Assessresults_paged);
});
/*! app/collections/assesssections
* 	@requires: app,app/models/assesssection
* 	@extends: app.Collection
* 	@exports: app.collections.Assesssections
*/
define("app/collections/assesssections",["require","app","app/models"],function(require,app) {
	var AssesssectionModel = require("app/models/assesssection");

	var Assesssections = app.Collection.extend({
		url: '/assesssections/',
		model: AssesssectionModel
	});

	module.setExports(Assesssections);
});
/*! app/collections/assesssections_paged
*   @requires: app,app/models/assesssection
*   @extends: app.Collection_paged
*   @exports: app.collections.Assesssections_paged
*/
define("app/collections/Assesssections_paged",["require","app","app/models"],function(require,app) {
  var AssesssectionModel = require("app/models/assesssection");

  var Assesssections_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/assesssections/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AssesssectionModel
      });

  module.setExports(Assesssections_paged);
});
/*! app/collections/assesstmpls
* 	@requires: app,app/models/assesstmpl
* 	@extends: app.Collection
* 	@exports: app.collections.Assesstmpls
*/
define("app/collections/assesstmpls",["require","app","app/models"],function(require,app) {
	var AssesstmplModel = require("app/models/assesstmpl");

	var Assesstmpls = app.Collection.extend({
		url: '/assesstmpls/',
		model: AssesstmplModel
	});

	module.setExports(Assesstmpls);
});
/*! app/collections/assesstmpls_paged
*   @requires: app,app/models/assesstmpl
*   @extends: app.Collection_paged
*   @exports: app.collections.Assesstmpls_paged
*/
define("app/collections/Assesstmpls_paged",["require","app","app/models"],function(require,app) {
  var AssesstmplModel = require("app/models/assesstmpl");

  var Assesstmpls_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/assesstmpls/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AssesstmplModel
      });

  module.setExports(Assesstmpls_paged);
});
/*! app/collections/attendees
* 	@requires: app,app/models/attendee
* 	@extends: app.Collection
* 	@exports: app.collections.Attendees
*/
define("app/collections/attendees",["require","app","app/models"],function(require,app) {
	var AttendeeModel = require("app/models/attendee");

	var Attendees = app.Collection.extend({
		url: '/attendees/',
		model: AttendeeModel
	});

	module.setExports(Attendees);
});
/*! app/collections/attendees_paged
*   @requires: app,app/models/attendee
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendees_paged
*/
define("app/collections/Attendees_paged",["require","app","app/models"],function(require,app) {
  var AttendeeModel = require("app/models/attendee");

  var Attendees_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendees/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AttendeeModel
      });

  module.setExports(Attendees_paged);
});
/*! app/collections/attendee_addresses
* 	@requires: app,app/models/attendee_address
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_addresses
*/
define("app/collections/attendee_addresses",["require","app","app/models"],function(require,app) {
	var Attendee_addressModel = require("app/models/attendee_address");

	var Attendee_addresses = app.Collection.extend({
		url: '/attendee_addresses/',
		model: Attendee_addressModel
	});

	module.setExports(Attendee_addresses);
});
/*! app/collections/attendee_addresses_paged
*   @requires: app,app/models/attendee_address
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendee_addresses_paged
*/
define("app/collections/Attendee_addresses_paged",["require","app","app/models"],function(require,app) {
  var Attendee_addressModel = require("app/models/attendee_address");

  var Attendee_addresses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendee_addresses/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Attendee_addressModel
      });

  module.setExports(Attendee_addresses_paged);
});
/*! app/collections/attendee_components
* 	@requires: app,app/models/attendee_component
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_components
*/
define("app/collections/attendee_components",["require","app","app/models"],function(require,app) {
	var Attendee_componentModel = require("app/models/attendee_component");

	var Attendee_components = app.Collection.extend({
		url: '/attendee_components/',
		model: Attendee_componentModel
	});

	module.setExports(Attendee_components);
});
/*! app/collections/attendee_components_paged
*   @requires: app,app/models/attendee_component
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendee_components_paged
*/
define("app/collections/Attendee_components_paged",["require","app","app/models"],function(require,app) {
  var Attendee_componentModel = require("app/models/attendee_component");

  var Attendee_components_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendee_components/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Attendee_componentModel
      });

  module.setExports(Attendee_components_paged);
});
/*! app/collections/attendee_phones
* 	@requires: app,app/models/attendee_phone
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_phones
*/
define("app/collections/attendee_phones",["require","app","app/models"],function(require,app) {
	var Attendee_phoneModel = require("app/models/attendee_phone");

	var Attendee_phones = app.Collection.extend({
		url: '/attendee_phones/',
		model: Attendee_phoneModel
	});

	module.setExports(Attendee_phones);
});
/*! app/collections/attendee_phones_paged
*   @requires: app,app/models/attendee_phone
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendee_phones_paged
*/
define("app/collections/Attendee_phones_paged",["require","app","app/models"],function(require,app) {
  var Attendee_phoneModel = require("app/models/attendee_phone");

  var Attendee_phones_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendee_phones/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Attendee_phoneModel
      });

  module.setExports(Attendee_phones_paged);
});
/*! app/collections/attendee_steps
* 	@requires: app,app/models/attendee_step
* 	@extends: app.Collection
* 	@exports: app.collections.Attendee_steps
*/
define("app/collections/attendee_steps",["require","app","app/models"],function(require,app) {
	var Attendee_stepModel = require("app/models/attendee_step");

	var Attendee_steps = app.Collection.extend({
		url: '/attendee_steps/',
		model: Attendee_stepModel
	});

	module.setExports(Attendee_steps);
});
/*! app/collections/attendee_steps_paged
*   @requires: app,app/models/attendee_step
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendee_steps_paged
*/
define("app/collections/Attendee_steps_paged",["require","app","app/models"],function(require,app) {
  var Attendee_stepModel = require("app/models/attendee_step");

  var Attendee_steps_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendee_steps/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Attendee_stepModel
      });

  module.setExports(Attendee_steps_paged);
});
/*! app/collections/attendeecdcs
* 	@requires: app,app/models/attendeecdc
* 	@extends: app.Collection
* 	@exports: app.collections.Attendeecdcs
*/
define("app/collections/attendeecdcs",["require","app","app/models"],function(require,app) {
	var AttendeecdcModel = require("app/models/attendeecdc");

	var Attendeecdcs = app.Collection.extend({
		url: '/attendeecdcs/',
		model: AttendeecdcModel
	});

	module.setExports(Attendeecdcs);
});
/*! app/collections/attendeecdcs_paged
*   @requires: app,app/models/attendeecdc
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendeecdcs_paged
*/
define("app/collections/Attendeecdcs_paged",["require","app","app/models"],function(require,app) {
  var AttendeecdcModel = require("app/models/attendeecdc");

  var Attendeecdcs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendeecdcs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AttendeecdcModel
      });

  module.setExports(Attendeecdcs_paged);
});
/*! app/collections/attendeecredits
* 	@requires: app,app/models/attendeecredit
* 	@extends: app.Collection
* 	@exports: app.collections.Attendeecredits
*/
define("app/collections/attendeecredits",["require","app","app/models"],function(require,app) {
	var AttendeecreditModel = require("app/models/attendeecredit");

	var Attendeecredits = app.Collection.extend({
		url: '/attendeecredits/',
		model: AttendeecreditModel
	});

	module.setExports(Attendeecredits);
});
/*! app/collections/attendeecredits_paged
*   @requires: app,app/models/attendeecredit
*   @extends: app.Collection_paged
*   @exports: app.collections.Attendeecredits_paged
*/
define("app/collections/Attendeecredits_paged",["require","app","app/models"],function(require,app) {
  var AttendeecreditModel = require("app/models/attendeecredit");

  var Attendeecredits_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/attendeecredits/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AttendeecreditModel
      });

  module.setExports(Attendeecredits_paged);
});
/*! app/collections/authorities
* 	@requires: app,app/models/authority
* 	@extends: app.Collection
* 	@exports: app.collections.Authorities
*/
define("app/collections/authorities",["require","app","app/models"],function(require,app) {
	var AuthorityModel = require("app/models/authority");

	var Authorities = app.Collection.extend({
		url: '/authorities/',
		model: AuthorityModel
	});

	module.setExports(Authorities);
});
/*! app/collections/authorities_paged
*   @requires: app,app/models/authority
*   @extends: app.Collection_paged
*   @exports: app.collections.Authorities_paged
*/
define("app/collections/Authorities_paged",["require","app","app/models"],function(require,app) {
  var AuthorityModel = require("app/models/authority");

  var Authorities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/authorities/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AuthorityModel
      });

  module.setExports(Authorities_paged);
});
/*! app/collections/authoritypages
* 	@requires: app,app/models/authoritypage
* 	@extends: app.Collection
* 	@exports: app.collections.Authoritypages
*/
define("app/collections/authoritypages",["require","app","app/models"],function(require,app) {
	var AuthoritypageModel = require("app/models/authoritypage");

	var Authoritypages = app.Collection.extend({
		url: '/authoritypages/',
		model: AuthoritypageModel
	});

	module.setExports(Authoritypages);
});
/*! app/collections/authoritypages_paged
*   @requires: app,app/models/authoritypage
*   @extends: app.Collection_paged
*   @exports: app.collections.Authoritypages_paged
*/
define("app/collections/Authoritypages_paged",["require","app","app/models"],function(require,app) {
  var AuthoritypageModel = require("app/models/authoritypage");

  var Authoritypages_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/authoritypages/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: AuthoritypageModel
      });

  module.setExports(Authoritypages_paged);
});
/*! app/collections/categories
* 	@requires: app,app/models/category
* 	@extends: app.Collection
* 	@exports: app.collections.Categories
*/
define("app/collections/categories",["require","app","app/models"],function(require,app) {
	var CategoryModel = require("app/models/category");

	var Categories = app.Collection.extend({
		url: '/categories/',
		model: CategoryModel
	});

	module.setExports(Categories);
});
/*! app/collections/categories_paged
*   @requires: app,app/models/category
*   @extends: app.Collection_paged
*   @exports: app.collections.Categories_paged
*/
define("app/collections/Categories_paged",["require","app","app/models"],function(require,app) {
  var CategoryModel = require("app/models/category");

  var Categories_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/categories/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: CategoryModel
      });

  module.setExports(Categories_paged);
});
/*! app/collections/certs
* 	@requires: app,app/models/cert
* 	@extends: app.Collection
* 	@exports: app.collections.Certs
*/
define("app/collections/certs",["require","app","app/models"],function(require,app) {
	var CertModel = require("app/models/cert");

	var Certs = app.Collection.extend({
		url: '/certs/',
		model: CertModel
	});

	module.setExports(Certs);
});
/*! app/collections/certs_paged
*   @requires: app,app/models/cert
*   @extends: app.Collection_paged
*   @exports: app.collections.Certs_paged
*/
define("app/collections/Certs_paged",["require","app","app/models"],function(require,app) {
  var CertModel = require("app/models/cert");

  var Certs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/certs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: CertModel
      });

  module.setExports(Certs_paged);
});
/*! app/collections/cert_credits
* 	@requires: app,app/models/cert_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Cert_credits
*/
define("app/collections/cert_credits",["require","app","app/models"],function(require,app) {
	var Cert_creditModel = require("app/models/cert_credit");

	var Cert_credits = app.Collection.extend({
		url: '/cert_credits/',
		model: Cert_creditModel
	});

	module.setExports(Cert_credits);
});
/*! app/collections/cert_credits_paged
*   @requires: app,app/models/cert_credit
*   @extends: app.Collection_paged
*   @exports: app.collections.Cert_credits_paged
*/
define("app/collections/Cert_credits_paged",["require","app","app/models"],function(require,app) {
  var Cert_creditModel = require("app/models/cert_credit");

  var Cert_credits_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/cert_credits/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Cert_creditModel
      });

  module.setExports(Cert_credits_paged);
});
/*! app/collections/certificates
* 	@requires: app,app/models/certificate
* 	@extends: app.Collection
* 	@exports: app.collections.Certificates
*/
define("app/collections/certificates",["require","app","app/models"],function(require,app) {
	var CertificateModel = require("app/models/certificate");

	var Certificates = app.Collection.extend({
		url: '/certificates/',
		model: CertificateModel
	});

	module.setExports(Certificates);
});
/*! app/collections/certificates_paged
*   @requires: app,app/models/certificate
*   @extends: app.Collection_paged
*   @exports: app.collections.Certificates_paged
*/
define("app/collections/Certificates_paged",["require","app","app/models"],function(require,app) {
  var CertificateModel = require("app/models/certificate");

  var Certificates_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/certificates/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: CertificateModel
      });

  module.setExports(Certificates_paged);
});
/*! app/collections/comments
* 	@requires: app,app/models/comment
* 	@extends: app.Collection
* 	@exports: app.collections.Comments
*/
define("app/collections/comments",["require","app","app/models"],function(require,app) {
	var CommentModel = require("app/models/comment");

	var Comments = app.Collection.extend({
		url: '/comments/',
		model: CommentModel
	});

	module.setExports(Comments);
});
/*! app/collections/comments_paged
*   @requires: app,app/models/comment
*   @extends: app.Collection_paged
*   @exports: app.collections.Comments_paged
*/
define("app/collections/Comments_paged",["require","app","app/models"],function(require,app) {
  var CommentModel = require("app/models/comment");

  var Comments_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/comments/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: CommentModel
      });

  module.setExports(Comments_paged);
});
/*! app/collections/credit_certs
* 	@requires: app,app/models/credit_cert
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_certs
*/
define("app/collections/credit_certs",["require","app","app/models"],function(require,app) {
	var Credit_certModel = require("app/models/credit_cert");

	var Credit_certs = app.Collection.extend({
		url: '/credit_certs/',
		model: Credit_certModel
	});

	module.setExports(Credit_certs);
});
/*! app/collections/credit_certs_paged
*   @requires: app,app/models/credit_cert
*   @extends: app.Collection_paged
*   @exports: app.collections.Credit_certs_paged
*/
define("app/collections/Credit_certs_paged",["require","app","app/models"],function(require,app) {
  var Credit_certModel = require("app/models/credit_cert");

  var Credit_certs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/credit_certs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Credit_certModel
      });

  module.setExports(Credit_certs_paged);
});
/*! app/collections/credit_requests
* 	@requires: app,app/models/credit_request
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_requests
*/
define("app/collections/credit_requests",["require","app","app/models"],function(require,app) {
	var Credit_requestModel = require("app/models/credit_request");

	var Credit_requests = app.Collection.extend({
		url: '/credit_requests/',
		model: Credit_requestModel
	});

	module.setExports(Credit_requests);
});
/*! app/collections/credit_requests_paged
*   @requires: app,app/models/credit_request
*   @extends: app.Collection_paged
*   @exports: app.collections.Credit_requests_paged
*/
define("app/collections/Credit_requests_paged",["require","app","app/models"],function(require,app) {
  var Credit_requestModel = require("app/models/credit_request");

  var Credit_requests_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/credit_requests/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Credit_requestModel
      });

  module.setExports(Credit_requests_paged);
});
/*! app/collections/credit_request_emails
* 	@requires: app,app/models/credit_request_email
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_request_emails
*/
define("app/collections/credit_request_emails",["require","app","app/models"],function(require,app) {
	var Credit_request_emailModel = require("app/models/credit_request_email");

	var Credit_request_emails = app.Collection.extend({
		url: '/credit_request_emails/',
		model: Credit_request_emailModel
	});

	module.setExports(Credit_request_emails);
});
/*! app/collections/credit_request_emails_paged
*   @requires: app,app/models/credit_request_email
*   @extends: app.Collection_paged
*   @exports: app.collections.Credit_request_emails_paged
*/
define("app/collections/Credit_request_emails_paged",["require","app","app/models"],function(require,app) {
  var Credit_request_emailModel = require("app/models/credit_request_email");

  var Credit_request_emails_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/credit_request_emails/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Credit_request_emailModel
      });

  module.setExports(Credit_request_emails_paged);
});
/*! app/collections/credit_request_imports
* 	@requires: app,app/models/credit_request_import
* 	@extends: app.Collection
* 	@exports: app.collections.Credit_request_imports
*/
define("app/collections/credit_request_imports",["require","app","app/models"],function(require,app) {
	var Credit_request_importModel = require("app/models/credit_request_import");

	var Credit_request_imports = app.Collection.extend({
		url: '/credit_request_imports/',
		model: Credit_request_importModel
	});

	module.setExports(Credit_request_imports);
});
/*! app/collections/credit_request_imports_paged
*   @requires: app,app/models/credit_request_import
*   @extends: app.Collection_paged
*   @exports: app.collections.Credit_request_imports_paged
*/
define("app/collections/Credit_request_imports_paged",["require","app","app/models"],function(require,app) {
  var Credit_request_importModel = require("app/models/credit_request_import");

  var Credit_request_imports_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/credit_request_imports/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Credit_request_importModel
      });

  module.setExports(Credit_request_imports_paged);
});
/*! app/collections/degrees
* 	@requires: app,app/models/degree
* 	@extends: app.Collection
* 	@exports: app.collections.Degrees
*/
define("app/collections/degrees",["require","app","app/models"],function(require,app) {
	var DegreeModel = require("app/models/degree");

	var Degrees = app.Collection.extend({
		url: '/degrees/',
		model: DegreeModel
	});

	module.setExports(Degrees);
});
/*! app/collections/degrees_paged
*   @requires: app,app/models/degree
*   @extends: app.Collection_paged
*   @exports: app.collections.Degrees_paged
*/
define("app/collections/Degrees_paged",["require","app","app/models"],function(require,app) {
  var DegreeModel = require("app/models/degree");

  var Degrees_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/degrees/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: DegreeModel
      });

  module.setExports(Degrees_paged);
});
/*! app/collections/degree_credits
* 	@requires: app,app/models/degree_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Degree_credits
*/
define("app/collections/degree_credits",["require","app","app/models"],function(require,app) {
	var Degree_creditModel = require("app/models/degree_credit");

	var Degree_credits = app.Collection.extend({
		url: '/degree_credits/',
		model: Degree_creditModel
	});

	module.setExports(Degree_credits);
});
/*! app/collections/degree_credits_paged
*   @requires: app,app/models/degree_credit
*   @extends: app.Collection_paged
*   @exports: app.collections.Degree_credits_paged
*/
define("app/collections/Degree_credits_paged",["require","app","app/models"],function(require,app) {
  var Degree_creditModel = require("app/models/degree_credit");

  var Degree_credits_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/degree_credits/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Degree_creditModel
      });

  module.setExports(Degree_credits_paged);
});
/*! app/collections/entities
* 	@requires: app,app/models/entity
* 	@extends: app.Collection
* 	@exports: app.collections.Entities
*/
define("app/collections/entities",["require","app","app/models"],function(require,app) {
	var EntityModel = require("app/models/entity");

	var Entities = app.Collection.extend({
		url: '/entities/',
		model: EntityModel
	});

	module.setExports(Entities);
});
/*! app/collections/entities_paged
*   @requires: app,app/models/entity
*   @extends: app.Collection_paged
*   @exports: app.collections.Entities_paged
*/
define("app/collections/Entities_paged",["require","app","app/models"],function(require,app) {
  var EntityModel = require("app/models/entity");

  var Entities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entities/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: EntityModel
      });

  module.setExports(Entities_paged);
});
/*! app/collections/entity_activities
* 	@requires: app,app/models/entity_activity
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_activities
*/
define("app/collections/entity_activities",["require","app","app/models"],function(require,app) {
	var Entity_activityModel = require("app/models/entity_activity");

	var Entity_activities = app.Collection.extend({
		url: '/entity_activities/',
		model: Entity_activityModel
	});

	module.setExports(Entity_activities);
});
/*! app/collections/entity_activities_paged
*   @requires: app,app/models/entity_activity
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_activities_paged
*/
define("app/collections/Entity_activities_paged",["require","app","app/models"],function(require,app) {
  var Entity_activityModel = require("app/models/entity_activity");

  var Entity_activities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_activities/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Entity_activityModel
      });

  module.setExports(Entity_activities_paged);
});
/*! app/collections/entity_credits
* 	@requires: app,app/models/entity_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_credits
*/
define("app/collections/entity_credits",["require","app","app/models"],function(require,app) {
	var Entity_creditModel = require("app/models/entity_credit");

	var Entity_credits = app.Collection.extend({
		url: '/entity_credits/',
		model: Entity_creditModel
	});

	module.setExports(Entity_credits);
});
/*! app/collections/entity_credits_paged
*   @requires: app,app/models/entity_credit
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_credits_paged
*/
define("app/collections/Entity_credits_paged",["require","app","app/models"],function(require,app) {
  var Entity_creditModel = require("app/models/entity_credit");

  var Entity_credits_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_credits/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Entity_creditModel
      });

  module.setExports(Entity_credits_paged);
});
/*! app/collections/entity_entityroles
* 	@requires: app,app/models/entity_entityrole
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_entityroles
*/
define("app/collections/entity_entityroles",["require","app","app/models"],function(require,app) {
	var Entity_entityroleModel = require("app/models/entity_entityrole");

	var Entity_entityroles = app.Collection.extend({
		url: '/entity_entityroles/',
		model: Entity_entityroleModel
	});

	module.setExports(Entity_entityroles);
});
/*! app/collections/entity_entityroles_paged
*   @requires: app,app/models/entity_entityrole
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_entityroles_paged
*/
define("app/collections/Entity_entityroles_paged",["require","app","app/models"],function(require,app) {
  var Entity_entityroleModel = require("app/models/entity_entityrole");

  var Entity_entityroles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_entityroles/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Entity_entityroleModel
      });

  module.setExports(Entity_entityroles_paged);
});
/*! app/collections/entity_entitytypes
* 	@requires: app,app/models/entity_entitytype
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_entitytypes
*/
define("app/collections/entity_entitytypes",["require","app","app/models"],function(require,app) {
	var Entity_entitytypeModel = require("app/models/entity_entitytype");

	var Entity_entitytypes = app.Collection.extend({
		url: '/entity_entitytypes/',
		model: Entity_entitytypeModel
	});

	module.setExports(Entity_entitytypes);
});
/*! app/collections/entity_entitytypes_paged
*   @requires: app,app/models/entity_entitytype
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_entitytypes_paged
*/
define("app/collections/Entity_entitytypes_paged",["require","app","app/models"],function(require,app) {
  var Entity_entitytypeModel = require("app/models/entity_entitytype");

  var Entity_entitytypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_entitytypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Entity_entitytypeModel
      });

  module.setExports(Entity_entitytypes_paged);
});
/*! app/collections/entity_persons
* 	@requires: app,app/models/entity_person
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_persons
*/
define("app/collections/entity_persons",["require","app","app/models"],function(require,app) {
	var Entity_personModel = require("app/models/entity_person");

	var Entity_persons = app.Collection.extend({
		url: '/entity_persons/',
		model: Entity_personModel
	});

	module.setExports(Entity_persons);
});
/*! app/collections/entity_persons_paged
*   @requires: app,app/models/entity_person
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_persons_paged
*/
define("app/collections/Entity_persons_paged",["require","app","app/models"],function(require,app) {
  var Entity_personModel = require("app/models/entity_person");

  var Entity_persons_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_persons/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Entity_personModel
      });

  module.setExports(Entity_persons_paged);
});
/*! app/collections/entity_relates
* 	@requires: app,app/models/entity_relate
* 	@extends: app.Collection
* 	@exports: app.collections.Entity_relates
*/
define("app/collections/entity_relates",["require","app","app/models"],function(require,app) {
	var Entity_relateModel = require("app/models/entity_relate");

	var Entity_relates = app.Collection.extend({
		url: '/entity_relates/',
		model: Entity_relateModel
	});

	module.setExports(Entity_relates);
});
/*! app/collections/entity_relates_paged
*   @requires: app,app/models/entity_relate
*   @extends: app.Collection_paged
*   @exports: app.collections.Entity_relates_paged
*/
define("app/collections/Entity_relates_paged",["require","app","app/models"],function(require,app) {
  var Entity_relateModel = require("app/models/entity_relate");

  var Entity_relates_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entity_relates/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Entity_relateModel
      });

  module.setExports(Entity_relates_paged);
});
/*! app/collections/entityroles
* 	@requires: app,app/models/entityrole
* 	@extends: app.Collection
* 	@exports: app.collections.Entityroles
*/
define("app/collections/entityroles",["require","app","app/models"],function(require,app) {
	var EntityroleModel = require("app/models/entityrole");

	var Entityroles = app.Collection.extend({
		url: '/entityroles/',
		model: EntityroleModel
	});

	module.setExports(Entityroles);
});
/*! app/collections/entityroles_paged
*   @requires: app,app/models/entityrole
*   @extends: app.Collection_paged
*   @exports: app.collections.Entityroles_paged
*/
define("app/collections/Entityroles_paged",["require","app","app/models"],function(require,app) {
  var EntityroleModel = require("app/models/entityrole");

  var Entityroles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entityroles/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: EntityroleModel
      });

  module.setExports(Entityroles_paged);
});
/*! app/collections/entitytypes
* 	@requires: app,app/models/entitytype
* 	@extends: app.Collection
* 	@exports: app.collections.Entitytypes
*/
define("app/collections/entitytypes",["require","app","app/models"],function(require,app) {
	var EntitytypeModel = require("app/models/entitytype");

	var Entitytypes = app.Collection.extend({
		url: '/entitytypes/',
		model: EntitytypeModel
	});

	module.setExports(Entitytypes);
});
/*! app/collections/entitytypes_paged
*   @requires: app,app/models/entitytype
*   @extends: app.Collection_paged
*   @exports: app.collections.Entitytypes_paged
*/
define("app/collections/Entitytypes_paged",["require","app","app/models"],function(require,app) {
  var EntitytypeModel = require("app/models/entitytype");

  var Entitytypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/entitytypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: EntitytypeModel
      });

  module.setExports(Entitytypes_paged);
});
/*! app/collections/files
* 	@requires: app,app/models/file
* 	@extends: app.Collection
* 	@exports: app.collections.Files
*/
define("app/collections/files",["require","app","app/models"],function(require,app) {
	var FileModel = require("app/models/file");

	var Files = app.Collection.extend({
		url: '/files/',
		model: FileModel
	});

	module.setExports(Files);
});
/*! app/collections/files_paged
*   @requires: app,app/models/file
*   @extends: app.Collection_paged
*   @exports: app.collections.Files_paged
*/
define("app/collections/Files_paged",["require","app","app/models"],function(require,app) {
  var FileModel = require("app/models/file");

  var Files_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/files/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: FileModel
      });

  module.setExports(Files_paged);
});
/*! app/collections/filegroups
* 	@requires: app,app/models/filegroup
* 	@extends: app.Collection
* 	@exports: app.collections.Filegroups
*/
define("app/collections/filegroups",["require","app","app/models"],function(require,app) {
	var FilegroupModel = require("app/models/filegroup");

	var Filegroups = app.Collection.extend({
		url: '/filegroups/',
		model: FilegroupModel
	});

	module.setExports(Filegroups);
});
/*! app/collections/filegroups_paged
*   @requires: app,app/models/filegroup
*   @extends: app.Collection_paged
*   @exports: app.collections.Filegroups_paged
*/
define("app/collections/Filegroups_paged",["require","app","app/models"],function(require,app) {
  var FilegroupModel = require("app/models/filegroup");

  var Filegroups_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/filegroups/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: FilegroupModel
      });

  module.setExports(Filegroups_paged);
});
/*! app/collections/geonames
* 	@requires: app,app/models/geoname
* 	@extends: app.Collection
* 	@exports: app.collections.Geonames
*/
define("app/collections/geonames",["require","app","app/models"],function(require,app) {
	var GeonameModel = require("app/models/geoname");

	var Geonames = app.Collection.extend({
		url: '/geonames/',
		model: GeonameModel
	});

	module.setExports(Geonames);
});
/*! app/collections/geonames_paged
*   @requires: app,app/models/geoname
*   @extends: app.Collection_paged
*   @exports: app.collections.Geonames_paged
*/
define("app/collections/Geonames_paged",["require","app","app/models"],function(require,app) {
  var GeonameModel = require("app/models/geoname");

  var Geonames_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/geonames/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: GeonameModel
      });

  module.setExports(Geonames_paged);
});
/*! app/collections/groups
* 	@requires: app,app/models/group
* 	@extends: app.Collection
* 	@exports: app.collections.Groups
*/
define("app/collections/groups",["require","app","app/models"],function(require,app) {
	var GroupModel = require("app/models/group");

	var Groups = app.Collection.extend({
		url: '/groups/',
		model: GroupModel
	});

	module.setExports(Groups);
});
/*! app/collections/groups_paged
*   @requires: app,app/models/group
*   @extends: app.Collection_paged
*   @exports: app.collections.Groups_paged
*/
define("app/collections/Groups_paged",["require","app","app/models"],function(require,app) {
  var GroupModel = require("app/models/group");

  var Groups_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/groups/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: GroupModel
      });

  module.setExports(Groups_paged);
});
/*! app/collections/grouptypes
* 	@requires: app,app/models/grouptype
* 	@extends: app.Collection
* 	@exports: app.collections.Grouptypes
*/
define("app/collections/grouptypes",["require","app","app/models"],function(require,app) {
	var GrouptypeModel = require("app/models/grouptype");

	var Grouptypes = app.Collection.extend({
		url: '/grouptypes/',
		model: GrouptypeModel
	});

	module.setExports(Grouptypes);
});
/*! app/collections/grouptypes_paged
*   @requires: app,app/models/grouptype
*   @extends: app.Collection_paged
*   @exports: app.collections.Grouptypes_paged
*/
define("app/collections/Grouptypes_paged",["require","app","app/models"],function(require,app) {
  var GrouptypeModel = require("app/models/grouptype");

  var Grouptypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/grouptypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: GrouptypeModel
      });

  module.setExports(Grouptypes_paged);
});
/*! app/collections/histories
* 	@requires: app,app/models/history
* 	@extends: app.Collection
* 	@exports: app.collections.Histories
*/
define("app/collections/histories",["require","app","app/models"],function(require,app) {
	var HistoryModel = require("app/models/history");

	var Histories = app.Collection.extend({
		url: '/histories/',
		model: HistoryModel
	});

	module.setExports(Histories);
});
/*! app/collections/histories_paged
*   @requires: app,app/models/history
*   @extends: app.Collection_paged
*   @exports: app.collections.Histories_paged
*/
define("app/collections/Histories_paged",["require","app","app/models"],function(require,app) {
  var HistoryModel = require("app/models/history");

  var Histories_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/histories/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: HistoryModel
      });

  module.setExports(Histories_paged);
});
/*! app/collections/hubs
* 	@requires: app,app/models/hub
* 	@extends: app.Collection
* 	@exports: app.collections.Hubs
*/
define("app/collections/hubs",["require","app","app/models"],function(require,app) {
	var HubModel = require("app/models/hub");

	var Hubs = app.Collection.extend({
		url: '/hubs/',
		model: HubModel
	});

	module.setExports(Hubs);
});
/*! app/collections/hubs_paged
*   @requires: app,app/models/hub
*   @extends: app.Collection_paged
*   @exports: app.collections.Hubs_paged
*/
define("app/collections/Hubs_paged",["require","app","app/models"],function(require,app) {
  var HubModel = require("app/models/hub");

  var Hubs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/hubs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: HubModel
      });

  module.setExports(Hubs_paged);
});
/*! app/collections/images
* 	@requires: app,app/models/image
* 	@extends: app.Collection
* 	@exports: app.collections.Images
*/
define("app/collections/images",["require","app","app/models"],function(require,app) {
	var ImageModel = require("app/models/image");

	var Images = app.Collection.extend({
		url: '/images/',
		model: ImageModel
	});

	module.setExports(Images);
});
/*! app/collections/images_paged
*   @requires: app,app/models/image
*   @extends: app.Collection_paged
*   @exports: app.collections.Images_paged
*/
define("app/collections/Images_paged",["require","app","app/models"],function(require,app) {
  var ImageModel = require("app/models/image");

  var Images_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/images/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ImageModel
      });

  module.setExports(Images_paged);
});
/*! app/collections/imagetypes
* 	@requires: app,app/models/imagetype
* 	@extends: app.Collection
* 	@exports: app.collections.Imagetypes
*/
define("app/collections/imagetypes",["require","app","app/models"],function(require,app) {
	var ImagetypeModel = require("app/models/imagetype");

	var Imagetypes = app.Collection.extend({
		url: '/imagetypes/',
		model: ImagetypeModel
	});

	module.setExports(Imagetypes);
});
/*! app/collections/imagetypes_paged
*   @requires: app,app/models/imagetype
*   @extends: app.Collection_paged
*   @exports: app.collections.Imagetypes_paged
*/
define("app/collections/Imagetypes_paged",["require","app","app/models"],function(require,app) {
  var ImagetypeModel = require("app/models/imagetype");

  var Imagetypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/imagetypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ImagetypeModel
      });

  module.setExports(Imagetypes_paged);
});
/*! app/collections/locations
* 	@requires: app,app/models/location
* 	@extends: app.Collection
* 	@exports: app.collections.Locations
*/
define("app/collections/locations",["require","app","app/models"],function(require,app) {
	var LocationModel = require("app/models/location");

	var Locations = app.Collection.extend({
		url: '/locations/',
		model: LocationModel
	});

	module.setExports(Locations);
});
/*! app/collections/locations_paged
*   @requires: app,app/models/location
*   @extends: app.Collection_paged
*   @exports: app.collections.Locations_paged
*/
define("app/collections/Locations_paged",["require","app","app/models"],function(require,app) {
  var LocationModel = require("app/models/location");

  var Locations_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/locations/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: LocationModel
      });

  module.setExports(Locations_paged);
});
/*! app/collections/locationtypes
* 	@requires: app,app/models/locationtype
* 	@extends: app.Collection
* 	@exports: app.collections.Locationtypes
*/
define("app/collections/locationtypes",["require","app","app/models"],function(require,app) {
	var LocationtypeModel = require("app/models/locationtype");

	var Locationtypes = app.Collection.extend({
		url: '/locationtypes/',
		model: LocationtypeModel
	});

	module.setExports(Locationtypes);
});
/*! app/collections/locationtypes_paged
*   @requires: app,app/models/locationtype
*   @extends: app.Collection_paged
*   @exports: app.collections.Locationtypes_paged
*/
define("app/collections/Locationtypes_paged",["require","app","app/models"],function(require,app) {
  var LocationtypeModel = require("app/models/locationtype");

  var Locationtypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/locationtypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: LocationtypeModel
      });

  module.setExports(Locationtypes_paged);
});
/*! app/collections/models
* 	@requires: app,app/models/model
* 	@extends: app.Collection
* 	@exports: app.collections.Models
*/
define("app/collections/models",["require","app","app/models"],function(require,app) {
	var ModelModel = require("app/models/model");

	var Models = app.Collection.extend({
		url: '/models/',
		model: ModelModel
	});

	module.setExports(Models);
});
/*! app/collections/models_paged
*   @requires: app,app/models/model
*   @extends: app.Collection_paged
*   @exports: app.collections.Models_paged
*/
define("app/collections/Models_paged",["require","app","app/models"],function(require,app) {
  var ModelModel = require("app/models/model");

  var Models_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/models/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ModelModel
      });

  module.setExports(Models_paged);
});
/*! app/collections/objects
* 	@requires: app,app/models/object
* 	@extends: app.Collection
* 	@exports: app.collections.Objects
*/
define("app/collections/objects",["require","app","app/models"],function(require,app) {
	var ObjectModel = require("app/models/object");

	var Objects = app.Collection.extend({
		url: '/objects/',
		model: ObjectModel
	});

	module.setExports(Objects);
});
/*! app/collections/objects_paged
*   @requires: app,app/models/object
*   @extends: app.Collection_paged
*   @exports: app.collections.Objects_paged
*/
define("app/collections/Objects_paged",["require","app","app/models"],function(require,app) {
  var ObjectModel = require("app/models/object");

  var Objects_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/objects/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ObjectModel
      });

  module.setExports(Objects_paged);
});
/*! app/collections/objectdatas
* 	@requires: app,app/models/objectdatum
* 	@extends: app.Collection
* 	@exports: app.collections.Objectdatas
*/
define("app/collections/objectdatas",["require","app","app/models"],function(require,app) {
	var ObjectdatumModel = require("app/models/objectdatum");

	var Objectdatas = app.Collection.extend({
		url: '/objectdatas/',
		model: ObjectdatumModel
	});

	module.setExports(Objectdatas);
});
/*! app/collections/objectdatas_paged
*   @requires: app,app/models/objectdatum
*   @extends: app.Collection_paged
*   @exports: app.collections.Objectdatas_paged
*/
define("app/collections/Objectdatas_paged",["require","app","app/models"],function(require,app) {
  var ObjectdatumModel = require("app/models/objectdatum");

  var Objectdatas_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/objectdatas/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ObjectdatumModel
      });

  module.setExports(Objectdatas_paged);
});
/*! app/collections/objectfields
* 	@requires: app,app/models/objectfield
* 	@extends: app.Collection
* 	@exports: app.collections.Objectfields
*/
define("app/collections/objectfields",["require","app","app/models"],function(require,app) {
	var ObjectfieldModel = require("app/models/objectfield");

	var Objectfields = app.Collection.extend({
		url: '/objectfields/',
		model: ObjectfieldModel
	});

	module.setExports(Objectfields);
});
/*! app/collections/objectfields_paged
*   @requires: app,app/models/objectfield
*   @extends: app.Collection_paged
*   @exports: app.collections.Objectfields_paged
*/
define("app/collections/Objectfields_paged",["require","app","app/models"],function(require,app) {
  var ObjectfieldModel = require("app/models/objectfield");

  var Objectfields_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/objectfields/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ObjectfieldModel
      });

  module.setExports(Objectfields_paged);
});
/*! app/collections/objectfieldtypes
* 	@requires: app,app/models/objectfieldtype
* 	@extends: app.Collection
* 	@exports: app.collections.Objectfieldtypes
*/
define("app/collections/objectfieldtypes",["require","app","app/models"],function(require,app) {
	var ObjectfieldtypeModel = require("app/models/objectfieldtype");

	var Objectfieldtypes = app.Collection.extend({
		url: '/objectfieldtypes/',
		model: ObjectfieldtypeModel
	});

	module.setExports(Objectfieldtypes);
});
/*! app/collections/objectfieldtypes_paged
*   @requires: app,app/models/objectfieldtype
*   @extends: app.Collection_paged
*   @exports: app.collections.Objectfieldtypes_paged
*/
define("app/collections/Objectfieldtypes_paged",["require","app","app/models"],function(require,app) {
  var ObjectfieldtypeModel = require("app/models/objectfieldtype");

  var Objectfieldtypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/objectfieldtypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ObjectfieldtypeModel
      });

  module.setExports(Objectfieldtypes_paged);
});
/*! app/collections/objectforms
* 	@requires: app,app/models/objectform
* 	@extends: app.Collection
* 	@exports: app.collections.Objectforms
*/
define("app/collections/objectforms",["require","app","app/models"],function(require,app) {
	var ObjectformModel = require("app/models/objectform");

	var Objectforms = app.Collection.extend({
		url: '/objectforms/',
		model: ObjectformModel
	});

	module.setExports(Objectforms);
});
/*! app/collections/objectforms_paged
*   @requires: app,app/models/objectform
*   @extends: app.Collection_paged
*   @exports: app.collections.Objectforms_paged
*/
define("app/collections/Objectforms_paged",["require","app","app/models"],function(require,app) {
  var ObjectformModel = require("app/models/objectform");

  var Objectforms_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/objectforms/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ObjectformModel
      });

  module.setExports(Objectforms_paged);
});
/*! app/collections/objecttypes
* 	@requires: app,app/models/objecttype
* 	@extends: app.Collection
* 	@exports: app.collections.Objecttypes
*/
define("app/collections/objecttypes",["require","app","app/models"],function(require,app) {
	var ObjecttypeModel = require("app/models/objecttype");

	var Objecttypes = app.Collection.extend({
		url: '/objecttypes/',
		model: ObjecttypeModel
	});

	module.setExports(Objecttypes);
});
/*! app/collections/objecttypes_paged
*   @requires: app,app/models/objecttype
*   @extends: app.Collection_paged
*   @exports: app.collections.Objecttypes_paged
*/
define("app/collections/Objecttypes_paged",["require","app","app/models"],function(require,app) {
  var ObjecttypeModel = require("app/models/objecttype");

  var Objecttypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/objecttypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ObjecttypeModel
      });

  module.setExports(Objecttypes_paged);
});
/*! app/collections/occupations
* 	@requires: app,app/models/occupation
* 	@extends: app.Collection
* 	@exports: app.collections.Occupations
*/
define("app/collections/occupations",["require","app","app/models"],function(require,app) {
	var OccupationModel = require("app/models/occupation");

	var Occupations = app.Collection.extend({
		url: '/occupations/',
		model: OccupationModel
	});

	module.setExports(Occupations);
});
/*! app/collections/occupations_paged
*   @requires: app,app/models/occupation
*   @extends: app.Collection_paged
*   @exports: app.collections.Occupations_paged
*/
define("app/collections/Occupations_paged",["require","app","app/models"],function(require,app) {
  var OccupationModel = require("app/models/occupation");

  var Occupations_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/occupations/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: OccupationModel
      });

  module.setExports(Occupations_paged);
});
/*! app/collections/pages
* 	@requires: app,app/models/page
* 	@extends: app.Collection
* 	@exports: app.collections.Pages
*/
define("app/collections/pages",["require","app","app/models"],function(require,app) {
	var PageModel = require("app/models/page");

	var Pages = app.Collection.extend({
		url: '/pages/',
		model: PageModel
	});

	module.setExports(Pages);
});
/*! app/collections/pages_paged
*   @requires: app,app/models/page
*   @extends: app.Collection_paged
*   @exports: app.collections.Pages_paged
*/
define("app/collections/Pages_paged",["require","app","app/models"],function(require,app) {
  var PageModel = require("app/models/page");

  var Pages_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/pages/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: PageModel
      });

  module.setExports(Pages_paged);
});
/*! app/collections/page_elements
* 	@requires: app,app/models/page_element
* 	@extends: app.Collection
* 	@exports: app.collections.Page_elements
*/
define("app/collections/page_elements",["require","app","app/models"],function(require,app) {
	var Page_elementModel = require("app/models/page_element");

	var Page_elements = app.Collection.extend({
		url: '/page_elements/',
		model: Page_elementModel
	});

	module.setExports(Page_elements);
});
/*! app/collections/page_elements_paged
*   @requires: app,app/models/page_element
*   @extends: app.Collection_paged
*   @exports: app.collections.Page_elements_paged
*/
define("app/collections/Page_elements_paged",["require","app","app/models"],function(require,app) {
  var Page_elementModel = require("app/models/page_element");

  var Page_elements_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/page_elements/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Page_elementModel
      });

  module.setExports(Page_elements_paged);
});
/*! app/collections/page_sections
* 	@requires: app,app/models/page_section
* 	@extends: app.Collection
* 	@exports: app.collections.Page_sections
*/
define("app/collections/page_sections",["require","app","app/models"],function(require,app) {
	var Page_sectionModel = require("app/models/page_section");

	var Page_sections = app.Collection.extend({
		url: '/page_sections/',
		model: Page_sectionModel
	});

	module.setExports(Page_sections);
});
/*! app/collections/page_sections_paged
*   @requires: app,app/models/page_section
*   @extends: app.Collection_paged
*   @exports: app.collections.Page_sections_paged
*/
define("app/collections/Page_sections_paged",["require","app","app/models"],function(require,app) {
  var Page_sectionModel = require("app/models/page_section");

  var Page_sections_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/page_sections/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Page_sectionModel
      });

  module.setExports(Page_sections_paged);
});
/*! app/collections/pagelayouts
* 	@requires: app,app/models/pagelayout
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayouts
*/
define("app/collections/pagelayouts",["require","app","app/models"],function(require,app) {
	var PagelayoutModel = require("app/models/pagelayout");

	var Pagelayouts = app.Collection.extend({
		url: '/pagelayouts/',
		model: PagelayoutModel
	});

	module.setExports(Pagelayouts);
});
/*! app/collections/pagelayouts_paged
*   @requires: app,app/models/pagelayout
*   @extends: app.Collection_paged
*   @exports: app.collections.Pagelayouts_paged
*/
define("app/collections/Pagelayouts_paged",["require","app","app/models"],function(require,app) {
  var PagelayoutModel = require("app/models/pagelayout");

  var Pagelayouts_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/pagelayouts/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: PagelayoutModel
      });

  module.setExports(Pagelayouts_paged);
});
/*! app/collections/pagelayoutmenus
* 	@requires: app,app/models/pagelayoutmenu
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayoutmenus
*/
define("app/collections/pagelayoutmenus",["require","app","app/models"],function(require,app) {
	var PagelayoutmenuModel = require("app/models/pagelayoutmenu");

	var Pagelayoutmenus = app.Collection.extend({
		url: '/pagelayoutmenus/',
		model: PagelayoutmenuModel
	});

	module.setExports(Pagelayoutmenus);
});
/*! app/collections/pagelayoutmenus_paged
*   @requires: app,app/models/pagelayoutmenu
*   @extends: app.Collection_paged
*   @exports: app.collections.Pagelayoutmenus_paged
*/
define("app/collections/Pagelayoutmenus_paged",["require","app","app/models"],function(require,app) {
  var PagelayoutmenuModel = require("app/models/pagelayoutmenu");

  var Pagelayoutmenus_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/pagelayoutmenus/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: PagelayoutmenuModel
      });

  module.setExports(Pagelayoutmenus_paged);
});
/*! app/collections/pagelayoutmenu_pages
* 	@requires: app,app/models/pagelayoutmenu_page
* 	@extends: app.Collection
* 	@exports: app.collections.Pagelayoutmenu_pages
*/
define("app/collections/pagelayoutmenu_pages",["require","app","app/models"],function(require,app) {
	var Pagelayoutmenu_pageModel = require("app/models/pagelayoutmenu_page");

	var Pagelayoutmenu_pages = app.Collection.extend({
		url: '/pagelayoutmenu_pages/',
		model: Pagelayoutmenu_pageModel
	});

	module.setExports(Pagelayoutmenu_pages);
});
/*! app/collections/pagelayoutmenu_pages_paged
*   @requires: app,app/models/pagelayoutmenu_page
*   @extends: app.Collection_paged
*   @exports: app.collections.Pagelayoutmenu_pages_paged
*/
define("app/collections/Pagelayoutmenu_pages_paged",["require","app","app/models"],function(require,app) {
  var Pagelayoutmenu_pageModel = require("app/models/pagelayoutmenu_page");

  var Pagelayoutmenu_pages_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/pagelayoutmenu_pages/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Pagelayoutmenu_pageModel
      });

  module.setExports(Pagelayoutmenu_pages_paged);
});
/*! app/collections/people
* 	@requires: app,app/models/person
* 	@extends: app.Collection
* 	@exports: app.collections.People
*/
define("app/collections/people",["require","app","app/models"],function(require,app) {
	var PersonModel = require("app/models/person");

	var People = app.Collection.extend({
		url: '/people/',
		model: PersonModel
	});

	module.setExports(People);
});
/*! app/collections/people_paged
*   @requires: app,app/models/person
*   @extends: app.Collection_paged
*   @exports: app.collections.People_paged
*/
define("app/collections/People_paged",["require","app","app/models"],function(require,app) {
  var PersonModel = require("app/models/person");

  var People_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/people/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: PersonModel
      });

  module.setExports(People_paged);
});
/*! app/collections/person_addresses
* 	@requires: app,app/models/person_address
* 	@extends: app.Collection
* 	@exports: app.collections.Person_addresses
*/
define("app/collections/person_addresses",["require","app","app/models"],function(require,app) {
	var Person_addressModel = require("app/models/person_address");

	var Person_addresses = app.Collection.extend({
		url: '/person_addresses/',
		model: Person_addressModel
	});

	module.setExports(Person_addresses);
});
/*! app/collections/person_addresses_paged
*   @requires: app,app/models/person_address
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_addresses_paged
*/
define("app/collections/Person_addresses_paged",["require","app","app/models"],function(require,app) {
  var Person_addressModel = require("app/models/person_address");

  var Person_addresses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_addresses/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_addressModel
      });

  module.setExports(Person_addresses_paged);
});
/*! app/collections/person_clients
* 	@requires: app,app/models/person_client
* 	@extends: app.Collection
* 	@exports: app.collections.Person_clients
*/
define("app/collections/person_clients",["require","app","app/models"],function(require,app) {
	var Person_clientModel = require("app/models/person_client");

	var Person_clients = app.Collection.extend({
		url: '/person_clients/',
		model: Person_clientModel
	});

	module.setExports(Person_clients);
});
/*! app/collections/person_clients_paged
*   @requires: app,app/models/person_client
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_clients_paged
*/
define("app/collections/Person_clients_paged",["require","app","app/models"],function(require,app) {
  var Person_clientModel = require("app/models/person_client");

  var Person_clients_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_clients/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_clientModel
      });

  module.setExports(Person_clients_paged);
});
/*! app/collections/person_degrees
* 	@requires: app,app/models/person_degree
* 	@extends: app.Collection
* 	@exports: app.collections.Person_degrees
*/
define("app/collections/person_degrees",["require","app","app/models"],function(require,app) {
	var Person_degreeModel = require("app/models/person_degree");

	var Person_degrees = app.Collection.extend({
		url: '/person_degrees/',
		model: Person_degreeModel
	});

	module.setExports(Person_degrees);
});
/*! app/collections/person_degrees_paged
*   @requires: app,app/models/person_degree
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_degrees_paged
*/
define("app/collections/Person_degrees_paged",["require","app","app/models"],function(require,app) {
  var Person_degreeModel = require("app/models/person_degree");

  var Person_degrees_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_degrees/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_degreeModel
      });

  module.setExports(Person_degrees_paged);
});
/*! app/collections/person_emails
* 	@requires: app,app/models/person_email
* 	@extends: app.Collection
* 	@exports: app.collections.Person_emails
*/
define("app/collections/person_emails",["require","app","app/models"],function(require,app) {
	var Person_emailModel = require("app/models/person_email");

	var Person_emails = app.Collection.extend({
		url: '/person_emails/',
		model: Person_emailModel
	});

	module.setExports(Person_emails);
});
/*! app/collections/person_emails_paged
*   @requires: app,app/models/person_email
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_emails_paged
*/
define("app/collections/Person_emails_paged",["require","app","app/models"],function(require,app) {
  var Person_emailModel = require("app/models/person_email");

  var Person_emails_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_emails/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_emailModel
      });

  module.setExports(Person_emails_paged);
});
/*! app/collections/person_files
* 	@requires: app,app/models/person_file
* 	@extends: app.Collection
* 	@exports: app.collections.Person_files
*/
define("app/collections/person_files",["require","app","app/models"],function(require,app) {
	var Person_fileModel = require("app/models/person_file");

	var Person_files = app.Collection.extend({
		url: '/person_files/',
		model: Person_fileModel
	});

	module.setExports(Person_files);
});
/*! app/collections/person_files_paged
*   @requires: app,app/models/person_file
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_files_paged
*/
define("app/collections/Person_files_paged",["require","app","app/models"],function(require,app) {
  var Person_fileModel = require("app/models/person_file");

  var Person_files_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_files/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_fileModel
      });

  module.setExports(Person_files_paged);
});
/*! app/collections/person_interest_excepts
* 	@requires: app,app/models/person_interest_except
* 	@extends: app.Collection
* 	@exports: app.collections.Person_interest_excepts
*/
define("app/collections/person_interest_excepts",["require","app","app/models"],function(require,app) {
	var Person_interest_exceptModel = require("app/models/person_interest_except");

	var Person_interest_excepts = app.Collection.extend({
		url: '/person_interest_excepts/',
		model: Person_interest_exceptModel
	});

	module.setExports(Person_interest_excepts);
});
/*! app/collections/person_interest_excepts_paged
*   @requires: app,app/models/person_interest_except
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_interest_excepts_paged
*/
define("app/collections/Person_interest_excepts_paged",["require","app","app/models"],function(require,app) {
  var Person_interest_exceptModel = require("app/models/person_interest_except");

  var Person_interest_excepts_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_interest_excepts/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_interest_exceptModel
      });

  module.setExports(Person_interest_excepts_paged);
});
/*! app/collections/person_notes
* 	@requires: app,app/models/person_note
* 	@extends: app.Collection
* 	@exports: app.collections.Person_notes
*/
define("app/collections/person_notes",["require","app","app/models"],function(require,app) {
	var Person_noteModel = require("app/models/person_note");

	var Person_notes = app.Collection.extend({
		url: '/person_notes/',
		model: Person_noteModel
	});

	module.setExports(Person_notes);
});
/*! app/collections/person_notes_paged
*   @requires: app,app/models/person_note
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_notes_paged
*/
define("app/collections/Person_notes_paged",["require","app","app/models"],function(require,app) {
  var Person_noteModel = require("app/models/person_note");

  var Person_notes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_notes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_noteModel
      });

  module.setExports(Person_notes_paged);
});
/*! app/collections/person_prefs
* 	@requires: app,app/models/person_pref
* 	@extends: app.Collection
* 	@exports: app.collections.Person_prefs
*/
define("app/collections/person_prefs",["require","app","app/models"],function(require,app) {
	var Person_prefModel = require("app/models/person_pref");

	var Person_prefs = app.Collection.extend({
		url: '/person_prefs/',
		model: Person_prefModel
	});

	module.setExports(Person_prefs);
});
/*! app/collections/person_prefs_paged
*   @requires: app,app/models/person_pref
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_prefs_paged
*/
define("app/collections/Person_prefs_paged",["require","app","app/models"],function(require,app) {
  var Person_prefModel = require("app/models/person_pref");

  var Person_prefs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_prefs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_prefModel
      });

  module.setExports(Person_prefs_paged);
});
/*! app/collections/person_specialtylms
* 	@requires: app,app/models/person_specialtylm
* 	@extends: app.Collection
* 	@exports: app.collections.Person_specialtylms
*/
define("app/collections/person_specialtylms",["require","app","app/models"],function(require,app) {
	var Person_specialtylmModel = require("app/models/person_specialtylm");

	var Person_specialtylms = app.Collection.extend({
		url: '/person_specialtylms/',
		model: Person_specialtylmModel
	});

	module.setExports(Person_specialtylms);
});
/*! app/collections/person_specialtylms_paged
*   @requires: app,app/models/person_specialtylm
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_specialtylms_paged
*/
define("app/collections/Person_specialtylms_paged",["require","app","app/models"],function(require,app) {
  var Person_specialtylmModel = require("app/models/person_specialtylm");

  var Person_specialtylms_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_specialtylms/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_specialtylmModel
      });

  module.setExports(Person_specialtylms_paged);
});
/*! app/collections/person_users
* 	@requires: app,app/models/person_user
* 	@extends: app.Collection
* 	@exports: app.collections.Person_users
*/
define("app/collections/person_users",["require","app","app/models"],function(require,app) {
	var Person_userModel = require("app/models/person_user");

	var Person_users = app.Collection.extend({
		url: '/person_users/',
		model: Person_userModel
	});

	module.setExports(Person_users);
});
/*! app/collections/person_users_paged
*   @requires: app,app/models/person_user
*   @extends: app.Collection_paged
*   @exports: app.collections.Person_users_paged
*/
define("app/collections/Person_users_paged",["require","app","app/models"],function(require,app) {
  var Person_userModel = require("app/models/person_user");

  var Person_users_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/person_users/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Person_userModel
      });

  module.setExports(Person_users_paged);
});
/*! app/collections/processes
* 	@requires: app,app/models/process
* 	@extends: app.Collection
* 	@exports: app.collections.Processes
*/
define("app/collections/processes",["require","app","app/models"],function(require,app) {
	var ProcessModel = require("app/models/process");

	var Processes = app.Collection.extend({
		url: '/processes/',
		model: ProcessModel
	});

	module.setExports(Processes);
});
/*! app/collections/processes_paged
*   @requires: app,app/models/process
*   @extends: app.Collection_paged
*   @exports: app.collections.Processes_paged
*/
define("app/collections/Processes_paged",["require","app","app/models"],function(require,app) {
  var ProcessModel = require("app/models/process");

  var Processes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/processes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ProcessModel
      });

  module.setExports(Processes_paged);
});
/*! app/collections/process_persons
* 	@requires: app,app/models/process_person
* 	@extends: app.Collection
* 	@exports: app.collections.Process_persons
*/
define("app/collections/process_persons",["require","app","app/models"],function(require,app) {
	var Process_personModel = require("app/models/process_person");

	var Process_persons = app.Collection.extend({
		url: '/process_persons/',
		model: Process_personModel
	});

	module.setExports(Process_persons);
});
/*! app/collections/process_persons_paged
*   @requires: app,app/models/process_person
*   @extends: app.Collection_paged
*   @exports: app.collections.Process_persons_paged
*/
define("app/collections/Process_persons_paged",["require","app","app/models"],function(require,app) {
  var Process_personModel = require("app/models/process_person");

  var Process_persons_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/process_persons/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Process_personModel
      });

  module.setExports(Process_persons_paged);
});
/*! app/collections/processmanagers
* 	@requires: app,app/models/processmanager
* 	@extends: app.Collection
* 	@exports: app.collections.Processmanagers
*/
define("app/collections/processmanagers",["require","app","app/models"],function(require,app) {
	var ProcessmanagerModel = require("app/models/processmanager");

	var Processmanagers = app.Collection.extend({
		url: '/processmanagers/',
		model: ProcessmanagerModel
	});

	module.setExports(Processmanagers);
});
/*! app/collections/processmanagers_paged
*   @requires: app,app/models/processmanager
*   @extends: app.Collection_paged
*   @exports: app.collections.Processmanagers_paged
*/
define("app/collections/Processmanagers_paged",["require","app","app/models"],function(require,app) {
  var ProcessmanagerModel = require("app/models/processmanager");

  var Processmanagers_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/processmanagers/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ProcessmanagerModel
      });

  module.setExports(Processmanagers_paged);
});
/*! app/collections/processsteps
* 	@requires: app,app/models/processstep
* 	@extends: app.Collection
* 	@exports: app.collections.Processsteps
*/
define("app/collections/processsteps",["require","app","app/models"],function(require,app) {
	var ProcessstepModel = require("app/models/processstep");

	var Processsteps = app.Collection.extend({
		url: '/processsteps/',
		model: ProcessstepModel
	});

	module.setExports(Processsteps);
});
/*! app/collections/processsteps_paged
*   @requires: app,app/models/processstep
*   @extends: app.Collection_paged
*   @exports: app.collections.Processsteps_paged
*/
define("app/collections/Processsteps_paged",["require","app","app/models"],function(require,app) {
  var ProcessstepModel = require("app/models/processstep");

  var Processsteps_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/processsteps/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ProcessstepModel
      });

  module.setExports(Processsteps_paged);
});
/*! app/collections/processstep_activities
* 	@requires: app,app/models/processstep_activity
* 	@extends: app.Collection
* 	@exports: app.collections.Processstep_activities
*/
define("app/collections/processstep_activities",["require","app","app/models"],function(require,app) {
	var Processstep_activityModel = require("app/models/processstep_activity");

	var Processstep_activities = app.Collection.extend({
		url: '/processstep_activities/',
		model: Processstep_activityModel
	});

	module.setExports(Processstep_activities);
});
/*! app/collections/processstep_activities_paged
*   @requires: app,app/models/processstep_activity
*   @extends: app.Collection_paged
*   @exports: app.collections.Processstep_activities_paged
*/
define("app/collections/Processstep_activities_paged",["require","app","app/models"],function(require,app) {
  var Processstep_activityModel = require("app/models/processstep_activity");

  var Processstep_activities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/processstep_activities/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Processstep_activityModel
      });

  module.setExports(Processstep_activities_paged);
});
/*! app/collections/professionareas
* 	@requires: app,app/models/professionarea
* 	@extends: app.Collection
* 	@exports: app.collections.Professionareas
*/
define("app/collections/professionareas",["require","app","app/models"],function(require,app) {
	var ProfessionareaModel = require("app/models/professionarea");

	var Professionareas = app.Collection.extend({
		url: '/professionareas/',
		model: ProfessionareaModel
	});

	module.setExports(Professionareas);
});
/*! app/collections/professionareas_paged
*   @requires: app,app/models/professionarea
*   @extends: app.Collection_paged
*   @exports: app.collections.Professionareas_paged
*/
define("app/collections/Professionareas_paged",["require","app","app/models"],function(require,app) {
  var ProfessionareaModel = require("app/models/professionarea");

  var Professionareas_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/professionareas/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ProfessionareaModel
      });

  module.setExports(Professionareas_paged);
});
/*! app/collections/projects
* 	@requires: app,app/models/project
* 	@extends: app.Collection
* 	@exports: app.collections.Projects
*/
define("app/collections/projects",["require","app","app/models"],function(require,app) {
	var ProjectModel = require("app/models/project");

	var Projects = app.Collection.extend({
		url: '/projects/',
		model: ProjectModel
	});

	module.setExports(Projects);
});
/*! app/collections/projects_paged
*   @requires: app,app/models/project
*   @extends: app.Collection_paged
*   @exports: app.collections.Projects_paged
*/
define("app/collections/Projects_paged",["require","app","app/models"],function(require,app) {
  var ProjectModel = require("app/models/project");

  var Projects_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/projects/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: ProjectModel
      });

  module.setExports(Projects_paged);
});
/*! app/collections/relicensures
* 	@requires: app,app/models/relicensure
* 	@extends: app.Collection
* 	@exports: app.collections.Relicensures
*/
define("app/collections/relicensures",["require","app","app/models"],function(require,app) {
	var RelicensureModel = require("app/models/relicensure");

	var Relicensures = app.Collection.extend({
		url: '/relicensures/',
		model: RelicensureModel
	});

	module.setExports(Relicensures);
});
/*! app/collections/relicensures_paged
*   @requires: app,app/models/relicensure
*   @extends: app.Collection_paged
*   @exports: app.collections.Relicensures_paged
*/
define("app/collections/Relicensures_paged",["require","app","app/models"],function(require,app) {
  var RelicensureModel = require("app/models/relicensure");

  var Relicensures_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/relicensures/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: RelicensureModel
      });

  module.setExports(Relicensures_paged);
});
/*! app/collections/stat_entries
* 	@requires: app,app/models/stat_entry
* 	@extends: app.Collection
* 	@exports: app.collections.Stat_entries
*/
define("app/collections/stat_entries",["require","app","app/models"],function(require,app) {
	var Stat_entryModel = require("app/models/stat_entry");

	var Stat_entries = app.Collection.extend({
		url: '/stat_entries/',
		model: Stat_entryModel
	});

	module.setExports(Stat_entries);
});
/*! app/collections/stat_entries_paged
*   @requires: app,app/models/stat_entry
*   @extends: app.Collection_paged
*   @exports: app.collections.Stat_entries_paged
*/
define("app/collections/Stat_entries_paged",["require","app","app/models"],function(require,app) {
  var Stat_entryModel = require("app/models/stat_entry");

  var Stat_entries_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/stat_entries/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Stat_entryModel
      });

  module.setExports(Stat_entries_paged);
});
/*! app/collections/stat_logs
* 	@requires: app,app/models/stat_log
* 	@extends: app.Collection
* 	@exports: app.collections.Stat_logs
*/
define("app/collections/stat_logs",["require","app","app/models"],function(require,app) {
	var Stat_logModel = require("app/models/stat_log");

	var Stat_logs = app.Collection.extend({
		url: '/stat_logs/',
		model: Stat_logModel
	});

	module.setExports(Stat_logs);
});
/*! app/collections/stat_logs_paged
*   @requires: app,app/models/stat_log
*   @extends: app.Collection_paged
*   @exports: app.collections.Stat_logs_paged
*/
define("app/collections/Stat_logs_paged",["require","app","app/models"],function(require,app) {
  var Stat_logModel = require("app/models/stat_log");

  var Stat_logs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/stat_logs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Stat_logModel
      });

  module.setExports(Stat_logs_paged);
});
/*! app/collections/subscriptions
* 	@requires: app,app/models/subscription
* 	@extends: app.Collection
* 	@exports: app.collections.Subscriptions
*/
define("app/collections/subscriptions",["require","app","app/models"],function(require,app) {
	var SubscriptionModel = require("app/models/subscription");

	var Subscriptions = app.Collection.extend({
		url: '/subscriptions/',
		model: SubscriptionModel
	});

	module.setExports(Subscriptions);
});
/*! app/collections/subscriptions_paged
*   @requires: app,app/models/subscription
*   @extends: app.Collection_paged
*   @exports: app.collections.Subscriptions_paged
*/
define("app/collections/Subscriptions_paged",["require","app","app/models"],function(require,app) {
  var SubscriptionModel = require("app/models/subscription");

  var Subscriptions_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/subscriptions/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: SubscriptionModel
      });

  module.setExports(Subscriptions_paged);
});
/*! app/collections/sys_activityroles
* 	@requires: app,app/models/sys_activityrole
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activityroles
*/
define("app/collections/sys_activityroles",["require","app","app/models"],function(require,app) {
	var Sys_activityroleModel = require("app/models/sys_activityrole");

	var Sys_activityroles = app.Collection.extend({
		url: '/sys_activityroles/',
		model: Sys_activityroleModel
	});

	module.setExports(Sys_activityroles);
});
/*! app/collections/sys_activityroles_paged
*   @requires: app,app/models/sys_activityrole
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_activityroles_paged
*/
define("app/collections/Sys_activityroles_paged",["require","app","app/models"],function(require,app) {
  var Sys_activityroleModel = require("app/models/sys_activityrole");

  var Sys_activityroles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_activityroles/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_activityroleModel
      });

  module.setExports(Sys_activityroles_paged);
});
/*! app/collections/sys_activitysteptypes
* 	@requires: app,app/models/sys_activitysteptype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activitysteptypes
*/
define("app/collections/sys_activitysteptypes",["require","app","app/models"],function(require,app) {
	var Sys_activitysteptypeModel = require("app/models/sys_activitysteptype");

	var Sys_activitysteptypes = app.Collection.extend({
		url: '/sys_activitysteptypes/',
		model: Sys_activitysteptypeModel
	});

	module.setExports(Sys_activitysteptypes);
});
/*! app/collections/sys_activitysteptypes_paged
*   @requires: app,app/models/sys_activitysteptype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_activitysteptypes_paged
*/
define("app/collections/Sys_activitysteptypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_activitysteptypeModel = require("app/models/sys_activitysteptype");

  var Sys_activitysteptypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_activitysteptypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_activitysteptypeModel
      });

  module.setExports(Sys_activitysteptypes_paged);
});
/*! app/collections/sys_activitytypes
* 	@requires: app,app/models/sys_activitytype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_activitytypes
*/
define("app/collections/sys_activitytypes",["require","app","app/models"],function(require,app) {
	var Sys_activitytypeModel = require("app/models/sys_activitytype");

	var Sys_activitytypes = app.Collection.extend({
		url: '/sys_activitytypes/',
		model: Sys_activitytypeModel
	});

	module.setExports(Sys_activitytypes);
});
/*! app/collections/sys_activitytypes_paged
*   @requires: app,app/models/sys_activitytype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_activitytypes_paged
*/
define("app/collections/Sys_activitytypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_activitytypeModel = require("app/models/sys_activitytype");

  var Sys_activitytypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_activitytypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_activitytypeModel
      });

  module.setExports(Sys_activitytypes_paged);
});
/*! app/collections/sys_addresstypes
* 	@requires: app,app/models/sys_addresstype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_addresstypes
*/
define("app/collections/sys_addresstypes",["require","app","app/models"],function(require,app) {
	var Sys_addresstypeModel = require("app/models/sys_addresstype");

	var Sys_addresstypes = app.Collection.extend({
		url: '/sys_addresstypes/',
		model: Sys_addresstypeModel
	});

	module.setExports(Sys_addresstypes);
});
/*! app/collections/sys_addresstypes_paged
*   @requires: app,app/models/sys_addresstype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_addresstypes_paged
*/
define("app/collections/Sys_addresstypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_addresstypeModel = require("app/models/sys_addresstype");

  var Sys_addresstypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_addresstypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_addresstypeModel
      });

  module.setExports(Sys_addresstypes_paged);
});
/*! app/collections/sys_apiclients
* 	@requires: app,app/models/sys_apiclient
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_apiclients
*/
define("app/collections/sys_apiclients",["require","app","app/models"],function(require,app) {
	var Sys_apiclientModel = require("app/models/sys_apiclient");

	var Sys_apiclients = app.Collection.extend({
		url: '/sys_apiclients/',
		model: Sys_apiclientModel
	});

	module.setExports(Sys_apiclients);
});
/*! app/collections/sys_apiclients_paged
*   @requires: app,app/models/sys_apiclient
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_apiclients_paged
*/
define("app/collections/Sys_apiclients_paged",["require","app","app/models"],function(require,app) {
  var Sys_apiclientModel = require("app/models/sys_apiclient");

  var Sys_apiclients_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_apiclients/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_apiclientModel
      });

  module.setExports(Sys_apiclients_paged);
});
/*! app/collections/sys_assessquestiontypes
* 	@requires: app,app/models/sys_assessquestiontype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assessquestiontypes
*/
define("app/collections/sys_assessquestiontypes",["require","app","app/models"],function(require,app) {
	var Sys_assessquestiontypeModel = require("app/models/sys_assessquestiontype");

	var Sys_assessquestiontypes = app.Collection.extend({
		url: '/sys_assessquestiontypes/',
		model: Sys_assessquestiontypeModel
	});

	module.setExports(Sys_assessquestiontypes);
});
/*! app/collections/sys_assessquestiontypes_paged
*   @requires: app,app/models/sys_assessquestiontype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_assessquestiontypes_paged
*/
define("app/collections/Sys_assessquestiontypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_assessquestiontypeModel = require("app/models/sys_assessquestiontype");

  var Sys_assessquestiontypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_assessquestiontypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_assessquestiontypeModel
      });

  module.setExports(Sys_assessquestiontypes_paged);
});
/*! app/collections/sys_assessresultstatuses
* 	@requires: app,app/models/sys_assessresultstatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assessresultstatuses
*/
define("app/collections/sys_assessresultstatuses",["require","app","app/models"],function(require,app) {
	var Sys_assessresultstatuModel = require("app/models/sys_assessresultstatu");

	var Sys_assessresultstatuses = app.Collection.extend({
		url: '/sys_assessresultstatuses/',
		model: Sys_assessresultstatuModel
	});

	module.setExports(Sys_assessresultstatuses);
});
/*! app/collections/sys_assessresultstatuses_paged
*   @requires: app,app/models/sys_assessresultstatu
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_assessresultstatuses_paged
*/
define("app/collections/Sys_assessresultstatuses_paged",["require","app","app/models"],function(require,app) {
  var Sys_assessresultstatuModel = require("app/models/sys_assessresultstatu");

  var Sys_assessresultstatuses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_assessresultstatuses/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_assessresultstatuModel
      });

  module.setExports(Sys_assessresultstatuses_paged);
});
/*! app/collections/sys_assesstypes
* 	@requires: app,app/models/sys_assesstype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_assesstypes
*/
define("app/collections/sys_assesstypes",["require","app","app/models"],function(require,app) {
	var Sys_assesstypeModel = require("app/models/sys_assesstype");

	var Sys_assesstypes = app.Collection.extend({
		url: '/sys_assesstypes/',
		model: Sys_assesstypeModel
	});

	module.setExports(Sys_assesstypes);
});
/*! app/collections/sys_assesstypes_paged
*   @requires: app,app/models/sys_assesstype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_assesstypes_paged
*/
define("app/collections/Sys_assesstypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_assesstypeModel = require("app/models/sys_assesstype");

  var Sys_assesstypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_assesstypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_assesstypeModel
      });

  module.setExports(Sys_assesstypes_paged);
});
/*! app/collections/sys_attendeestatuses
* 	@requires: app,app/models/sys_attendeestatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_attendeestatuses
*/
define("app/collections/sys_attendeestatuses",["require","app","app/models"],function(require,app) {
	var Sys_attendeestatuModel = require("app/models/sys_attendeestatu");

	var Sys_attendeestatuses = app.Collection.extend({
		url: '/sys_attendeestatuses/',
		model: Sys_attendeestatuModel
	});

	module.setExports(Sys_attendeestatuses);
});
/*! app/collections/sys_attendeestatuses_paged
*   @requires: app,app/models/sys_attendeestatu
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_attendeestatuses_paged
*/
define("app/collections/Sys_attendeestatuses_paged",["require","app","app/models"],function(require,app) {
  var Sys_attendeestatuModel = require("app/models/sys_attendeestatu");

  var Sys_attendeestatuses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_attendeestatuses/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_attendeestatuModel
      });

  module.setExports(Sys_attendeestatuses_paged);
});
/*! app/collections/sys_categorylms
* 	@requires: app,app/models/sys_categorylm
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_categorylms
*/
define("app/collections/sys_categorylms",["require","app","app/models"],function(require,app) {
	var Sys_categorylmModel = require("app/models/sys_categorylm");

	var Sys_categorylms = app.Collection.extend({
		url: '/sys_categorylms/',
		model: Sys_categorylmModel
	});

	module.setExports(Sys_categorylms);
});
/*! app/collections/sys_categorylms_paged
*   @requires: app,app/models/sys_categorylm
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_categorylms_paged
*/
define("app/collections/Sys_categorylms_paged",["require","app","app/models"],function(require,app) {
  var Sys_categorylmModel = require("app/models/sys_categorylm");

  var Sys_categorylms_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_categorylms/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_categorylmModel
      });

  module.setExports(Sys_categorylms_paged);
});
/*! app/collections/sys_cbafunds
* 	@requires: app,app/models/sys_cbafund
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_cbafunds
*/
define("app/collections/sys_cbafunds",["require","app","app/models"],function(require,app) {
	var Sys_cbafundModel = require("app/models/sys_cbafund");

	var Sys_cbafunds = app.Collection.extend({
		url: '/sys_cbafunds/',
		model: Sys_cbafundModel
	});

	module.setExports(Sys_cbafunds);
});
/*! app/collections/sys_cbafunds_paged
*   @requires: app,app/models/sys_cbafund
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_cbafunds_paged
*/
define("app/collections/Sys_cbafunds_paged",["require","app","app/models"],function(require,app) {
  var Sys_cbafundModel = require("app/models/sys_cbafund");

  var Sys_cbafunds_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_cbafunds/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_cbafundModel
      });

  module.setExports(Sys_cbafunds_paged);
});
/*! app/collections/sys_cbofunds
* 	@requires: app,app/models/sys_cbofund
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_cbofunds
*/
define("app/collections/sys_cbofunds",["require","app","app/models"],function(require,app) {
	var Sys_cbofundModel = require("app/models/sys_cbofund");

	var Sys_cbofunds = app.Collection.extend({
		url: '/sys_cbofunds/',
		model: Sys_cbofundModel
	});

	module.setExports(Sys_cbofunds);
});
/*! app/collections/sys_cbofunds_paged
*   @requires: app,app/models/sys_cbofund
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_cbofunds_paged
*/
define("app/collections/Sys_cbofunds_paged",["require","app","app/models"],function(require,app) {
  var Sys_cbofundModel = require("app/models/sys_cbofund");

  var Sys_cbofunds_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_cbofunds/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_cbofundModel
      });

  module.setExports(Sys_cbofunds_paged);
});
/*! app/collections/sys_components
* 	@requires: app,app/models/sys_component
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_components
*/
define("app/collections/sys_components",["require","app","app/models"],function(require,app) {
	var Sys_componentModel = require("app/models/sys_component");

	var Sys_components = app.Collection.extend({
		url: '/sys_components/',
		model: Sys_componentModel
	});

	module.setExports(Sys_components);
});
/*! app/collections/sys_components_paged
*   @requires: app,app/models/sys_component
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_components_paged
*/
define("app/collections/Sys_components_paged",["require","app","app/models"],function(require,app) {
  var Sys_componentModel = require("app/models/sys_component");

  var Sys_components_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_components/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_componentModel
      });

  module.setExports(Sys_components_paged);
});
/*! app/collections/sys_countries
* 	@requires: app,app/models/sys_country
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_countries
*/
define("app/collections/sys_countries",["require","app","app/models"],function(require,app) {
	var Sys_countryModel = require("app/models/sys_country");

	var Sys_countries = app.Collection.extend({
		url: '/sys_countries/',
		model: Sys_countryModel
	});

	module.setExports(Sys_countries);
});
/*! app/collections/sys_countries_paged
*   @requires: app,app/models/sys_country
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_countries_paged
*/
define("app/collections/Sys_countries_paged",["require","app","app/models"],function(require,app) {
  var Sys_countryModel = require("app/models/sys_country");

  var Sys_countries_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_countries/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_countryModel
      });

  module.setExports(Sys_countries_paged);
});
/*! app/collections/sys_credits
* 	@requires: app,app/models/sys_credit
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_credits
*/
define("app/collections/sys_credits",["require","app","app/models"],function(require,app) {
	var Sys_creditModel = require("app/models/sys_credit");

	var Sys_credits = app.Collection.extend({
		url: '/sys_credits/',
		model: Sys_creditModel
	});

	module.setExports(Sys_credits);
});
/*! app/collections/sys_credits_paged
*   @requires: app,app/models/sys_credit
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_credits_paged
*/
define("app/collections/Sys_credits_paged",["require","app","app/models"],function(require,app) {
  var Sys_creditModel = require("app/models/sys_credit");

  var Sys_credits_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_credits/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_creditModel
      });

  module.setExports(Sys_credits_paged);
});
/*! app/collections/sys_degrees
* 	@requires: app,app/models/sys_degree
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_degrees
*/
define("app/collections/sys_degrees",["require","app","app/models"],function(require,app) {
	var Sys_degreeModel = require("app/models/sys_degree");

	var Sys_degrees = app.Collection.extend({
		url: '/sys_degrees/',
		model: Sys_degreeModel
	});

	module.setExports(Sys_degrees);
});
/*! app/collections/sys_degrees_paged
*   @requires: app,app/models/sys_degree
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_degrees_paged
*/
define("app/collections/Sys_degrees_paged",["require","app","app/models"],function(require,app) {
  var Sys_degreeModel = require("app/models/sys_degree");

  var Sys_degrees_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_degrees/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_degreeModel
      });

  module.setExports(Sys_degrees_paged);
});
/*! app/collections/sys_emailstyles
* 	@requires: app,app/models/sys_emailstyle
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_emailstyles
*/
define("app/collections/sys_emailstyles",["require","app","app/models"],function(require,app) {
	var Sys_emailstyleModel = require("app/models/sys_emailstyle");

	var Sys_emailstyles = app.Collection.extend({
		url: '/sys_emailstyles/',
		model: Sys_emailstyleModel
	});

	module.setExports(Sys_emailstyles);
});
/*! app/collections/sys_emailstyles_paged
*   @requires: app,app/models/sys_emailstyle
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_emailstyles_paged
*/
define("app/collections/Sys_emailstyles_paged",["require","app","app/models"],function(require,app) {
  var Sys_emailstyleModel = require("app/models/sys_emailstyle");

  var Sys_emailstyles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_emailstyles/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_emailstyleModel
      });

  module.setExports(Sys_emailstyles_paged);
});
/*! app/collections/sys_entrytypes
* 	@requires: app,app/models/sys_entrytype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_entrytypes
*/
define("app/collections/sys_entrytypes",["require","app","app/models"],function(require,app) {
	var Sys_entrytypeModel = require("app/models/sys_entrytype");

	var Sys_entrytypes = app.Collection.extend({
		url: '/sys_entrytypes/',
		model: Sys_entrytypeModel
	});

	module.setExports(Sys_entrytypes);
});
/*! app/collections/sys_entrytypes_paged
*   @requires: app,app/models/sys_entrytype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_entrytypes_paged
*/
define("app/collections/Sys_entrytypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_entrytypeModel = require("app/models/sys_entrytype");

  var Sys_entrytypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_entrytypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_entrytypeModel
      });

  module.setExports(Sys_entrytypes_paged);
});
/*! app/collections/sys_ethnicities
* 	@requires: app,app/models/sys_ethnicity
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_ethnicities
*/
define("app/collections/sys_ethnicities",["require","app","app/models"],function(require,app) {
	var Sys_ethnicityModel = require("app/models/sys_ethnicity");

	var Sys_ethnicities = app.Collection.extend({
		url: '/sys_ethnicities/',
		model: Sys_ethnicityModel
	});

	module.setExports(Sys_ethnicities);
});
/*! app/collections/sys_ethnicities_paged
*   @requires: app,app/models/sys_ethnicity
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_ethnicities_paged
*/
define("app/collections/Sys_ethnicities_paged",["require","app","app/models"],function(require,app) {
  var Sys_ethnicityModel = require("app/models/sys_ethnicity");

  var Sys_ethnicities_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_ethnicities/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_ethnicityModel
      });

  module.setExports(Sys_ethnicities_paged);
});
/*! app/collections/sys_filetypes
* 	@requires: app,app/models/sys_filetype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_filetypes
*/
define("app/collections/sys_filetypes",["require","app","app/models"],function(require,app) {
	var Sys_filetypeModel = require("app/models/sys_filetype");

	var Sys_filetypes = app.Collection.extend({
		url: '/sys_filetypes/',
		model: Sys_filetypeModel
	});

	module.setExports(Sys_filetypes);
});
/*! app/collections/sys_filetypes_paged
*   @requires: app,app/models/sys_filetype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_filetypes_paged
*/
define("app/collections/Sys_filetypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_filetypeModel = require("app/models/sys_filetype");

  var Sys_filetypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_filetypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_filetypeModel
      });

  module.setExports(Sys_filetypes_paged);
});
/*! app/collections/sys_funrcs
* 	@requires: app,app/models/sys_funrc
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_funrcs
*/
define("app/collections/sys_funrcs",["require","app","app/models"],function(require,app) {
	var Sys_funrcModel = require("app/models/sys_funrc");

	var Sys_funrcs = app.Collection.extend({
		url: '/sys_funrcs/',
		model: Sys_funrcModel
	});

	module.setExports(Sys_funrcs);
});
/*! app/collections/sys_funrcs_paged
*   @requires: app,app/models/sys_funrc
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_funrcs_paged
*/
define("app/collections/Sys_funrcs_paged",["require","app","app/models"],function(require,app) {
  var Sys_funrcModel = require("app/models/sys_funrc");

  var Sys_funrcs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_funrcs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_funrcModel
      });

  module.setExports(Sys_funrcs_paged);
});
/*! app/collections/sys_funrns
* 	@requires: app,app/models/sys_funrn
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_funrns
*/
define("app/collections/sys_funrns",["require","app","app/models"],function(require,app) {
	var Sys_funrnModel = require("app/models/sys_funrn");

	var Sys_funrns = app.Collection.extend({
		url: '/sys_funrns/',
		model: Sys_funrnModel
	});

	module.setExports(Sys_funrns);
});
/*! app/collections/sys_funrns_paged
*   @requires: app,app/models/sys_funrn
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_funrns_paged
*/
define("app/collections/Sys_funrns_paged",["require","app","app/models"],function(require,app) {
  var Sys_funrnModel = require("app/models/sys_funrn");

  var Sys_funrns_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_funrns/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_funrnModel
      });

  module.setExports(Sys_funrns_paged);
});
/*! app/collections/sys_groupings
* 	@requires: app,app/models/sys_grouping
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_groupings
*/
define("app/collections/sys_groupings",["require","app","app/models"],function(require,app) {
	var Sys_groupingModel = require("app/models/sys_grouping");

	var Sys_groupings = app.Collection.extend({
		url: '/sys_groupings/',
		model: Sys_groupingModel
	});

	module.setExports(Sys_groupings);
});
/*! app/collections/sys_groupings_paged
*   @requires: app,app/models/sys_grouping
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_groupings_paged
*/
define("app/collections/Sys_groupings_paged",["require","app","app/models"],function(require,app) {
  var Sys_groupingModel = require("app/models/sys_grouping");

  var Sys_groupings_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_groupings/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_groupingModel
      });

  module.setExports(Sys_groupings_paged);
});
/*! app/collections/sys_grouptypes
* 	@requires: app,app/models/sys_grouptype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_grouptypes
*/
define("app/collections/sys_grouptypes",["require","app","app/models"],function(require,app) {
	var Sys_grouptypeModel = require("app/models/sys_grouptype");

	var Sys_grouptypes = app.Collection.extend({
		url: '/sys_grouptypes/',
		model: Sys_grouptypeModel
	});

	module.setExports(Sys_grouptypes);
});
/*! app/collections/sys_grouptypes_paged
*   @requires: app,app/models/sys_grouptype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_grouptypes_paged
*/
define("app/collections/Sys_grouptypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_grouptypeModel = require("app/models/sys_grouptype");

  var Sys_grouptypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_grouptypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_grouptypeModel
      });

  module.setExports(Sys_grouptypes_paged);
});
/*! app/collections/sys_historystyles
* 	@requires: app,app/models/sys_historystyle
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_historystyles
*/
define("app/collections/sys_historystyles",["require","app","app/models"],function(require,app) {
	var Sys_historystyleModel = require("app/models/sys_historystyle");

	var Sys_historystyles = app.Collection.extend({
		url: '/sys_historystyles/',
		model: Sys_historystyleModel
	});

	module.setExports(Sys_historystyles);
});
/*! app/collections/sys_historystyles_paged
*   @requires: app,app/models/sys_historystyle
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_historystyles_paged
*/
define("app/collections/Sys_historystyles_paged",["require","app","app/models"],function(require,app) {
  var Sys_historystyleModel = require("app/models/sys_historystyle");

  var Sys_historystyles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_historystyles/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_historystyleModel
      });

  module.setExports(Sys_historystyles_paged);
});
/*! app/collections/sys_historytypes
* 	@requires: app,app/models/sys_historytype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_historytypes
*/
define("app/collections/sys_historytypes",["require","app","app/models"],function(require,app) {
	var Sys_historytypeModel = require("app/models/sys_historytype");

	var Sys_historytypes = app.Collection.extend({
		url: '/sys_historytypes/',
		model: Sys_historytypeModel
	});

	module.setExports(Sys_historytypes);
});
/*! app/collections/sys_historytypes_paged
*   @requires: app,app/models/sys_historytype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_historytypes_paged
*/
define("app/collections/Sys_historytypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_historytypeModel = require("app/models/sys_historytype");

  var Sys_historytypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_historytypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_historytypeModel
      });

  module.setExports(Sys_historytypes_paged);
});
/*! app/collections/sys_markets
* 	@requires: app,app/models/sys_market
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_markets
*/
define("app/collections/sys_markets",["require","app","app/models"],function(require,app) {
	var Sys_marketModel = require("app/models/sys_market");

	var Sys_markets = app.Collection.extend({
		url: '/sys_markets/',
		model: Sys_marketModel
	});

	module.setExports(Sys_markets);
});
/*! app/collections/sys_markets_paged
*   @requires: app,app/models/sys_market
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_markets_paged
*/
define("app/collections/Sys_markets_paged",["require","app","app/models"],function(require,app) {
  var Sys_marketModel = require("app/models/sys_market");

  var Sys_markets_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_markets/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_marketModel
      });

  module.setExports(Sys_markets_paged);
});
/*! app/collections/sys_occclasses
* 	@requires: app,app/models/sys_occclass
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_occclasses
*/
define("app/collections/sys_occclasses",["require","app","app/models"],function(require,app) {
	var Sys_occclassModel = require("app/models/sys_occclass");

	var Sys_occclasses = app.Collection.extend({
		url: '/sys_occclasses/',
		model: Sys_occclassModel
	});

	module.setExports(Sys_occclasses);
});
/*! app/collections/sys_occclasses_paged
*   @requires: app,app/models/sys_occclass
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_occclasses_paged
*/
define("app/collections/Sys_occclasses_paged",["require","app","app/models"],function(require,app) {
  var Sys_occclassModel = require("app/models/sys_occclass");

  var Sys_occclasses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_occclasses/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_occclassModel
      });

  module.setExports(Sys_occclasses_paged);
});
/*! app/collections/sys_orgtypes
* 	@requires: app,app/models/sys_orgtype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_orgtypes
*/
define("app/collections/sys_orgtypes",["require","app","app/models"],function(require,app) {
	var Sys_orgtypeModel = require("app/models/sys_orgtype");

	var Sys_orgtypes = app.Collection.extend({
		url: '/sys_orgtypes/',
		model: Sys_orgtypeModel
	});

	module.setExports(Sys_orgtypes);
});
/*! app/collections/sys_orgtypes_paged
*   @requires: app,app/models/sys_orgtype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_orgtypes_paged
*/
define("app/collections/Sys_orgtypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_orgtypeModel = require("app/models/sys_orgtype");

  var Sys_orgtypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_orgtypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_orgtypeModel
      });

  module.setExports(Sys_orgtypes_paged);
});
/*! app/collections/sys_personstatuses
* 	@requires: app,app/models/sys_personstatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_personstatuses
*/
define("app/collections/sys_personstatuses",["require","app","app/models"],function(require,app) {
	var Sys_personstatuModel = require("app/models/sys_personstatu");

	var Sys_personstatuses = app.Collection.extend({
		url: '/sys_personstatuses/',
		model: Sys_personstatuModel
	});

	module.setExports(Sys_personstatuses);
});
/*! app/collections/sys_personstatuses_paged
*   @requires: app,app/models/sys_personstatu
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_personstatuses_paged
*/
define("app/collections/Sys_personstatuses_paged",["require","app","app/models"],function(require,app) {
  var Sys_personstatuModel = require("app/models/sys_personstatu");

  var Sys_personstatuses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_personstatuses/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_personstatuModel
      });

  module.setExports(Sys_personstatuses_paged);
});
/*! app/collections/sys_prinemps
* 	@requires: app,app/models/sys_prinemp
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_prinemps
*/
define("app/collections/sys_prinemps",["require","app","app/models"],function(require,app) {
	var Sys_prinempModel = require("app/models/sys_prinemp");

	var Sys_prinemps = app.Collection.extend({
		url: '/sys_prinemps/',
		model: Sys_prinempModel
	});

	module.setExports(Sys_prinemps);
});
/*! app/collections/sys_prinemps_paged
*   @requires: app,app/models/sys_prinemp
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_prinemps_paged
*/
define("app/collections/Sys_prinemps_paged",["require","app","app/models"],function(require,app) {
  var Sys_prinempModel = require("app/models/sys_prinemp");

  var Sys_prinemps_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_prinemps/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_prinempModel
      });

  module.setExports(Sys_prinemps_paged);
});
/*! app/collections/sys_profcs
* 	@requires: app,app/models/sys_profc
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_profcs
*/
define("app/collections/sys_profcs",["require","app","app/models"],function(require,app) {
	var Sys_profcModel = require("app/models/sys_profc");

	var Sys_profcs = app.Collection.extend({
		url: '/sys_profcs/',
		model: Sys_profcModel
	});

	module.setExports(Sys_profcs);
});
/*! app/collections/sys_profcs_paged
*   @requires: app,app/models/sys_profc
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_profcs_paged
*/
define("app/collections/Sys_profcs_paged",["require","app","app/models"],function(require,app) {
  var Sys_profcModel = require("app/models/sys_profc");

  var Sys_profcs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_profcs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_profcModel
      });

  module.setExports(Sys_profcs_paged);
});
/*! app/collections/sys_profns
* 	@requires: app,app/models/sys_profn
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_profns
*/
define("app/collections/sys_profns",["require","app","app/models"],function(require,app) {
	var Sys_profnModel = require("app/models/sys_profn");

	var Sys_profns = app.Collection.extend({
		url: '/sys_profns/',
		model: Sys_profnModel
	});

	module.setExports(Sys_profns);
});
/*! app/collections/sys_profns_paged
*   @requires: app,app/models/sys_profn
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_profns_paged
*/
define("app/collections/Sys_profns_paged",["require","app","app/models"],function(require,app) {
  var Sys_profnModel = require("app/models/sys_profn");

  var Sys_profns_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_profns/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_profnModel
      });

  module.setExports(Sys_profns_paged);
});
/*! app/collections/sys_projecttypes
* 	@requires: app,app/models/sys_projecttype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_projecttypes
*/
define("app/collections/sys_projecttypes",["require","app","app/models"],function(require,app) {
	var Sys_projecttypeModel = require("app/models/sys_projecttype");

	var Sys_projecttypes = app.Collection.extend({
		url: '/sys_projecttypes/',
		model: Sys_projecttypeModel
	});

	module.setExports(Sys_projecttypes);
});
/*! app/collections/sys_projecttypes_paged
*   @requires: app,app/models/sys_projecttype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_projecttypes_paged
*/
define("app/collections/Sys_projecttypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_projecttypeModel = require("app/models/sys_projecttype");

  var Sys_projecttypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_projecttypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_projecttypeModel
      });

  module.setExports(Sys_projecttypes_paged);
});
/*! app/collections/sys_reports
* 	@requires: app,app/models/sys_report
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_reports
*/
define("app/collections/sys_reports",["require","app","app/models"],function(require,app) {
	var Sys_reportModel = require("app/models/sys_report");

	var Sys_reports = app.Collection.extend({
		url: '/sys_reports/',
		model: Sys_reportModel
	});

	module.setExports(Sys_reports);
});
/*! app/collections/sys_reports_paged
*   @requires: app,app/models/sys_report
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_reports_paged
*/
define("app/collections/Sys_reports_paged",["require","app","app/models"],function(require,app) {
  var Sys_reportModel = require("app/models/sys_report");

  var Sys_reports_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_reports/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_reportModel
      });

  module.setExports(Sys_reports_paged);
});
/*! app/collections/sys_roles
* 	@requires: app,app/models/sys_role
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_roles
*/
define("app/collections/sys_roles",["require","app","app/models"],function(require,app) {
	var Sys_roleModel = require("app/models/sys_role");

	var Sys_roles = app.Collection.extend({
		url: '/sys_roles/',
		model: Sys_roleModel
	});

	module.setExports(Sys_roles);
});
/*! app/collections/sys_roles_paged
*   @requires: app,app/models/sys_role
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_roles_paged
*/
define("app/collections/Sys_roles_paged",["require","app","app/models"],function(require,app) {
  var Sys_roleModel = require("app/models/sys_role");

  var Sys_roles_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_roles/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_roleModel
      });

  module.setExports(Sys_roles_paged);
});
/*! app/collections/sys_sitelms
* 	@requires: app,app/models/sys_sitelm
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_sitelms
*/
define("app/collections/sys_sitelms",["require","app","app/models"],function(require,app) {
	var Sys_sitelmModel = require("app/models/sys_sitelm");

	var Sys_sitelms = app.Collection.extend({
		url: '/sys_sitelms/',
		model: Sys_sitelmModel
	});

	module.setExports(Sys_sitelms);
});
/*! app/collections/sys_sitelms_paged
*   @requires: app,app/models/sys_sitelm
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_sitelms_paged
*/
define("app/collections/Sys_sitelms_paged",["require","app","app/models"],function(require,app) {
  var Sys_sitelmModel = require("app/models/sys_sitelm");

  var Sys_sitelms_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_sitelms/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_sitelmModel
      });

  module.setExports(Sys_sitelms_paged);
});
/*! app/collections/sys_specialtylms
* 	@requires: app,app/models/sys_specialtylm
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_specialtylms
*/
define("app/collections/sys_specialtylms",["require","app","app/models"],function(require,app) {
	var Sys_specialtylmModel = require("app/models/sys_specialtylm");

	var Sys_specialtylms = app.Collection.extend({
		url: '/sys_specialtylms/',
		model: Sys_specialtylmModel
	});

	module.setExports(Sys_specialtylms);
});
/*! app/collections/sys_specialtylms_paged
*   @requires: app,app/models/sys_specialtylm
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_specialtylms_paged
*/
define("app/collections/Sys_specialtylms_paged",["require","app","app/models"],function(require,app) {
  var Sys_specialtylmModel = require("app/models/sys_specialtylm");

  var Sys_specialtylms_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_specialtylms/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_specialtylmModel
      });

  module.setExports(Sys_specialtylms_paged);
});
/*! app/collections/sys_stat_log_types
* 	@requires: app,app/models/sys_stat_log_type
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stat_log_types
*/
define("app/collections/sys_stat_log_types",["require","app","app/models"],function(require,app) {
	var Sys_stat_log_typeModel = require("app/models/sys_stat_log_type");

	var Sys_stat_log_types = app.Collection.extend({
		url: '/sys_stat_log_types/',
		model: Sys_stat_log_typeModel
	});

	module.setExports(Sys_stat_log_types);
});
/*! app/collections/sys_stat_log_types_paged
*   @requires: app,app/models/sys_stat_log_type
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_stat_log_types_paged
*/
define("app/collections/Sys_stat_log_types_paged",["require","app","app/models"],function(require,app) {
  var Sys_stat_log_typeModel = require("app/models/sys_stat_log_type");

  var Sys_stat_log_types_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_stat_log_types/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_stat_log_typeModel
      });

  module.setExports(Sys_stat_log_types_paged);
});
/*! app/collections/sys_stat_types
* 	@requires: app,app/models/sys_stat_type
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stat_types
*/
define("app/collections/sys_stat_types",["require","app","app/models"],function(require,app) {
	var Sys_stat_typeModel = require("app/models/sys_stat_type");

	var Sys_stat_types = app.Collection.extend({
		url: '/sys_stat_types/',
		model: Sys_stat_typeModel
	});

	module.setExports(Sys_stat_types);
});
/*! app/collections/sys_stat_types_paged
*   @requires: app,app/models/sys_stat_type
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_stat_types_paged
*/
define("app/collections/Sys_stat_types_paged",["require","app","app/models"],function(require,app) {
  var Sys_stat_typeModel = require("app/models/sys_stat_type");

  var Sys_stat_types_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_stat_types/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_stat_typeModel
      });

  module.setExports(Sys_stat_types_paged);
});
/*! app/collections/sys_states
* 	@requires: app,app/models/sys_state
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_states
*/
define("app/collections/sys_states",["require","app","app/models"],function(require,app) {
	var Sys_stateModel = require("app/models/sys_state");

	var Sys_states = app.Collection.extend({
		url: '/sys_states/',
		model: Sys_stateModel
	});

	module.setExports(Sys_states);
});
/*! app/collections/sys_states_paged
*   @requires: app,app/models/sys_state
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_states_paged
*/
define("app/collections/Sys_states_paged",["require","app","app/models"],function(require,app) {
  var Sys_stateModel = require("app/models/sys_state");

  var Sys_states_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_states/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_stateModel
      });

  module.setExports(Sys_states_paged);
});
/*! app/collections/sys_statuses
* 	@requires: app,app/models/sys_statu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_statuses
*/
define("app/collections/sys_statuses",["require","app","app/models"],function(require,app) {
	var Sys_statuModel = require("app/models/sys_statu");

	var Sys_statuses = app.Collection.extend({
		url: '/sys_statuses/',
		model: Sys_statuModel
	});

	module.setExports(Sys_statuses);
});
/*! app/collections/sys_statuses_paged
*   @requires: app,app/models/sys_statu
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_statuses_paged
*/
define("app/collections/Sys_statuses_paged",["require","app","app/models"],function(require,app) {
  var Sys_statuModel = require("app/models/sys_statu");

  var Sys_statuses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_statuses/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_statuModel
      });

  module.setExports(Sys_statuses_paged);
});
/*! app/collections/sys_stepstatuses
* 	@requires: app,app/models/sys_stepstatu
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_stepstatuses
*/
define("app/collections/sys_stepstatuses",["require","app","app/models"],function(require,app) {
	var Sys_stepstatuModel = require("app/models/sys_stepstatu");

	var Sys_stepstatuses = app.Collection.extend({
		url: '/sys_stepstatuses/',
		model: Sys_stepstatuModel
	});

	module.setExports(Sys_stepstatuses);
});
/*! app/collections/sys_stepstatuses_paged
*   @requires: app,app/models/sys_stepstatu
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_stepstatuses_paged
*/
define("app/collections/Sys_stepstatuses_paged",["require","app","app/models"],function(require,app) {
  var Sys_stepstatuModel = require("app/models/sys_stepstatu");

  var Sys_stepstatuses_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_stepstatuses/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_stepstatuModel
      });

  module.setExports(Sys_stepstatuses_paged);
});
/*! app/collections/sys_subscriptiontypes
* 	@requires: app,app/models/sys_subscriptiontype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_subscriptiontypes
*/
define("app/collections/sys_subscriptiontypes",["require","app","app/models"],function(require,app) {
	var Sys_subscriptiontypeModel = require("app/models/sys_subscriptiontype");

	var Sys_subscriptiontypes = app.Collection.extend({
		url: '/sys_subscriptiontypes/',
		model: Sys_subscriptiontypeModel
	});

	module.setExports(Sys_subscriptiontypes);
});
/*! app/collections/sys_subscriptiontypes_paged
*   @requires: app,app/models/sys_subscriptiontype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_subscriptiontypes_paged
*/
define("app/collections/Sys_subscriptiontypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_subscriptiontypeModel = require("app/models/sys_subscriptiontype");

  var Sys_subscriptiontypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_subscriptiontypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_subscriptiontypeModel
      });

  module.setExports(Sys_subscriptiontypes_paged);
});
/*! app/collections/sys_supporters
* 	@requires: app,app/models/sys_supporter
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_supporters
*/
define("app/collections/sys_supporters",["require","app","app/models"],function(require,app) {
	var Sys_supporterModel = require("app/models/sys_supporter");

	var Sys_supporters = app.Collection.extend({
		url: '/sys_supporters/',
		model: Sys_supporterModel
	});

	module.setExports(Sys_supporters);
});
/*! app/collections/sys_supporters_paged
*   @requires: app,app/models/sys_supporter
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_supporters_paged
*/
define("app/collections/Sys_supporters_paged",["require","app","app/models"],function(require,app) {
  var Sys_supporterModel = require("app/models/sys_supporter");

  var Sys_supporters_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_supporters/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_supporterModel
      });

  module.setExports(Sys_supporters_paged);
});
/*! app/collections/sys_supporttypes
* 	@requires: app,app/models/sys_supporttype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_supporttypes
*/
define("app/collections/sys_supporttypes",["require","app","app/models"],function(require,app) {
	var Sys_supporttypeModel = require("app/models/sys_supporttype");

	var Sys_supporttypes = app.Collection.extend({
		url: '/sys_supporttypes/',
		model: Sys_supporttypeModel
	});

	module.setExports(Sys_supporttypes);
});
/*! app/collections/sys_supporttypes_paged
*   @requires: app,app/models/sys_supporttype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_supporttypes_paged
*/
define("app/collections/Sys_supporttypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_supporttypeModel = require("app/models/sys_supporttype");

  var Sys_supporttypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_supporttypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_supporttypeModel
      });

  module.setExports(Sys_supporttypes_paged);
});
/*! app/collections/sys_testtypes
* 	@requires: app,app/models/sys_testtype
* 	@extends: app.Collection
* 	@exports: app.collections.Sys_testtypes
*/
define("app/collections/sys_testtypes",["require","app","app/models"],function(require,app) {
	var Sys_testtypeModel = require("app/models/sys_testtype");

	var Sys_testtypes = app.Collection.extend({
		url: '/sys_testtypes/',
		model: Sys_testtypeModel
	});

	module.setExports(Sys_testtypes);
});
/*! app/collections/sys_testtypes_paged
*   @requires: app,app/models/sys_testtype
*   @extends: app.Collection_paged
*   @exports: app.collections.Sys_testtypes_paged
*/
define("app/collections/Sys_testtypes_paged",["require","app","app/models"],function(require,app) {
  var Sys_testtypeModel = require("app/models/sys_testtype");

  var Sys_testtypes_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/sys_testtypes/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Sys_testtypeModel
      });

  module.setExports(Sys_testtypes_paged);
});
/*! app/collections/twilio_logs
* 	@requires: app,app/models/twilio_log
* 	@extends: app.Collection
* 	@exports: app.collections.Twilio_logs
*/
define("app/collections/twilio_logs",["require","app","app/models"],function(require,app) {
	var Twilio_logModel = require("app/models/twilio_log");

	var Twilio_logs = app.Collection.extend({
		url: '/twilio_logs/',
		model: Twilio_logModel
	});

	module.setExports(Twilio_logs);
});
/*! app/collections/twilio_logs_paged
*   @requires: app,app/models/twilio_log
*   @extends: app.Collection_paged
*   @exports: app.collections.Twilio_logs_paged
*/
define("app/collections/Twilio_logs_paged",["require","app","app/models"],function(require,app) {
  var Twilio_logModel = require("app/models/twilio_log");

  var Twilio_logs_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/twilio_logs/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: Twilio_logModel
      });

  module.setExports(Twilio_logs_paged);
});
/*! app/collections/wheels
* 	@requires: app,app/models/wheel
* 	@extends: app.Collection
* 	@exports: app.collections.Wheels
*/
define("app/collections/wheels",["require","app","app/models"],function(require,app) {
	var WheelModel = require("app/models/wheel");

	var Wheels = app.Collection.extend({
		url: '/wheels/',
		model: WheelModel
	});

	module.setExports(Wheels);
});
/*! app/collections/wheels_paged
*   @requires: app,app/models/wheel
*   @extends: app.Collection_paged
*   @exports: app.collections.Wheels_paged
*/
define("app/collections/Wheels_paged",["require","app","app/models"],function(require,app) {
  var WheelModel = require("app/models/wheel");

  var Wheels_paged = app.Collection_paged.extend({
          initialize: function() {},
          paginator_core: {
            type: 'get',
            dataType: 'json',
            url: '/api/wheels/'
          },
          paginator_ui: {
            firstPage: 1,
            currentPage: 1,
            perPage: 15
          },
          parse: function(response) {
            this.totalPages = Math.ceil(response.length / this.perPage);
            return response;
          },
          model: WheelModel
      });

  module.setExports(Wheels_paged);
});








































































































































































































































































































































































































































































































































































































































































