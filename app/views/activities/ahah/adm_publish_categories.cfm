<cfinclude template="#Application.Settings.RootPath#/View/Includes/SaveJS.cfm" />

<script>
<cfoutput>
// CREATE Category ARRAYS
aActivityCategoryList = $.ListToArray("#ActivityCategoryList#","|");
aCategoryList = $.ListToArray("#CategoryList#","|");
</cfoutput>

$(document).ready(function() {
	// PAGE WIDE EDITING VARS
	nCurrEditID = 0;
	sCurrEditName = "";
	
	// Categories STYLE CHANGES
	$(".FieldInput").bind("change", this, function() {
		// DEFINE CONTAINERID
		ContainerID = this.id + "Container";
		
		// CREATE CHECKED STATUS
		var CheckedStatus = this.checked;
		
		// CHANGE CategoryCONTAINER'S CSS
		setCategoryStyle(CheckedStatus, ContainerID);
	});
	
	// CHECK IF THE Category NEEDS CHECKD ON LOAD
	$(".FieldInput:checked").each(function() {
		ContainerID = this.id + "Container";
		
		setCategoryStyle(true, ContainerID);
	});
});

// CHANGE CategoryCONTAINER'S CSS
function setCategoryStyle(CategoryStatus, ContainerID) {
	if(CategoryStatus) {
		$("#" + ContainerID).css({"background-color": "#4E9A30", "color": "#FFFFFF", "border": "1px solid #1B6700"});
	} else {
		$("#" + ContainerID).css({"background-color": "#FFFFFF", "color": "#000000", "border": "1px solid #FFFFFF"});
	}	
}
</script>

<cfoutput>
<!--- CREATE TABLE CELL COUNTER --->
<cfset CellCount = 0>
<form name="frmCategories" id="EditForm" method="post" action="#Application.Settings.RootPath#/_com/AJAX_Activity.cfc">
<input type="hidden" value="saveCategoriesLMS" name="method" id="method" />
<input type="hidden" value="plain" name="returnformat" />
<input type="hidden" value="#Attributes.ActivityID#" name="ActivityID" />
<input type="hidden" value="" name="ChangedFields" id="ChangedFields" />
<input type="hidden" value="" name="ChangedValues" id="ChangedValues" />
<cfinclude template="#Application.Settings.RootPath#/View/Includes/SaveInfo.cfm" />
	<table cellspacing="3" border="0" width="637">
		<tr>
			<cfloop query="qCategories">
			<cfif CellCount EQ 3>
				</tr>
				<tr>
				<cfset CellCount = 0>
			</cfif>
			<td style="width: 33%; position: relative; float:left;">
				<table cellspacing="3" id="Site#qCategories.CategoryID#Container" style="width:100%; height:100%; border: 1px solid ##FFFFFF;">
					<tr>
						<td valign="top"><input type="checkbox" name="Site" id="Site#qCategories.CategoryID#" value="#qCategories.CategoryID#" class="FieldInput" <cfif ListFind(ActivityCategoryList, qCategories.CategoryID, "|")>CHECKED </cfif>/></td>
						<td valign="top">
                        	<span id="CategoryContainer#qCategories.CategoryID#">
                        	<label for="Site#qCategories.CategoryID#"><strong>#qCategories.Name#</strong></label>
                            </span>
                        </td>
					</tr
				></table>
			</td>
			
			<cfset CellCount = CellCount + 1>
			</cfloop>
		</tr>
	</table>
</form>
</cfoutput>