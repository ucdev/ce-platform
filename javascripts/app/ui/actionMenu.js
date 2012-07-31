ce.pkg("ui.actionMenu",function(self,ce,Backbone,Marionette,$,_){
	$.fn.isPerson = function () {
		return this.each(function () {
			var oPersonRow = $(this);
			var oPersonActionMenu = oPersonRow.find(".action-menu button").isPersonActionMenu();
		})
	};
	
	function defineVars(oRecord) {
		var oPerson = new Object();
		
		oPerson.oLink = $(oRecord);
		oPerson.oPersonRow = oPerson.oLink.parents(".AllAttendees");
		oPerson.nAttendee = oPerson.oPersonRow.find('.personId').val();
		oPerson.nPerson = oPerson.oPersonRow.find('.personId').val();
		oPerson.nAttendee = oPerson.oPersonRow.find('.attendeeId').val();
		oPerson.sAction = oPerson.oLink.parent().attr('class');
		sPersonNameTemp = oPerson.oPersonRow.find(".PersonLink").html();
		oPerson.sPersonName = $.Trim($.ListGetAt(sPersonNameTemp, 2, ",")) + " " + $.Trim($.ListGetAt(sPersonNameTemp, 1, ","));
		
		return oPerson;
	}
	
	$.fn.isPersonActionLink = function () {
		return this.each(function () {
			$(this).click(function (J) {
									
				var oPerson = defineVars(this);
				
				
				switch (oPerson.sAction) {
				case "assess":
						$.post("/Activity/AttendeeDetailAHAH", { ActivityID: nActivity, PersonID: oPerson.nPerson, AttendeeID:oPerson.nAttendee }, 
							function(data) {
								$("#PersonDetailContent").html(data);
						});
						
						$("#PersonDetailContainer").overlay({  
							top: 100, // custom top position 
							left: 50, // custom left position
							expose: { // some expose tweaks suitable for facebox-looking dialogs
								color: '#333', // you might also consider a "transparent" color for the mask 
								loadSpeed: 200, // load mask a little faster
								opacity: 0.9 // highly transparent 
							}, 
							closeOnClick: false, // disable this for modal dialog-type of overlays 
							onClose: function() {
								updateRegistrants(nId);
								$("#PersonDetailContent").html("");
							},
							api: true // we want to use the programming API 
						}).load();
					break;
				case "pifform":
						// REMOVED TO PREVENT PULLING UP PREVIOUS PERSON's DATA
						$.post(sMyself + "/Activity/AttendeeCDC", { ActivityID: nActivity, PersonID: oPerson.nPerson, AttendeeID:oPerson.nAttendee }, 
							function(data) {
								$("#pifForm").html(data);
						});
						
						// PIF DIALOG
						$("#pifDialog").dialog({ 
							title: "PIF Form",
							modal: true, 
							autoOpen: false,
							position:[40,40],
							height:450,
							width:750,
							resizable: true,
							dragStop: function(ev,ui) {
								
							},buttons: { 
								Save:function() {
									$("#frmCDC").ajaxSubmit(); 
									addMessage("PIF successfully updated.",250,6000,4000);
									$(this).dialog("close");
									
								},
								Cancel:function() {
									$(this).dialog("close");
								}
							},
							overlay: { 
								opacity: 0.5, 
								background: "black" 
							} ,
							close:function() {
								$("#pifForm").html("");
							},
							resizeStop:function(ev,ui) {
								$("#pifForm").css("height",ui.size.height-73 + "px");
							}
						});
					
						// OPEN PIF DIALOG
						$("#pifDialog").dialog("open");
					break;
				case "eCMECert":
						$.post("/Activity/emailCert", { ActivityID: nActivity, PersonID: oPerson.nPerson, AttendeeID:oPerson.nAttendee }, 
							function(data) {
								$("#email-cert-dialog").html(data);
						});
						
						// EMAIL CERT DIALOG
						$("#email-cert-dialog").dialog({ 
							title: "Email Certificate",
							modal: true, 
							autoOpen: true,
							height:300,
							width:400,
							resizable: false,
							overlay: { 
								opacity: 0.5, 
								background: "black" 
							},
							buttons: { 
								Save:function() {
									$("#frmEmailCert").ajaxSubmit({
																  success: function(data) {
																		addMessage("Emailed certificate successfully.",250,6000,4000);
																  }
									}); 
									updateActions();
									$(this).dialog("close");
								},
								Preview:function() {
									window.open("Report.CMECert?ActivityID=" + ccpd.tier2.nActivity + "&ReportID=5&SelectedMembers=" + oPerson.nPerson);
								},
								Cancel:function() {
									$(this).dialog("close");
								},
							},
							open:function() {
							},
							close:function() {
								$("#email-cert-dialog").html("");
								oPerson.nPerson = "";
							}
						});
						
						// OPEN EMAIL CERT DIALOG
						$("#email-cert-dialog").dialog("open");
					break;
				case "pCMECert":
						window.open("/Report/CMECert?ActivityID=" + ccpd.tier2.nActivity + "&ReportID=5&SelectedMembers=" + oPerson.nPerson);
					break;
				case "CNECert":
						window.open("/Report/CNECert?ActivityID=" + ccpd.tier2.nActivity + "&ReportID=6&SelectedMembers=" + oPerson.nPerson);
					break;
				case "credits":
						$.post("/Activity/AdjustCredits", { ActivityID: ccpd.tier2.nActivity, PersonID: oPerson.nPerson, AttendeeID:oPerson.nAttendee }, 
							function(data) {
								$("#CreditsDialog").html(data);
						});
						
						// CREDITS DIALOG
						$("#CreditsDialog").dialog({ 
							title: "Adjust Credits",
							modal: true, 
							autoOpen: true,
							height:175,
							width:400,
							resizable: false,
							overlay: { 
								opacity: 0.5, 
								background: "black" 
							},
							buttons: { 
								Save:function() {
									$("#formAdjustCredits").ajaxSubmit(); 
									addMessage("Credits successfully updated.",250,6000,4000);
									updateActions();
									$(this).dialog("close");
								},
								Cancel:function() {
									$(this).dialog("close");
								},
							},
							open:function() {
							},
							close:function() {
								$("#CreditsDialog").html("");
								oPerson.nPerson = "";
							}
						});
						
						// OPEN CREDITS DIALOG
						$("#CreditsDialog").dialog("open");
					break;
				case "togglemd":
						if($("#md-status-" + oPerson.nAttendee).text() == "Yes") {
							Result = "N";
						} else if($("#md-status-" + oPerson.nAttendee).text() == "No") {
							Result = "Y";
						};
						
						$.ajax({
							url: "/AJAX_adm_Activity/updateMDStatus", 
							type: 'post',
							data: { AttendeeID:oPerson.nAttendee, MDNonMD: Result },
							dataType: 'json',
							success: function(data) {
								if(data.STATUS) {
									addMessage(data.STATUSMSG,250,6000,4000);
									updateStats();
									
									if(Result == "Y") {
										$("#md-status-" + oPerson.nAttendee).text("Yes");
									} else if(Result == "N") {
										$("#md-status-" + oPerson.nAttendee).text("No");
									};
								} else {
									addError(data.STATUSMSG,250,6000,4000);
								}
							}
						});
					break;
				case "sendCertificate":
						if(confirm("Are you sure you want to send " + oPerson.sPersonName + " a copy of their ceritificate?")) {
						   $.ajax({
									url: '/AJAX_adm_Activity/sendCertificate',
									type: 'post',
									data: { activityId: ccpd.tier2.nActivity, PersonID: oPerson.nPerson, AttendeeID:oPerson.nAttendee, returnFormat: 'plain' },
									dataType: 'json',
									success: function(data) {
										if(data.STATUS) {
											addMessage(data.STATUSMSG,250,6000,4000);
										} else {
											addError(data.STATUSMSG,250,6000,4000);
										}
									}
							});
						}
					break;
				case "reset":
						if(confirm("Are you sure you want to reset the attendee record for " + oPerson.sPersonName + "?")) {
							if(confirm("Do you want to clear all payment information attached to current attendee record for " + oPerson.sPersonName + "?")) {
								resetAttendee(ccpd.tier2.nActivity,oPerson.nAttendee,"Y");
							} else {
								resetAttendee(ccpd.tier2.nActivity,oPerson.nAttendee,"N");
							}
						}
					break;
				case "remove":
						if(confirm("Are you sure you would like to remove " + oPerson.sPersonName + " from this activity?")) {
							$.ajax({
								url: "/AJAX_adm_Activity/removeCheckedAttendees",
								type: 'post',
								data: { AttendeeList: oPerson.nAttendee, ActivityID: ccpd.tier2.nActivity, returnFormat: "plain" },
								dataType: 'json',
								success: function(data) {
	
									if(data.STATUS) {
										$("#attendeeRow-" + oPerson.nAttendee).fadeOut("medium");
										
										addMessage(data.STATUSMSG,250,6000,4000);
										updateActions();
										updateStats();
									} else {
										addError(data.STATUSMSG,250,6000,4000);
										updateRegistrants(nId);
										updateActions();
										updateStats();
									}
								}
							});
						}
					break;
				}
				
				J.preventDefault()
			})
			
		})
	};
	$.fn.isPersonActionMenu = function () {
		$actionMenu = $("#action_menu");
		return this.one("mouseover", function () {
			var oPerson = defineVars(this);
			var sMenuHTML = $actionMenu.html();
			
			/* REPLACE VARIABLES */
			sMenuHTML = $.Replace(sMenuHTML,'{personid}',oPerson.nPerson,'ALL'); //PersonID
			sMenuHTML = $.Replace(sMenuHTML,'{activityid}',ccpd.tier2.nActivity,'ALL'); //ActivityID
			
			oPerson.oLink.addClass("clicked").after(sMenuHTML);
			oPerson.oLink.siblings("ul").find("a").find("span").html(oPerson.sPersonName).end().isPersonActionLink();
			
			return false
		})
	};
});