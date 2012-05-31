<cfoutput>

<h2>Login</h2>

<div class="flash">
	<cfif flashKeyExists('error')>
		<div class="message error">
			<p>#flash('error')#</p>
		</div>
	<cfelseif flashKeyExists('notice')>
		<div class="message error">
			<p>#flash('notice')#</p>
		</div>
	</cfif>  
</div>

#startFormTag(action="create", class="form login")#

<div>
	<label class="label right">Login</label>
	#textFieldTag(name="login", class="text_field")#
</div>
<div>
	<label class="label right">Password</label>
	#passwordFieldTag(name="password", class="text_field")#
</div>

#submitTag(value="Login", class="button")#
<p>Don't have an account? #linkTo(text="Sign up!", route="signup")#</p>
#endFormTag()#
</cfoutput>
