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

#startFormTag(action="create", class="form login responsiveForm span12")#
	<div class="grouped">
		<div class="control-group first">
			<label class="control-label" for="email">Email Address</label>
			<div class="controls">
				#textFieldTag(name="login", id="email", class="span12",autocomplete="off")#
			</div>
		</div>
		<div class="control-group last">
			<label class="control-label" for="password">Password</label>
			<div class="controls">
				#passwordFieldTag(name="password", id="password", class="span12",autocomplete="off")#
			</div>
		</div>
	</div>
	<div class="mtm">#submitTag(value="Sign in", class="btn btn-primary span12")#</div>
	<p>Don't have an account? #linkTo(text="Sign up!", route="signup")#</p>
#endFormTag()#
</cfoutput>

