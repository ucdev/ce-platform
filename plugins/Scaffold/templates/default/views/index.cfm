<h1>Listing [NamePluralLowercase]</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>
<p>#linkTo(text="New [NameSingularLowercase]", action="new")#</p>
</cfoutput>
<cfoutput>
<table class="table table-striped table-condensed">
	<thead>
		LISTINGHEADINGS
	</thead>
	<tbody>
		<cfloop query="[NamePluralLowercase]">
		<tr>
			LISTINGCOLUMNS
		</tr>
		</cfloop>
	</tbody>
</table>
</cfoutput>
