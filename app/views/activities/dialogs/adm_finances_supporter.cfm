<cfparam name="Attributes.SupporterID" default="" />
<cfparam name="Attributes.Name" default="" />
<cfparam name="Attributes.Description" default="" />

<cfoutput>
<form id="formEditSupporter" name="formEditSupporter" method="post" action="#Myself#Activity.EditSupporter&SupporterID=#Attributes.SupporterID#&Submitted=1">
    <table>
        <tr>
            <td>Name</td>
            <td><input type="text" name="Name" id="Name" value="#Attributes.Name#" /></td>
        </tr>
        <tr>
            <td>Description</td>
            <td><textarea name="Description" id="Description">#Attributes.Description#</textarea></td>
        </tr>
    </table>
</form>
</cfoutput>