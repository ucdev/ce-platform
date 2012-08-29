<cfheader name="Content-Type" value="#getPageContext().getServletContext().getMimeType(physFilePath)#">
<cfheader name="Content-Disposition" value="attachment; filename=#file.fileName#">
<cfcontent file="#physFilePath#">