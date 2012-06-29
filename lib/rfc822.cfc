<cfcomponent>
	<!---
	#
	# RFC 822/2822/5322 Email Parser
	#
	# By Cal Henderson <cal@iamcal.com>
	#
	# This code is dual licensed:
	# CC Attribution-ShareAlike 2.5 - http://creativecommons.org/licenses/by-sa/2.5/
	# GPLv3 - http://www.gnu.org/copyleft/gpl.html
	#
	# $Revision$
	#

	##################################################################################
	--->

	<cffunction name="parse" access="public">
		<cfargument name="email" type="string" required="yes" />
		<cfargument name="options" type="struct" required="no" default="#structNew()#" />
		
		<cfset var reg = {} />
		<!---($email, $options=array()){

		#
		# you can pass a few different named options as a second argument,
		# but the defaults are usually a good choice.
		#--->

		<cfscript>
			$defaults = {
				'allow_comments'	= true,
				'public_internet'	= true, /*# turn this off for 'strict' mode*/
			};
			
			$email = arguments.email;
			$options = arguments.options;
			$opts = structNew();
			
			/*foreach ($defaults as $k = $v) $opts[$k] = isset($options[$k]) ? $options[$k] : $v;*/
			/*for($def IN $defaults) {
				$opts[$def] = structKeyExists($options,$def) ? $options[$def] : $def
			}*/
			$m = {};
			structAppend($options,$defaults,false);
			/*
			####################################################################################
			#
			# NO-WS-CTL       =       %d1-8 /         ; US-ASCII control characters
			#                         %d11 /          ;  that do not include the
			#                         %d12 /          ;  carriage return, line feed,
			#                         %d14-31 /       ;  and white space characters
			#                         %d127
			# ALPHA          =  %x41-5A / %x61-7A   ; A-Z / a-z
			# DIGIT          =  %x30-39
			*/
	
			$no_ws_ctl	= "[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x7f]";
			$alpha		= "[\\x41-\\x5a\\x61-\\x7a]";
			$digit		= "[\\x30-\\x39]";
			$cr		= "\\x0d";
			$lf		= "\\x0a";
			$crlf		= "(?:#$cr##$lf#)";
	
			
			/*
			####################################################################################
			#
			# obs-char        =       %d0-9 / %d11 /          ; %d0-127 except CR and
			#                         %d12 / %d14-127         ;  LF
			# obs-text        =       *LF *CR *(obs-char *LF *CR)
			# text            =       %d1-9 /         ; Characters excluding CR and LF
			#                         %d11 /
			#                         %d12 /
			#                         %d14-127 /
			#                         obs-text
			# obs-qp          =       "\" (%d0-127)
			# quoted-pair     =       ("\" text) / obs-qp
			*/
			
			$obs_char	= "[\\x00-\\x09\\x0b\\x0c\\x0e-\\x7f]";
			$obs_text	= "(?:#$lf#*#$cr#*(?:#$obs_char##$lf#*#$cr#*)*)";
			$text		= "(?:[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f]|#$obs_text#)";
	
			/*
			#
			# there's an issue with the definition of 'text', since 'obs_text' can
			# be blank and that allows qp's with no character after the slash. we're
			# treating that as bad, so this just checks we have at least one
			# (non-CRLF) character
			#
			*/
			
			$text		= "(?:#$lf#*#$cr#*#$obs_char##$lf#*#$cr#*)";
			$obs_qp		= "(?:\\x5c[\\x00-\\x7f])";
			$quoted_pair	= "(?:\\x5c#$text#|#$obs_qp#)";
	
	
			/*####################################################################################
			#
			# obs-FWS         =       1*WSP *(CRLF 1*WSP)
			# FWS             =       ([*WSP CRLF] 1*WSP) /   ; Folding white space
			#                         obs-FWS
			# ctext           =       NO-WS-CTL /     ; Non white space controls
			#                         %d33-39 /       ; The rest of the US-ASCII
			#                         %d42-91 /       ;  characters not including "(",
			#                         %d93-126        ;  ")", or "\"
			# ccontent        =       ctext / quoted-pair / comment
			# comment         =       "(" *([FWS] ccontent) [FWS] ")"
			# CFWS            =       *([FWS] comment) (([FWS] comment) / FWS)
	
			#
			# note: we translate ccontent only partially to avoid an infinite loop
			# instead, we'll recursively strip *nested* comments before processing
			# the input. that will leave 'plain old comments' to be matched during
			# the main parse.
			#*/
	
			$wsp		= "[\\x20\\x09]";
			$obs_fws	= "(?:#$wsp#+(?:#$crlf##$wsp#+)*)";
			$fws		= "(?:(?:(?:#$wsp#*#$crlf#)?#$wsp#+)|#$obs_fws#)";
			$ctext		= "(?:#$no_ws_ctl#|[\\x21-\\x27\\x2A-\\x5b\\x5d-\\x7e])";
			$ccontent	= "(?:#$ctext#|#$quoted_pair#)";
			$comment	= "(?:\\x28(?:#$fws#?#$ccontent#)*#$fws#?\\x29)";
			$cfws		= "(?:(?:#$fws#?#$comment#)*(?:#$fws#?#$comment#|#$fws#))";
	
	
			/*#
			# these are the rules for removing *nested* comments. we'll just detect
			# outer comment and replace it with an empty comment, and recurse until
			# we stop.
			#*/
	
			$outer_ccontent_dull	= "(?:#$fws#?#$ctext#|#$quoted_pair#)";
			$outer_ccontent_nest	= "(?:#$fws#?#$comment#)";
			$outer_comment		= "(?:\\x28#$outer_ccontent_dull#*(?:#$outer_ccontent_nest##$outer_ccontent_dull#*)+#$fws#?\\x29)";
	
	
			/*####################################################################################
			#
			# atext           =       ALPHA / DIGIT / ; Any character except controls,
			#                         "!" / "#" /     ;  SP, and specials.
			#                         "$" / "%" /     ;  Used for atoms
			#                         "&" / "'" /
			#                         "*" / "+" /
			#                         "-" / "/" /
			#                         "=" / "?" /
			#                         "^" / "_" /
			#                         "`" / "{" /
			#                         "|" / "}" /
			#                         "~"
			# atom            =       [CFWS] 1*atext [CFWS]*/
	
			$atext		= "(?:#$alpha#|#$digit#|[\\x21\\x23-\\x27\\x2a\\x2b\\x2d\\x2f\\x3d\\x3f\\x5e\\x5f\\x60\\x7b-\\x7e])";
			$atom		= "(?:#$cfws#?(?:#$atext#)+#$cfws#?)";
	
	
			/*####################################################################################
			#
			# qtext           =       NO-WS-CTL /     ; Non white space controls
			#                         %d33 /          ; The rest of the US-ASCII
			#                         %d35-91 /       ;  characters not including "\"
			#                         %d93-126        ;  or the quote character
			# qcontent        =       qtext / quoted-pair
			# quoted-string   =       [CFWS]
			#                         DQUOTE *([FWS] qcontent) [FWS] DQUOTE
			#                         [CFWS]
			# word            =       atom / quoted-string*/
	
			$qtext		= "(?:#$no_ws_ctl#|[\\x21\\x23-\\x5b\\x5d-\\x7e])";
			$qcontent	= "(?:#$qtext#|#$quoted_pair#)";
			$quoted_string	= "(?:#$cfws#?\\x22(?:#$fws#?#$qcontent#)*#$fws#?\\x22#$cfws#?)";
	
			/*#
			# changed the '*' to a '+' to require that quoted strings are not empty
			#*/
	
			$quoted_string	= "(?:#$cfws#?\\x22(?:#$fws#?#$qcontent#)+#$fws#?\\x22#$cfws#?)";
			$word		= "(?:#$atom#|#$quoted_string#)";
	
	
			/*####################################################################################
			#
			# obs-local-part  =       word *("." word)
			# obs-domain      =       atom *("." atom)*/
	
			$obs_local_part	= "(?:#$word#(?:\\x2e#$word#)*)";
			$obs_domain	= "(?:#$atom#(?:\\x2e#$atom#)*)";
	
	
			/*####################################################################################
			#
			# dot-atom-text   =       1*atext *("." 1*atext)
			# dot-atom        =       [CFWS] dot-atom-text [CFWS]*/
	
			$dot_atom_text	= "(?:#$atext#+(?:\\x2e#$atext#+)*)";
			$dot_atom	= "(?:#$cfws#?#$dot_atom_text##$cfws#?)";
	
	
			/*####################################################################################
			#
			# domain-literal  =       [CFWS] "[" *([FWS] dcontent) [FWS] "]" [CFWS]
			# dcontent        =       dtext / quoted-pair
			# dtext           =       NO-WS-CTL /     ; Non white space controls
			# 
			#                         %d33-90 /       ; The rest of the US-ASCII
			#                         %d94-126        ;  characters not including "[",
			#                                         ;  "]", or "\"*/
	
			$dtext		= "(?:#$no_ws_ctl#|[\\x21-\\x5a\\x5e-\\x7e])";
			$dcontent	= "(?:#$dtext#|#$quoted_pair#)";
			$domain_literal	= "(?:#$cfws#?\\x5b(?:#$fws#?#$dcontent#)*#$fws#?\\x5d#$cfws#?)";
	
	
			/*####################################################################################
			#
			# local-part      =       dot-atom / quoted-string / obs-local-part
			# domain          =       dot-atom / domain-literal / obs-domain
			# addr-spec       =       local-part "@" domain*/
	
			$local_part	= "((#$dot_atom#)|(#$quoted_string#)|(#$obs_local_part#))";
			$domain		= "((#$dot_atom#)|(#$domain_literal#)|(#$obs_domain#))";
			$addr_spec	= "#$local_part#\\x40#$domain#";
	
			dump(var=$addr_spec,abort=true);
	
			/*#
			# this was previously 256 based on RFC3696, but dominic's errata was accepted.
			#*/
			
			if (len($email) GT 254) 
			{
			return 0;
			}
	
	
	
			/*#
			# we need to strip nested comments first - we replace them with a simple comment
			#*/
	
			if ($options['allow_comments']){
	
				$email = email_strip_comments($outer_comment, $email, "(x)");
			}
	
	
			/*#
			# now match what's left
			#*/
			
			/*if (!preg_match("!^$addr_spec$!", $email, $m)){
				return 0;
			}*/
			
			$bits = {
				'local'			= structKeyExists($m,1) ? $m[1] : '',
				'local-atom'		= structKeyExists($m,2) ? $m[2] : '',
				'local-quoted'		= structKeyExists($m,3) ? $m[3] : '',
				'local-obs'		= structKeyExists($m,4) ? $m[4] : '',
				'domain'		= structKeyExists($m,5) ? $m[5] : '',
				'domain-atom'		= structKeyExists($m,6) ? $m[6] : '',
				'domain-literal'	= structKeyExists($m,7) ? $m[7] : '',
				'domain-obs'		= structKeyExists($m,8) ? $m[8] : ''
			};
			
			/*#
			# we need to now strip comments from $bits[local] and $bits[domain],
			# since we know they're in the right place and we want them out of the
			# way for checking IPs, label sizes, etc
			#*/
	
			if ($options['allow_comments']){
				$bits['local']	= email_strip_comments($comment, $bits['local']);
				$bits['domain']	= email_strip_comments($comment, $bits['domain']);
			}
	
	
			/*#
			# length limits on segments
			#*/
	
			/*if (len($bits['local']) GT 64) return 0;
			if (len($bits['domain']) GT 255) return 0;*/
	
	
			/*#
			# restrictions on domain-literals from RFC2821 section 4.1.3
			#
			# RFC4291 changed the meaning of :: in IPv6 addresses - i can mean one or
			# more zero groups (updated from 2 or more).
			#*/
	
			if (len($bits['domain-literal'])){
	
				$Snum			= "(\d{1,3})";
				$IPv4_address_literal	= "#$Snum#\.#$Snum#\.#$Snum#\.#$Snum#";
	
				$IPv6_hex		= "(?:[0-9a-fA-F]{1,4})";
	
				$IPv6_full		= "IPv6\:#$IPv#6_hex(?:\:#$IPv#6_hex){7}";
	
				$IPv6_comp_part		= "(?:#$IPv#6_hex(?:\:#$IPv#6_hex){0,7})?";
				$IPv6_comp		= "IPv6\:(#$IPv#6_comp_part\:\:#$IPv#6_comp_part)";
	
				$IPv6v4_full		= "IPv6\:#$IPv#6_hex(?:\:#$IPv#6_hex){5}\:#$IPv#4_address_literal";
	
				$IPv6v4_comp_part	= "#$IPv#6_hex(?:\:#$IPv#6_hex){0,5}";
				$IPv6v4_comp		= "IPv6\:((?:#$IPv#6v4_comp_part)?\:\:(?:#$IPv#6v4_comp_part\:)?)#$IPv#4_address_literal";
	
	
				/*#
				# IPv4 is simple
				#*/
	
				if (preg_match("!^\[#$IPv#4_address_literal\]$!", $bits['domain'], $m)){
	
					/*if (intval($m[1]) GT 255) return 0;
					if (intval($m[2]) GT 255) return 0;
					if (intval($m[3]) GT 255) return 0;
					if (intval($m[4]) GT 255) return 0;*/
	
				}else{
	
					/*#
					# this should be IPv6 - a bunch of tests are needed here :)
					#*/
	
					while (1){
	
						if (preg_match("!^\[#$IPv#6_full\]$!", $bits['domain'])){
							break;
						}
	
						if (preg_match("!^\[#$IPv#6_comp\]$!", $bits['domain'], $m)){
							$a = listFirst($m[1],'::');
							$b = listLast($m[1],'::');
							
							$folded = (len($a) && len($b)) ? "#$a#:#$b#" : "#$a##$b#";
							$groups = listToArray($folded,':');
							
							if (arrayLen($groups) GT 7) {
								/*return 0;*/
							}
							break;
						}
	
						if (preg_match("!^\[#$IPv#6v4_full\]$!", $bits['domain'], $m)){
							/*if (intval($m[1]) GT 255) return 0;
							if (intval($m[2]) GT 255) return 0;
							if (intval($m[3]) GT 255) return 0;
							if (intval($m[4]) GT 255) return 0;*/
							break;
						}
	
						if (preg_match("!^\[#$IPv#6v4_comp\]$!", $bits['domain'], $m)){
							/*list($a, $b) = explode('::', $m[1]);*/
							
							$a = listFirst($m[1],'::');
							$b = listLast($m[1],'::');
							
							$b = substr($b, 0, -1); /*# remove the trailing colon before the IPv4 address*/
							$folded = (len($a) && len($b)) ? "#$a#:#$b#" : "#$a##$b#";
							$groups = listToArray($folded,':');
							/*if (arrayLen($groups) GT 5) return 0;*/
							break;
						}
	
						/*return 0;*/
					}
				}			
			}else{
	
				/*#
				# the domain is either dot-atom or obs-domain - either way, it's
				# made up of simple labels and we split on dots
				#*/
	
				$labels = listToArray($bits['domain'],'.');
	
	
				/*#
				# this is allowed by both dot-atom and obs-domain, but is un-routeable on the
				# public internet, so we'll fail it (e.g. user@localhost)
				#*/
				if ($options['public_internet']){
					/*if (arrayLen($labels) == 1) return 0;*/
				}
	
	
				/*#
				# checks on each label
				#*/
				for ($label IN $labels){
					/*if (len($label) GT 63) return 0;
					if (mid($label, 1, 1) == '-') return 0;
					if (mid($label, 1, -1) == '-') return 0;*/
				}
	
	
				/*
				#
				# last label can't be all numeric
				#
				*/
	
				if ($options['public_internet']){
					/*if (preg_match('!^[0-9]+$!', array_pop($labels))) return 0;*/
				}
			}
	
	
			return 1;
	</cfscript>
	</cffunction>
	
	<!---##################################################################################--->

	<cffunction name="email_strip_comments" access="private">
		<cfargument name="comment" type="string" required="yes" default="" />
		<cfargument name="email" type="string" required="yes" default="" />
		<cfargument name="replace" type="string" required="no" default="" />
		
		<cfset var $comment = arguments.comment />
		<cfset var $replace = arguments.replace />
		<!---
		($comment, $email, $replace=''){ --->
		<cfscript>
			$comment = arguments.comment;
			while (1){
				$new = reReplaceNoCase($email,"!$comment!",$replace);
				if (len($new) == len($email)){
					return $email;
				}
				$email = $new;
			}
		</cfscript>
	</cffunction>
	<!---##################################################################################--->
	
	<cffunction name="preg_match" hint="php port">
		<cfargument name="$pattern" type="string" />
		<cfargument name="$subject" type="string" />
		<cfargument name="$match" type="any" />
		
		<cfset $matches = REMatchNoCase($pattern, $subject) />
		
		<cfif arrayLen($matches) GT 0>
			<cfset variables[arguments.$match] = $matches />
			<cfreturn true>
		<cfelse>
			<cfset variables[arguments.$match] = {} />
			<cfreturn false>
		</cfif>
	</cffunction>
	
	<cffunction name="array_pop" hint="php port">
		<cfargument name="arr" type="array">
		
		<cfset var lastElement = "" />
		<cfset var theArr = arguments.arr />
		<cfif arrayLen(theArr) GT 0>
			<cfif arrayLen(theArr) GT 1>
				<cfset lastElement = theArr[arrayLen(theArr)] />
				<cfset arrayDeleteAt(theArr,arrayLen(theArr)) />
			<cfelse>
				<cfset lastElement = "" />
				<cfset arrayDeleteAt(theArr,1) />
			</cfif>
		</cfif>
		
		<cfreturn lastElement />
	</cffunction>
</cfcomponent>