<script>
$(document).ready(function() {
	$("label").inFieldLabels();
	$('#login').focus();
});
</script>

<cfoutput>
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

#startFormTag(action="create", class="form login specialForm loginForm inFieldLabels")#
	
	<div class="grouped">
		<div class="control-group first">
			<label class="control-label" for="email">Email Address</label>
			<div class="controls">
				#textFieldTag(name="login", id="email", class="span24",autocomplete="off")#
			</div>
		</div>
		<div class="control-group last">
			<label class="control-label" for="password">Password</label>
			<div class="controls">
				#passwordFieldTag(name="password", id="password", class="span24",autocomplete="off")#
			</div>
		</div>
	</div>

#submitTag(value="Login", class="button")#
<p>Don't have an account? #linkTo(text="Sign up!", route="signup")#</p>
#endFormTag()#
</cfoutput>

