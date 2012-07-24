ce.module("activity.participants",function(self,ce,Backbone,Marionette,$,_) {
	self.Row.extend({
		
		events: {
			'click .js-view-attendee-statusdate': 'changeAttendeeViewableStatus',
			'change .js-selected-checkbox': 'selectRow',
			'click .js-delete-link': 'deleteFakeAttendee',
			'click .js-edit-status-date': 'editStatusDate'
		},
		
		changeAttendeeViewableStatus: function(params) {
			var participant = this;
			
			$.ajax({
				url: "/AJAX_adm_Activity/getAttendeeDate", 
				type: 'post',
				data: { AttendeeId: this.id, type: params.type },
				dataType: 'json',
				success: function(data) {
					if(data.STATUS) {
						$("#current-attendee-date-" + participant.id).val(data.PAYLOAD.month + '/' + data.PAYLOAD.day + '/' + data.PAYLOAD.year);
						$("#current-attendee-status-" + participant.id).val(params.type);
						$("#datefill-" + participant.id).html(data.STATUSMSG);
						$("#editdatelink-" + participant.id).show();
					} else {
						addError('test',500,5000,2500);
					}
				}
			});
					
			// PLACE CHECKMARK BY ACTIVE STATUS
			$('#view-attendee-statuses-' + this.id).find('a .active-status').remove();
			params.elem.prepend('<i class="icon-ok active-status"></i> ');
		},
		
		deleteFakeAttendee: function() {
			var participant = this;
			
			$.ajax({
				type:'post',
				dataType:'json',
				url:'/ajax_adm_activity/removeAttendeeByID',
				data:{
					'attendeeId': participant.id
				},
				async:false,
				success:function(data) {
					if(data.STATUS) {
						participant.row.remove();
					}
				}
			});
		},
		
		editStatusDate: function() {
			var participant = this;
			var $currAttendeeStatus = $("#current-attendee-status-" + participant.id);
			var currDateContainer = $("#CurrStatusDate-" + participant.id);
			var dtCurrDate = $.Trim($("#current-attendee-date-" + participant.id).val());
			var dtStatusMask;
			var sDate = dtCurrDate.split(' ')[0];
			var $cancelEdit = $('#CancelDate-' + participant.id);
			var $editStatusDate = $("#edit-attendee-date-" + participant.id);
			var $saveEdit = $('#SaveDate-' + participant.id);
			var $viewStatusDate = $("#view-attendee-date-" + participant.id);
			var $inputEdit = $('#EditDateField-' + participant.id);
			
			// SET CURRENT STATUS DATE VALUE IN HTML ELEMENTS
			currDateContainer.val(dtCurrDate);
			$inputEdit.val(dtCurrDate);
			
			// SHOW EDIT FORM
			$viewStatusDate.hide();
			$editStatusDate.show();
			
			$cancelEdit.click(function() {
				$editStatusDate.hide();
				$viewStatusDate.show();
				
				$cancelEdit.unbind();
				$editStatusDate.unbind();
				$saveEdit.unbind();
				$viewStatusDate.unbind();
			});
		
			$inputEdit.keydown(function(e) {
				// UPDATE THE JS VAR THAT WILL REFILL THIS
				if($.Len($(this).val()) > 0) {
					dtStatusMask = $(this).val();
				}
				
				// DETERMINE IF KEY PRESSED WAS THE ENTER KEY
				if(e.keyCode == 13) {
					saveStatusDate($inputEdit.val(), $currAttendeeStatus.val());
				}
			});
			
			$saveEdit.click(function() {
				saveStatusDate($inputEdit.val(), $currAttendeeStatus.val());
			});
			
			// SAVE FUNCTION
			function saveStatusDate(dtDate, nType) {
				// DETERMINE THERE IS A STATUS AND A DATE
				if(nType != "" && dtDate.length > 0) {
					$.ajax({
						url: '/AJAX_adm_Activity/saveAttendeeDate', 
						type: 'post',
						data: { attendeeId: participant.id, DateValue: dtDate, Type: nType },
						dataType: 'json',
						success: function(data) {
							if(data.STATUS) {
								addMessage(data.STATUSMSG,250,6000,4000);
								participant.parent.changePage();
							} else {
								addError(data.STATUSMSG,250,6000,4000);
								
								$editStatusDate.hide();
								$viewStatusDate.show();
							}
						}
					});
				} else {
					addError('You must provide full date and time.',250,6000,4000);
					$inputEdit.focus();
					$inputEdit.val(dtStatusMask);
				}
			}
		}, 
		
		selectRow: function() {
			if(this.checkBox.attr('checked')) {
				this.row.addClass('alert alert-info');
				
				// ADD CURRENT MEMBER TO SELECTEDROWS LIST
				this.addSelectedRow();
			} else {
				this.row.removeClass('alert alert-info');
				
				// REMOVE CURRENT MEMBER FROM SELECTEDROWS LIST
				this.removeSelectedRow();
			}
		}
	});
});