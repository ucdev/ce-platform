<script>
$(document).ready(function() {
	$("a.report-title").click(function() {
		var sReportType = $.ListGetAt(this.id, 1, "-");
		
		$(".report-container-content").hide();
		$("#" + sReportType + "-report-content").show();
		$(".report-arrow").attr("src", sRootPath + "/admin/_images/222222_7x7_arrow_right.gif");
		$("#" + sReportType + "-report-arrow").attr("src", sRootPath + "/admin/_images/222222_7x7_arrow_down.gif");
	});
		
	$(".btnSubmit").bind("click", this, function() {
		var sReportType = $.ListGetAt(this.id, 1, "-");
		
		$("#" + sReportType + "-report-content").hide();
		$("#" + sReportType + "-report-loading").show();
		
		switch (sReportType) {
            case "attendance":
				var bEmail = 0;
				
				if($("#attendance-email").attr("checked")) {
					var bEmail = 1;
				}
				
				$.post(sRootPath + "/_com/Report/ActivityReportAJAX.cfc", 
					{ method: "AttendanceReport", ActivityID: nActivity, mode: "Activity", email: bEmail, returnFormat: "plain" },
					function(returnData) {
						cleanData = $.trim(returnData);
						status = $.ListGetAt(cleanData,1,"|");
						statusMsg = $.ListGetAt(cleanData,2,"|");
						
						if($.ListGetAt(cleanData,1,"|") == 'Success') {
							$("#" + sReportType + "-report-loading").hide();
							$("#" + sReportType + "-report-download").html("<a href=\"" + sMyself + "File.DownloadReport?ReportID=13&FileName=" + statusMsg + "\" title=\"Download Report\"><img src=\"" + sRootPath + "/admin/_images/file_icons/xls.png\" /> Download Report</a> (" + StatusMsg + ")");
						} else {
							addError(statusMsg,250,6000,4000);
							$("#" + sReportType + "-report-loading").hide();
							$("#" + sReportType + "-report-content").show();
						}
					});
			break;
			case "individ":
			break;
		}
	});
});
</script>
<style>
.report-group { float:left; width:310px; border:1px solid #555; margin:3px; }
.report-group:hover h4 { background-color:#507F0A; }
.report-group h4 { background-color:#555; color:#FFF; }
.report-item { 
background-color:#F7F7F7;
border:1px solid #CCCCCC;
margin:4px;
padding:5px; min-height:95px; cursor:default; }
.report-item:hover { border:1px solid #555; cursor:default; }
.report-item-title { font-size:1.1em; font-weight:bold; }
.report-item-details { font-size:.95em; margin:6px 0px; }
.report-item-criteria { background-color:#EEE; padding:5px; border:1px solid #CCC; margin-top:6px; }
.report-item-criteria:hover { background-color:#FFF; border:1px solid #555; }
</style>
<cfoutput>
<cfset qAssessments = Application.Com.AssessmentGateway.getByViewAttributes(ActivityID=Attributes.ActivityID,DeletedFlag='N')>
<div class="ViewSection">
	<h3>Reports</h3>
	<div class="report-group">
		<h4>Assessment Reports</h4>
		<div class="report-item">
			<div class="report-item-title">Inception Data / Tally</div>
			<div class="report-item-details">Full data dump / tally since activity went live.</div>
			<div class="report-item-criteria">
				<form action="#Application.Settings.RootPath#/_com/Report/Assess_AnswerDump.cfc" method="get">
					<input type="hidden" name="method" value="Run" />
					<input type="hidden" name="reportLabel" value="Incept" />
				<select name="AssessmentID" id="AssessmentID" class="fieldinput" style="width: 190px;">
					<cfloop query="qAssessments">
					<option value="#qAssessments.AssessmentID#">#qAssessments.AssessTypeName#</option>
					</cfloop>
				</select>
				<input type="submit" name="submit" value="Download" class="button" />
				</form>
			</div>
		</div>
		<div class="report-item">
			<cfset currDate = now() />
			<cfset prevMonth = dateAdd('m',-1,currDate) />
			<cfset prevMonthLastDay = DateAdd("d", -1, CreateDate(year(currDate), month(currDate), 1))>
			<cfset startDate = createDate(year(prevMonth),month(prevMonth),1) />
			<cfset endDate = createDate(year(prevMonth),month(prevMonth),day(prevMonthLastDay))/>
			<div class="report-item-title">Prior Month Data / Tally</div>
			<div class="report-item-details">Data dump / tally for #dateFormat(startDate,'mm/dd/yyyy')# - #dateFormat(endDate,'mm/dd/yyyy')#</div>
			<div class="report-item-criteria">
				<form action="#Application.Settings.RootPath#/_com/Report/Assess_AnswerDump.cfc" method="get">
					<input type="hidden" name="method" value="Run" />
					<input type="hidden" name="startDate" value="#startDate#" />					
					<input type="hidden" name="endDate" value="#endDate#" />
					<input type="hidden" name="reportLabel" value="Month" />
				<select name="AssessmentID" id="AssessmentID" class="fieldinput" style="width: 190px;">
					<cfloop query="qAssessments">
					<option value="#qAssessments.AssessmentID#">#qAssessments.AssessTypeName#</option>
					</cfloop>
				</select>
				<input type="submit" name="submit" value="Download" class="button" />
				</form>
			</div>
		</div>
		<div class="report-item">
			<cfset startDate = firstDayOfWeek(dateAdd('ww',-1,now())) />
			<cfset endDate = dateAdd('d',6,startDate) />
			<div class="report-item-title">Prior Week Data / Tally</div>
			<div class="report-item-details">Data dump / tally for #dateFormat(startDate,'mm/dd/yyyy')# - #dateFormat(endDate,'mm/dd/yyyy')#</div>
			<div class="report-item-criteria">
				<form action="#Application.Settings.RootPath#/_com/Report/Assess_AnswerDump.cfc" method="get">
					<input type="hidden" name="method" value="Run" />
					<input type="hidden" name="startDate" value="#startDate#" />					
					<input type="hidden" name="endDate" value="#endDate#" />
					<input type="hidden" name="reportLabel" value="Week" />
				<select name="AssessmentID" id="AssessmentID" class="fieldinput" style="width: 190px;">
					<cfloop query="qAssessments">
					<option value="#qAssessments.AssessmentID#">#qAssessments.AssessTypeName#</option>
					</cfloop>
				</select>
				<input type="submit" name="submit" value="Download" class="button" />
				</form>
			</div>
		</div>

	</div>
	<div class="report-group">
		<h4>Registrant Reports</h4>
		<div class="report-item">
			<div class="report-item-title">Attendance Report</div>
			<div class="report-item-details">
			Extract raw attendance data from the registrants.<br />
			</div>
			<div class="report-item-criteria">
				<form action="#Application.Settings.RootPath#/_com/Report/Attendance.cfc" method="get">
				<input type="hidden" name="method" value="Run" />
				<input type="hidden" name="ActivityID" value="#Attributes.activityID#" />
				<input type="submit" name="submit" value="Download" class="button" />
				</form>
			</div>
			<div class="report-container-loading" id="attendance-report-loading"><img src="/admin/_images/ajax-loader.gif" /></div>
			<div class="report-container-download" id="attendance-report-download"></div>
		</div>
	</div>
    <cfif application.activity.isCDCActivity(attributes.ActivityID)>
	<div class="report-group">
		<h4>CDC Reports</h4>
		<div class="report-item">
			<div class="report-item-title">CDC PIF Report</div>
			<div class="report-item-details">
			Extract raw attendance data from the registrants.<br />
			</div>
			<div class="report-item-criteria">
				<form action="#Application.Settings.RootPath#/_com/Report/CDCPIFTally.cfc" method="get">
					<input type="hidden" name="method" value="Run" />
					<input type="hidden" name="ActivityID" value="#Attributes.activityID#" />
					<input type="hidden" name="startDate" value="#Attributes.StartDate#" />
					<input type="hidden" name="endDate" value="#Attributes.endDate#" />
					<input type="submit" name="submit" value="Download" class="button" />
				</form>
			</div>
			<div class="report-container-loading" id="attendance-report-loading"><img src="/admin/_images/ajax-loader.gif" /></div>
			<div class="report-container-download" id="attendance-report-download"></div>
		</div>
	</div>
    </cfif>
	<div class="report-group">
		<h4>Financial Reports</h4>
		<div class="report-item">
			
		</div>
	</div>
   <!--- <div class="report-container" id="individ-report-container">
        <div class="report-container-title"><a href="Report.AssessSingle?activityid=#Attributes.ActivityID#" class="report-title" id="individ-report-title">Individual Assessment Report</a> <img src="#Application.Settings.RootPath#/_images/222222_7x7_arrow_right.gif" class="report-arrow" id="individ-report-arrow" /></div>
        <div class="report-container-content" id="individ-report-content">
            <!---<div class="report-container-options"><input type="checkbox" name="Email" id="individ-email" /><label for="individ-email">Include Email Addresses</label></div>
            <div class="report-container-buttons"><input type="button" value="Generate" class="btnSubmit" name="btnIndividReport" id="individ-report-generator" /></div>--->
        </div>
        <div class="report-container-loading" id="individ-report-loading"><img src="/admin/_images/ajax-loader.gif" /></div>
        <div class="report-container-download" id="individ-report-download"></div>
    </div>
    <div class="report-container" id="assess-report-container">
    	<div class="report-container-title"><a href="Report.Assessment?activityid=#Attributes.ActivityID#" class="report-title" id="assess-report-title">Activity Assessment Report</a> <img src="#Application.Settings.RootPath#/_images/222222_7x7_arrow_right.gif" class="report-arrow" id="assess-report-arrow" /></div>
        <div class="report-container-content" id="assess-report-content">
            <!---<div class="report-container-options"><input type="checkbox" name="Email" id="assess-email" /><label for="assess-email">Include Email Addresses</label></div>
            <div class="report-container-buttons"><input type="button" value="Generate" class="btnSubmit" name="btnAssessReport" id="assess-report-generator" /></div>--->
        </div>
        <div class="report-container-loading" id="assess-report-loading"><img src="/admin/_images/ajax-loader.gif" /></div>
        <div class="report-container-download" id="assess-report-download"></div>
    </div>--->
</div>
<cfscript>
/**
* Analogous to firstDayOfMonth() function.
*
* @param date      Date object used to figure out week. (Required)
* @return Returns a date.
* @author Pete Ruckelshaus (pruckelshaus@yahoo.com)
* @version 1, September 12, 2007
*/
function firstDayOfWeek(date) {
    var dow = "";
    var dowMod = "";
    var dowMult = "";
    var firstDayOfWeek = "";
    date = trim(arguments.date);
    dow = dayOfWeek(date);
    dowMod = decrementValue(dow);
    dowMult = dowMod * -1;
    firstDayOfWeek = dateAdd("d", dowMult, date);
    
    return firstDayOfWeek;
}
</cfscript>
</cfoutput>