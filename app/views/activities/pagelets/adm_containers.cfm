<script>

function saveActCat(oCategory) {
	$.post(sRootPath + "/_com/AJAX_Activity.cfc", { method: "saveCategory", ActivityID: nActivity, CategoryID:$(oCategory).val(), returnFormat:"plain" },
		function(data){
			var cleanData = $.trim(data);
			status = $.ListGetAt(cleanData,1,"|");
			statusMsg = $.ListGetAt(cleanData,2,"|");
			
			if(status == 'Success') {
				addMessage(statusMsg,250,6000,4000);
				$("#Containers").html("");
				updateContainers();
				updateActions();
			} else if(status == 'Fail') {
				addError(statusMsg,250,6000,4000);
				$("#CatAdder").val("");
			}
	});
}

$(document).ready(function() {
<!---	<cfif request.browser DOES NOT CONTAIN "MSIE">
	$("[title]").mbTooltip({
		opacity : .90, //opacity
		wait:500, //before show
		ancor:"mouse", //"parent"
		cssClass:"default", // default = default
		timePerWord:70, //time to show in milliseconds per word
		hasArrow:false,
		color:"white",
		imgPath:"images/",
		shadowColor:"black",
		fade:500
	});
	</cfif>--->
	
	/* CATEGORY MANAGEMENT */
	$("#CatAdder").val("");
	
	$(".CatAdder").change(function() {
		if($(this).val() != '') {
			saveActCat(this);
		}
	});
	
	$("#NewCatLink").click(function() {
		var CatTitle = prompt("Container Name:", "");
		
		if(CatTitle) {
			$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "createCategory", Name: CatTitle, ReturnFormat:"plain" },
				function(data) {
					if(data.STATUS) {
						$("#CatAdder").addOption(data.DATASET[0].CATEGORYID, CatTitle);
						$("#CatAdder").val(data.DATASET[0].CATEGORYID);
						saveActCat($("#CatAdder"));
					} else {
						addError(statusMsg,250,6000,4000);
					}
			});
		}
	});
	
	$(".CatRemoveLink").click(function() {
		var CleanID = $.Replace(this.id,'CatRemove','','all');
		var CatID = $.ListGetAt(CleanID,1,"|");
		var CatName = $.ListGetAt(CleanID,2,"|");
		
		if (confirm('Are you sure you want to remove the activity from the container \'' + CatName + '\'?')) {
			$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "deleteCategory", ActivityID: nActivity, CategoryID: CatID, returnFormat:"plain" },
			  	function(data){
					if(data.STATUS) {
						updateContainers();
						updateActions();
						addMessage(data.STATUSMSG,250,6000,4000);
			
						$("#CatRow" + CatID).remove();
						$("#CatAdder").val("");
					} else {
						addMessage(data.STATUSMSG,250,6000,4000);
					}
			});
		}
	});
});
</script>

<cfoutput>
<cfset UsedCats = "">
<cfset qActCats = Application.Com.ActivityCategoryGateway.getByViewAttributes(ActivityID=Attributes.ActivityID,DeletedFlag='N')>
<cfset qCats = Application.Com.CategoryGateway.getByAttributes(OrderBy="Name")>
<cfset qPersonalCats = Application.Com.CategoryGateway.getByCookie(TheList=Cookie.USER_Containers,OrderBy="Name")>

<h3>Containers</h3>
<table width="100%" cellspacing="1" cellpadding="2" border="0" id="CatTable">
<cfloop query="qActCats">
	<cfset UsedCats = ListAppend(UsedCats,qActCats.CategoryID,",")>
	<tr id="CatRow#qActCats.CategoryID#">
		<td width="17"><img src="#Application.Settings.RootPath#/_images/icons/box_page.png" /></td>
		<td><span style="cursor:default;" title="#qActCats.Name#">#midLimit(qActCats.Name,16)#</span></td>
		<td><a href="javascript:void(0);" class="CatRemoveLink" id="CatRemove#qActCats.CategoryID#|#qActCats.Name#"><img src="#Application.Settings.RootPath#/_images/icons/delete.png" border="0" /></a></td>
	</tr>
</cfloop>
</table>
<div style="position:relative;clear:both;display:block;height:30px;">
<select name="CatAdder" id="CatAdder" class="CatAdder" style="position: absolute; left: 3px; width: 123px; top: -1px;">
	<option value="" selected>Add Container</option>
	<cfif qPersonalCats.RecordCount GT 0>
	<option value="0">---- Your Containers ----</option>
		<cfloop query="qPersonalCats">
		<cfif NOT ListFind(UsedCats,qPersonalCats.CategoryID,",")><option value="#qPersonalCats.CategoryID#">#qPersonalCats.Name#</option></cfif>
		</cfloop>
	<option value="0">--- All Other Containers ----</option>
	</cfif>
	<cfloop query="qCats">
		<cfif NOT ListFind(Cookie.USER_Containers,qCats.CategoryID,",") AND NOT ListFind(UsedCats,qCats.CategoryID,",")><option value="#qCats.CategoryID#">#qCats.Name#</option></cfif>
	</cfloop>
</select><a href="javascript://" id="NewCatLink" title="Create a new container..." style="position: absolute; right: 3px;"><img src="#Application.Settings.RootPath#/_images/icons/asterisk_orange.png" border="0" /></a>
</div></cfoutput>