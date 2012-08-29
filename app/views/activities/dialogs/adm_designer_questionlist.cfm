<cfoutput>
<link href="#Application.Settings.RootPath#/_styles/Assessment.css?version=3546" rel="stylesheet" type="text/css" />
</cfoutput>
<cfset QuestionNo = 1>

<script>
$(document).ready(function() {	
	$("#QuestionsContainer").sortable({
	 	placeholder: "ui-selected",
		handle: ".DragHandle",
		containment: "#QuestionsContainer",
		stop: function() {
			aIds = $("#QuestionsContainer").sortable("serialize");
			$.post(sRootPath + "/_com/AJAX_Builder.cfc", { method: 'saveQuestionSort', Questions: aIds, returnformat: 'Plain' });
			
			$("span.QuestionNo").each(function (i) {
				$(this).html(i+1);
			});
		}
	 });
	 
	$("a.QuestionEditLink").click(function() {
		nQuestionID = $.ListGetAt(this.id,2,'|');
		sQuestionMode = "Edit";
		
		$("#QuestionDialog").dialog("open");
	});
	 
	$("a.QuestionCopyLink").click(function() {
		nQuestionID = $.ListGetAt(this.id,2,'|');
		sQuestionMode = "Add";
		
		$("#QuestionDialog").dialog("open");
	});
	
	$("a.QuestionRemoveLink").click(function() {
		var nRemoveID = $.ListGetAt(this.id,2,'|');
		
		if(confirm('Are you sure you want to remove this question?')) {
			$.post(sRootPath + "/_com/AJAX_Builder.cfc", { method: "RemoveQuestion", QuestionID: nRemoveID, returnFormat: "plain" },
				function(data) {
					if($.Trim(data) == 'success') {
						updateBuilder();
						updateQuestionList();
					} else {
						alert("ERROR REMOVING QUESTION");
					}
			});
			
			
		}
	});
});
</script>
<cfoutput>
<strong>Assessment:</strong> #qDetails.Name#

<div id="QuestionsContainer">
<cfif qQuestions.RecordCount GT 0>
	<cfloop query="qQuestions">
		<cfswitch expression="#qQuestions.QuestionTypeID#">
			<cfcase value="5">
				<div class="Question" id="Question_#qQuestions.QuestionID#">
					<div class="QuestionText Caption1"><img src="#Application.Settings.RootPath#/_images/icons/layers.png" class="DragHandle" /> #MidLimit(qQuestions.LabelText,40)#</div>
					<div class="QuestionOptions">#getOptions(qQuestions.QuestionId)#</div>
				</div>
			</cfcase>
			<cfcase value="6">
				<div class="Question" id="Question_#qQuestions.QuestionID#">
					<div class="QuestionText Caption2"><img src="#Application.Settings.RootPath#/_images/icons/layers.png" class="DragHandle" /> #MidLimit(qQuestions.LabelText,60)#</div>
					<div class="QuestionOptions">#getOptions(qQuestions.QuestionId)#</div>
				</div>
				
			</cfcase>
			<cfcase value="7">
				<div class="Question" id="Question_#qQuestions.QuestionID#">
					<div class="QuestionText Caption3"><img src="#Application.Settings.RootPath#/_images/icons/layers.png" class="DragHandle" /> #MidLimit(qQuestions.LabelText,70)#</div>
					<div class="QuestionOptions">#getOptions(qQuestions.QuestionId)#</div>
				</div>
			</cfcase>
			<cfdefaultcase>
			<div class="Question" id="Question_#qQuestions.QuestionID#">
				<div class="QuestionText"><img src="#Application.Settings.RootPath#/_images/icons/layers.png" class="DragHandle" /> <span class="QuestionNo">#QuestionNo#</span> #MidLimit(qQuestions.LabelText,85)#</div>
				<div class="QuestionOptions">#getOptions(qQuestions.QuestionId)#</div>
				<cfset QuestionNo++>
			</div>
			</cfdefaultcase>
		</cfswitch>
	</cfloop>
<cfelse>
	No questions have been created...<br />
	Click the "Add Question" button below to begin creating your first question or caption.
</cfif>
	<div style="clear:both;"></div>
</div>
<cffunction name="getOptions" access="public" returntype="string">
	<cfargument name="questionId" type="numeric" required="yes">
	<cfset var output = "" />
		<cfsavecontent variable="output">
		<ul>
			<li><a href="javascript:void(0);" id="Edit|#arguments.QuestionID#" class="QuestionEditLink"><img src="#Application.Settings.RootPath#/_images/icons/pencil.png" border="0" align="absmiddle" />Edit</a></li>
			<li><a href="javascript:void(0);" id="QCopy|#arguments.QuestionID#" class="QuestionCopyLink"><img src="#Application.Settings.RootPath#/_images/icons/page_copy.png" border="0" align="absmiddle" />Copy</a></li>
			<li><a href="javascript:void(0);" <cfif qQuestions.answerCount EQ 0> id="QRemove|#arguments.QuestionID#" class="QuestionRemoveLink"<cfelse>class="link-disabled"</cfif>><img src="#Application.Settings.RootPath#/_images/icons/<cfif qQuestions.answerCount EQ 0>bin<cfelse>lock</cfif>.png" border="0" align="absmiddle" />Remove</a></li>
		</ul>
		</cfsavecontent>
	
		<cfreturn output />
	</cffunction>
</cfoutput>