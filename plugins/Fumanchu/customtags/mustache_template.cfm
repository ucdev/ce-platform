<cfscript>
	if (thisTag.ExecutionMode is "end") {
		open = '<script id="#attributes.name#" type="text/x-mustache-template">';
		close = '</script>';
		CALLER["#attributes.name#"] = thisTag.GeneratedContent;
		thisTag.GeneratedContent = open & thisTag.GeneratedContent & close;
	}
</cfscript>