<cfscript>
			function stripAllBut(str,strip) {
				var badList = "\";
				var okList = "\\";
				var bCS = true;
			
				if(arrayLen(arguments) gte 3) bCS = arguments[3];
			
				strip = replaceList(strip,badList,okList);
				
				if(bCS) return rereplace(str,"[^#strip#]","","all");
				else return rereplaceNoCase(str,"[^#strip#]","","all");
			}
		</cfscript>