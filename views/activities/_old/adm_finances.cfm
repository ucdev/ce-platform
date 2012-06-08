<cfoutput>  
<div class="ViewContainer">
<div class="ViewSection">
	<h3>Financial Overview</h3>
	<p>
	<cfchart format="png" chartheight="260" showlegend="yes" chartwidth="630" labelformat="currency" show3d="false" backgroundcolor="FFFFFF" xAxisTitle="Entry Types" yAxisTitle="Dollars" fontsize="9">
		<cfchartseries type="bar" markerstyle="circle" query="qLedger" seriescolor="##555555" serieslabel="Expenses" valuecolumn="TotalAmount" itemcolumn="Name" />
		<cfchartseries type="bar" markerstyle="circle" query="qBudget" seriescolor="##CC6600" serieslabel="Budget" valuecolumn="TotalAmount" itemcolumn="Name" />
	</cfchart>
	</p>
    <!--- FINANCIAL NUMBERS OUTPUT --->  
	<div>
        <table cellspacing="0" width="630">
            <tr style="background-color:##3d901b;">
            	<td>&nbsp;</td>
                <cfloop from="1" to="#ArrayLen(aFinances)#" index="CurrRec">
                    <td valign="top" align="center"<cfif aFinances[CurrRec][3] GT aFinances[CurrRec][2]> style="color:##FFDDDD;"<cfelse> style="color:##FFFFFF;"</cfif>><strong>#aFinances[CurrRec][1]#</strong></td>
                </cfloop>
            </tr>
            <tr>
            	<td><strong>Expenses</strong></td>
                <cfloop from="1" to="#ArrayLen(aFinances)#" index="CurrRec">
                    <td align="right"<cfif aFinances[CurrRec][3] GT aFinances[CurrRec][2]> style="background:##FFDDDD;"</cfif>>#LSCurrencyFormat(aFinances[CurrRec][3])#</td>
                </cfloop>
            </tr>
            <tr>
            	<td><strong>Budget</strong></td>
                <cfloop from="1" to="#ArrayLen(aFinances)#" index="CurrRec">
                    <td align="right"<cfif aFinances[CurrRec][3] GT aFinances[CurrRec][2]> style="background:##FFDDDD;"</cfif>>#LSCurrencyFormat(aFinances[CurrRec][2])#</td>
                </cfloop>
            </tr>
        </table>
	</div>
</div>
</div>
</cfoutput>