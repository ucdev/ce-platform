<cfcomponent displayname="ACCME Summary Report" output="no">
	<cfimport taglib="/_poi/" prefix="poi" />
	
	<!--- CONFIGURATION --->
	<cfset ReportPath = ExpandPath("#Application.Settings.RootPath#/_reports/11/")>
	
	<cfif NOT DirectoryExists("#ReportPath#")><cfdirectory action="Create" directory="#ReportPath#"></cfif>
	
	<!--- RUN METHOD --->
	<cffunction name="Run" access="remote" output="yes">
		<cfargument name="StartDate" type="string" required="yes">
		<cfargument name="EndDate" type="string" required="yes">
			
		<cfset var Status = "">
		<cfset var TotalPeople = 0>
		<cfset var TotalHrsOfInstruct = 0>
        <cfset var Activities = structNew()>
		<cfif Arguments.StartDate EQ "">
            <cfset Status = "Fail|Start Date is required.">
        </cfif>
        
        <cfif Arguments.EndDate EQ "">
            <cfif Status EQ "">
                <cfset Status = "Fail|End Date is required.">
            <cfelse>
                <cfset Status = "Fail|Start Date and End Date is required.">
            </cfif>
        </cfif>
        
        <cfif Status EQ "">
			<!---
			=========================================
			DIRECT SPONSORSHIP
			=========================================
			--->
			
			<!--- DIRECT > LIVE > COURSES --->
			<cfset Activities.Direct.Live.Courses.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=1
														)>
			
			<cfset Activities.Direct.Live.Courses.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Live.Courses.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=1),true)>
			
			<!--- DIRECT > LIVE > RSS --->
			<cfset Activities.Direct.Live.RSS.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=2
														)>
			
			<cfset Activities.Direct.Live.RSS.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Live.RSS.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=2),true)>
			
			
			<!--- DIRECT > LIVE > INTERNET --->
			<cfset Activities.Direct.Live.Internet.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=3
														)>
			
			<cfset Activities.Direct.Live.Internet.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Live.Internet.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=3),true)>
			
			
			
														
			<!--- DIRECT > LIVE > TEST ITEM WRITING --->
			<cfset Activities.Direct.Live.TestItemWriting.Count = 0>
			<cfset Activities.Direct.Live.TestItemWriting.Stats.Hours = 0>
			<cfset Activities.Direct.Live.TestItemWriting.Stats.Attendees = 0>
			<cfset Activities.Direct.Live.TestItemWriting.Stats.MD = 0>
			<cfset Activities.Direct.Live.TestItemWriting.Stats.NonMD = 0>
			
			<!--- DIRECT > LIVE > COMMITTEE LEARNING --->
			<cfset Activities.Direct.Live.CommitteeLearning.Count = 0>
			<cfset Activities.Direct.Live.CommitteeLearning.Stats.Hours = 0>
			<cfset Activities.Direct.Live.CommitteeLearning.Stats.Attendees = 0>
			<cfset Activities.Direct.Live.CommitteeLearning.Stats.MD = 0>
			<cfset Activities.Direct.Live.CommitteeLearning.Stats.NonMD = 0>
			
			<!--- DIRECT > LIVE > PERFORMANCE IMPROVEMENT --->
			<cfset Activities.Direct.Live.Performance.Count = 0>
			<cfset Activities.Direct.Live.Performance.Stats.Hours = 0>
			<cfset Activities.Direct.Live.Performance.Stats.Attendees = 0>
			<cfset Activities.Direct.Live.Performance.Stats.MD = 0>
			<cfset Activities.Direct.Live.Performance.Stats.NonMD = 0>
			
			<!--- DIRECT > LIVE > INTERNET SEARCHING AND LEARNING --->
			<cfset Activities.Direct.Live.InternetSearching.Count = 0>
			<cfset Activities.Direct.Live.InternetSearching.Stats.Hours = 0>
			<cfset Activities.Direct.Live.InternetSearching.Stats.Attendees = 0>
			<cfset Activities.Direct.Live.InternetSearching.Stats.MD = 0>
			<cfset Activities.Direct.Live.InternetSearching.Stats.NonMD = 0>
			
			<!--- DIRECT > LIVE > MANUSCRIPT --->
			<cfset Activities.Direct.Live.Manuscript.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=4
														)>
			
			<cfset Activities.Direct.Live.Manuscript.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Live.Manuscript.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=4),true)>
			
			<!--- DIRECT > LIVE > TEACHING --->
			<cfset Activities.Direct.Live.Teaching.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=5
														)>
			
			<cfset Activities.Direct.Live.Teaching.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Live.Teaching.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=5),true)>
			
			<!--- DIRECT > ENDURING > INTERNET --->
			<cfset Activities.Direct.Enduring.Internet.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=6
														)>
			
			<cfset Activities.Direct.Enduring.Internet.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Enduring.Internet.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=6),true)>
			
			<!--- DIRECT > ENDURING > PRINT --->
			<cfset Activities.Direct.Enduring.Print.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=7
														)>
			
			<cfset Activities.Direct.Enduring.Print.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Enduring.Print.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=7),true)>
			
			<!--- DIRECT > ENDURING > CD --->
			<cfset Activities.Direct.Enduring.CD.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=8
														)>
			
			<cfset Activities.Direct.Enduring.CD.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Enduring.CD.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=8),true)>
			
			<!--- DIRECT > ENDURING > AUDIO --->
			<cfset Activities.Direct.Enduring.Audio.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=9
														)>
			
			<cfset Activities.Direct.Enduring.Audio.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Enduring.Audio.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=9),true)>
			
			<!--- DIRECT > ENDURING > VIDEO --->
			<cfset Activities.Direct.Enduring.Video.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='D',
															Grouping=10
														)>
			
			<cfset Activities.Direct.Enduring.Video.Stats = structNew()>
			<cfset StructAppend(Activities.Direct.Enduring.Video.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='D',
													Grouping=10),true)>
											
			<!--- DIRECT > ENDURING > OTHER
				Note: this is a total for ACCME of all enduring activities that are NOT internet --->
			<cfset Activities.Direct.Enduring.Other.Count = 	Activities.Direct.Enduring.Print.Count +
																Activities.Direct.Enduring.CD.Count +
																Activities.Direct.Enduring.Audio.Count +
																Activities.Direct.Enduring.Video.Count
																>
																
			<cfset Activities.Direct.Enduring.Other.Stats.Hours = 	Activities.Direct.Enduring.Print.Stats.Hours +
																	Activities.Direct.Enduring.CD.Stats.Hours +
																	Activities.Direct.Enduring.Audio.Stats.Hours +
																	Activities.Direct.Enduring.Video.Stats.Hours
																	>
			
			<cfset Activities.Direct.Enduring.Other.Stats.Attendees = 	Activities.Direct.Enduring.Print.Stats.Attendees +
																		Activities.Direct.Enduring.CD.Stats.Attendees +
																		Activities.Direct.Enduring.Audio.Stats.Attendees +
																		Activities.Direct.Enduring.Video.Stats.Attendees
																		>
			
			<cfset Activities.Direct.Enduring.Other.Stats.MD = 	Activities.Direct.Enduring.Print.Stats.MD +
																	Activities.Direct.Enduring.CD.Stats.MD +
																	Activities.Direct.Enduring.Audio.Stats.MD +
																	Activities.Direct.Enduring.Video.Stats.MD
																	>
			
			<cfset Activities.Direct.Enduring.Other.Stats.NonMD = 	Activities.Direct.Enduring.Print.Stats.NonMD +
																	Activities.Direct.Enduring.CD.Stats.NonMD +
																	Activities.Direct.Enduring.Audio.Stats.NonMD +
																	Activities.Direct.Enduring.Video.Stats.NonMD
																	>
			
														
			<!--- DIRECT > JOURNAL-BASED > JOURNAL CME --->
			<cfset Activities.Direct.JournalBased.JournalCME.Count = 0>
			<cfset Activities.Direct.JournalBased.JournalCME.Stats.Hours = 0>
			<cfset Activities.Direct.JournalBased.JournalCME.Stats.Attendees = 0>
			<cfset Activities.Direct.JournalBased.JournalCME.Stats.MD = 0>
			<cfset Activities.Direct.JournalBased.JournalCME.Stats.NonMD = 0>
			
			<!--- DIRECT > TOTALS --->
			
			<!--- DIRECT > LIVE > TOTALS --->
        	<cfset Activities.Direct.Live.Total.Count = Activities.Direct.Live.Courses.Count +
													 Activities.Direct.Live.RSS.Count +
													 Activities.Direct.Live.Internet.Count +
													 Activities.Direct.Live.TestItemWriting.Count +
													 Activities.Direct.Live.CommitteeLearning.Count +
													 Activities.Direct.Live.Performance.Count +
													 Activities.Direct.Live.InternetSearching.Count +
													 Activities.Direct.Live.Manuscript.Count +
													 Activities.Direct.Live.Teaching.Count>
			
			<cfset Activities.Direct.Live.Total.Hours = Activities.Direct.Live.Courses.Stats.Hours +
													 Activities.Direct.Live.RSS.Stats.Hours +
													 Activities.Direct.Live.Internet.Stats.Hours +
													 Activities.Direct.Live.TestItemWriting.Stats.Hours +
													 Activities.Direct.Live.CommitteeLearning.Stats.Hours +
													 Activities.Direct.Live.Performance.Stats.Hours +
													 Activities.Direct.Live.InternetSearching.Stats.Hours +
													 Activities.Direct.Live.Manuscript.Stats.Hours +
													 Activities.Direct.Live.Teaching.Stats.Hours>
			
			<cfset Activities.Direct.Live.Total.Attendees = Activities.Direct.Live.Courses.Stats.Attendees +
													 Activities.Direct.Live.RSS.Stats.Attendees +
													 Activities.Direct.Live.Internet.Stats.Attendees +
													 Activities.Direct.Live.TestItemWriting.Stats.Attendees +
													 Activities.Direct.Live.CommitteeLearning.Stats.Attendees +
													 Activities.Direct.Live.Performance.Stats.Attendees +
													 Activities.Direct.Live.InternetSearching.Stats.Attendees +
													 Activities.Direct.Live.Manuscript.Stats.Attendees +
													 Activities.Direct.Live.Teaching.Stats.Attendees>
			
			<cfset Activities.Direct.Live.Total.MD = Activities.Direct.Live.Courses.Stats.MD +
													 Activities.Direct.Live.RSS.Stats.MD +
													 Activities.Direct.Live.Internet.Stats.MD +
													 Activities.Direct.Live.TestItemWriting.Stats.MD +
													 Activities.Direct.Live.CommitteeLearning.Stats.MD +
													 Activities.Direct.Live.Performance.Stats.MD +
													 Activities.Direct.Live.InternetSearching.Stats.MD +
													 Activities.Direct.Live.Manuscript.Stats.MD +
													 Activities.Direct.Live.Teaching.Stats.MD>
			
			<cfset Activities.Direct.Live.Total.NonMD = Activities.Direct.Live.Courses.Stats.NonMD +
													 Activities.Direct.Live.RSS.Stats.NonMD +
													 Activities.Direct.Live.Internet.Stats.NonMD +
													 Activities.Direct.Live.TestItemWriting.Stats.NonMD +
													 Activities.Direct.Live.CommitteeLearning.Stats.NonMD +
													 Activities.Direct.Live.Performance.Stats.NonMD +
													 Activities.Direct.Live.InternetSearching.Stats.NonMD +
													 Activities.Direct.Live.Manuscript.Stats.NonMD +
													 Activities.Direct.Live.Teaching.Stats.NonMD>
													 
			<!--- DIRECT > ENDURING > TOTALS --->
        	<cfset Activities.Direct.Enduring.Total.Count = Activities.Direct.Enduring.Internet.Count +
													 		Activities.Direct.Enduring.Other.Count>
			
			<cfset Activities.Direct.Enduring.Total.Hours = Activities.Direct.Enduring.Internet.Stats.Hours +
													 		Activities.Direct.Enduring.Other.Stats.Hours>
			
			<cfset Activities.Direct.Enduring.Total.Attendees = Activities.Direct.Enduring.Internet.Stats.Attendees +
													 			Activities.Direct.Enduring.Other.Stats.Attendees>
			
			<cfset Activities.Direct.Enduring.Total.MD = Activities.Direct.Enduring.Internet.Stats.MD +
													 	 Activities.Direct.Enduring.Other.Stats.MD>
			
			<cfset Activities.Direct.Enduring.Total.NonMD = Activities.Direct.Enduring.Internet.Stats.NonMD +
													 		Activities.Direct.Enduring.Other.Stats.NonMD>
															
			<!--- DIRECT > JOURNAL-BASED > TOTALS --->
        	<cfset Activities.Direct.JournalBased.Total.Count = Activities.Direct.JournalBased.JournalCME.Count>
			<cfset Activities.Direct.JournalBased.Total.Hours = Activities.Direct.JournalBased.JournalCME.Stats.Hours>
			<cfset Activities.Direct.JournalBased.Total.Attendees = Activities.Direct.JournalBased.JournalCME.Stats.Attendees>
			<cfset Activities.Direct.JournalBased.Total.MD = Activities.Direct.JournalBased.JournalCME.Stats.MD>
			<cfset Activities.Direct.JournalBased.Total.NonMD = Activities.Direct.JournalBased.JournalCME.Stats.NonMD>
			
			<!--- DIRECT > ALL > TOTALS --->
			<cfset Activities.Direct.Total.Count = Activities.Direct.Live.Total.Count +
													Activities.Direct.Enduring.Total.Count +
													Activities.Direct.JournalBased.Total.Count>
													
			<cfset Activities.Direct.Total.Hours = Activities.Direct.Live.Total.Hours +
													Activities.Direct.Enduring.Total.Hours +
													Activities.Direct.JournalBased.Total.Hours>
													
			<cfset Activities.Direct.Total.Attendees = Activities.Direct.Live.Total.Attendees +
													Activities.Direct.Enduring.Total.Attendees +
													Activities.Direct.JournalBased.Total.Attendees>
													
			<cfset Activities.Direct.Total.MD = Activities.Direct.Live.Total.MD +
													Activities.Direct.Enduring.Total.MD +
													Activities.Direct.JournalBased.Total.MD>
													
			<cfset Activities.Direct.Total.NonMD = Activities.Direct.Live.Total.NonMD +
													Activities.Direct.Enduring.Total.NonMD +
													Activities.Direct.JournalBased.Total.NonMD>
			
			<!--- |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| --->
			
			<!---
			=========================================
			JOINT SPONSORSHIP
			=========================================
			--->
			
			<!--- JOINT > LIVE > COURSES --->
			<cfset Activities.Joint.Live.Courses.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=1
														)>
			
			<cfset Activities.Joint.Live.Courses.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Live.Courses.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=1),true)>
			
			<!--- JOINT > LIVE > RSS --->
			<cfset Activities.Joint.Live.RSS.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=2
														)>
			
			<cfset Activities.Joint.Live.RSS.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Live.RSS.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=2),true)>
			
			
			<!--- JOINT > LIVE > INTERNET --->
			<cfset Activities.Joint.Live.Internet.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=3
														)>
			
			<cfset Activities.Joint.Live.Internet.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Live.Internet.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=3),true)>
			
			
			
														
			<!--- JOINT > LIVE > TEST ITEM WRITING --->
			<cfset Activities.Joint.Live.TestItemWriting.Count = 0>
			<cfset Activities.Joint.Live.TestItemWriting.Stats.Hours = 0>
			<cfset Activities.Joint.Live.TestItemWriting.Stats.Attendees = 0>
			<cfset Activities.Joint.Live.TestItemWriting.Stats.MD = 0>
			<cfset Activities.Joint.Live.TestItemWriting.Stats.NonMD = 0>
			
			<!--- JOINT > LIVE > COMMITTEE LEARNING --->
			<cfset Activities.Joint.Live.CommitteeLearning.Count = 0>
			<cfset Activities.Joint.Live.CommitteeLearning.Stats.Hours = 0>
			<cfset Activities.Joint.Live.CommitteeLearning.Stats.Attendees = 0>
			<cfset Activities.Joint.Live.CommitteeLearning.Stats.MD = 0>
			<cfset Activities.Joint.Live.CommitteeLearning.Stats.NonMD = 0>
			
			<!--- JOINT > LIVE > PERFORMANCE IMPROVEMENT --->
			<cfset Activities.Joint.Live.Performance.Count = 0>
			<cfset Activities.Joint.Live.Performance.Stats.Hours = 0>
			<cfset Activities.Joint.Live.Performance.Stats.Attendees = 0>
			<cfset Activities.Joint.Live.Performance.Stats.MD = 0>
			<cfset Activities.Joint.Live.Performance.Stats.NonMD = 0>
			
			<!--- JOINT > LIVE > INTERNET SEARCHING AND LEARNING --->
			<cfset Activities.Joint.Live.InternetSearching.Count = 0>
			<cfset Activities.Joint.Live.InternetSearching.Stats.Hours = 0>
			<cfset Activities.Joint.Live.InternetSearching.Stats.Attendees = 0>
			<cfset Activities.Joint.Live.InternetSearching.Stats.MD = 0>
			<cfset Activities.Joint.Live.InternetSearching.Stats.NonMD = 0>
			
			<!--- JOINT > LIVE > MANUSCRIPT --->
			<cfset Activities.Joint.Live.Manuscript.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=4
														)>
			
			<cfset Activities.Joint.Live.Manuscript.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Live.Manuscript.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=4),true)>
			
			<!--- JOINT > LIVE > TEACHING --->
			<cfset Activities.Joint.Live.Teaching.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=5
														)>
			
			<cfset Activities.Joint.Live.Teaching.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Live.Teaching.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=5),true)>
			
			<!--- JOINT > ENDURING > INTERNET --->
			<cfset Activities.Joint.Enduring.Internet.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=6
														)>
			
			<cfset Activities.Joint.Enduring.Internet.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Enduring.Internet.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=6),true)>
			
			<!--- JOINT > ENDURING > PRINT --->
			<cfset Activities.Joint.Enduring.Print.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=7
														)>
			
			<cfset Activities.Joint.Enduring.Print.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Enduring.Print.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=7),true)>
			
			<!--- JOINT > ENDURING > CD --->
			<cfset Activities.Joint.Enduring.CD.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=8
														)>
			
			<cfset Activities.Joint.Enduring.CD.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Enduring.CD.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=8),true)>
			
			<!--- JOINT > ENDURING > AUDIO --->
			<cfset Activities.Joint.Enduring.Audio.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=9
														)>
			
			<cfset Activities.Joint.Enduring.Audio.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Enduring.Audio.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=9),true)>
			
			<!--- JOINT > ENDURING > VIDEO --->
			<cfset Activities.Joint.Enduring.Video.Count = getActivityCount(StartDate=Arguments.StartDate,
															EndDate=Arguments.EndDate,
															Sponsorship='J',
															Grouping=10
														)>
			
			<cfset Activities.Joint.Enduring.Video.Stats = structNew()>
			<cfset StructAppend(Activities.Joint.Enduring.Video.Stats,getActivityStats(StartDate=Arguments.StartDate,
													EndDate=Arguments.EndDate,
													Sponsorship='J',
													Grouping=10),true)>
											
			<!--- JOINT > ENDURING > OTHER
				Note: this is a total for ACCME of all enduring activities that are NOT internet --->
			<cfset Activities.Joint.Enduring.Other.Count = 	Activities.Joint.Enduring.Print.Count +
																Activities.Joint.Enduring.CD.Count +
																Activities.Joint.Enduring.Audio.Count +
																Activities.Joint.Enduring.Video.Count
																>
																
			<cfset Activities.Joint.Enduring.Other.Stats.Hours = 	Activities.Joint.Enduring.Print.Stats.Hours +
																	Activities.Joint.Enduring.CD.Stats.Hours +
																	Activities.Joint.Enduring.Audio.Stats.Hours +
																	Activities.Joint.Enduring.Video.Stats.Hours
																	>
			
			<cfset Activities.Joint.Enduring.Other.Stats.Attendees = 	Activities.Joint.Enduring.Print.Stats.Attendees +
																		Activities.Joint.Enduring.CD.Stats.Attendees +
																		Activities.Joint.Enduring.Audio.Stats.Attendees +
																		Activities.Joint.Enduring.Video.Stats.Attendees
																		>
			
			<cfset Activities.Joint.Enduring.Other.Stats.MD = 	Activities.Joint.Enduring.Print.Stats.MD +
																	Activities.Joint.Enduring.CD.Stats.MD +
																	Activities.Joint.Enduring.Audio.Stats.MD +
																	Activities.Joint.Enduring.Video.Stats.MD
																	>
			
			<cfset Activities.Joint.Enduring.Other.Stats.NonMD = 	Activities.Joint.Enduring.Print.Stats.NonMD +
																	Activities.Joint.Enduring.CD.Stats.NonMD +
																	Activities.Joint.Enduring.Audio.Stats.NonMD +
																	Activities.Joint.Enduring.Video.Stats.NonMD
																	>
			
														
			<!--- JOINT > JOURNAL-BASED > JOURNAL CME --->
			<cfset Activities.Joint.JournalBased.JournalCME.Count = 0>
			<cfset Activities.Joint.JournalBased.JournalCME.Stats.Hours = 0>
			<cfset Activities.Joint.JournalBased.JournalCME.Stats.Attendees = 0>
			<cfset Activities.Joint.JournalBased.JournalCME.Stats.MD = 0>
			<cfset Activities.Joint.JournalBased.JournalCME.Stats.NonMD = 0>
            
			<!--- JOINT > TOTALS --->
			
			<!--- JOINT > LIVE > TOTALS --->
        	<cfset Activities.Joint.Live.Total.Count = Activities.Joint.Live.Courses.Count +
													 Activities.Joint.Live.RSS.Count +
													 Activities.Joint.Live.Internet.Count +
													 Activities.Joint.Live.TestItemWriting.Count +
													 Activities.Joint.Live.CommitteeLearning.Count +
													 Activities.Joint.Live.Performance.Count +
													 Activities.Joint.Live.InternetSearching.Count +
													 Activities.Joint.Live.Manuscript.Count +
													 Activities.Joint.Live.Teaching.Count>
			
			<cfset Activities.Joint.Live.Total.Hours = Activities.Joint.Live.Courses.Stats.Hours +
													 Activities.Joint.Live.RSS.Stats.Hours +
													 Activities.Joint.Live.Internet.Stats.Hours +
													 Activities.Joint.Live.TestItemWriting.Stats.Hours +
													 Activities.Joint.Live.CommitteeLearning.Stats.Hours +
													 Activities.Joint.Live.Performance.Stats.Hours +
													 Activities.Joint.Live.InternetSearching.Stats.Hours +
													 Activities.Joint.Live.Manuscript.Stats.Hours +
													 Activities.Joint.Live.Teaching.Stats.Hours>
			
			<cfset Activities.Joint.Live.Total.Attendees = Activities.Joint.Live.Courses.Stats.Attendees +
													 Activities.Joint.Live.RSS.Stats.Attendees +
													 Activities.Joint.Live.Internet.Stats.Attendees +
													 Activities.Joint.Live.TestItemWriting.Stats.Attendees +
													 Activities.Joint.Live.CommitteeLearning.Stats.Attendees +
													 Activities.Joint.Live.Performance.Stats.Attendees +
													 Activities.Joint.Live.InternetSearching.Stats.Attendees +
													 Activities.Joint.Live.Manuscript.Stats.Attendees +
													 Activities.Joint.Live.Teaching.Stats.Attendees>
			
			<cfset Activities.Joint.Live.Total.MD = Activities.Joint.Live.Courses.Stats.MD +
													 Activities.Joint.Live.RSS.Stats.MD +
													 Activities.Joint.Live.Internet.Stats.MD +
													 Activities.Joint.Live.TestItemWriting.Stats.MD +
													 Activities.Joint.Live.CommitteeLearning.Stats.MD +
													 Activities.Joint.Live.Performance.Stats.MD +
													 Activities.Joint.Live.InternetSearching.Stats.MD +
													 Activities.Joint.Live.Manuscript.Stats.MD +
													 Activities.Joint.Live.Teaching.Stats.MD>
			
			<cfset Activities.Joint.Live.Total.NonMD = Activities.Joint.Live.Courses.Stats.NonMD +
													 Activities.Joint.Live.RSS.Stats.NonMD +
													 Activities.Joint.Live.Internet.Stats.NonMD +
													 Activities.Joint.Live.TestItemWriting.Stats.NonMD +
													 Activities.Joint.Live.CommitteeLearning.Stats.NonMD +
													 Activities.Joint.Live.Performance.Stats.NonMD +
													 Activities.Joint.Live.InternetSearching.Stats.NonMD +
													 Activities.Joint.Live.Manuscript.Stats.NonMD +
													 Activities.Joint.Live.Teaching.Stats.NonMD>
													 
			<!--- JOINT > ENDURING > TOTALS --->
        	<cfset Activities.Joint.Enduring.Total.Count = Activities.Joint.Enduring.Internet.Count +
													 		Activities.Joint.Enduring.Other.Count>
			
			<cfset Activities.Joint.Enduring.Total.Hours = Activities.Joint.Enduring.Internet.Stats.Hours +
													 		Activities.Joint.Enduring.Other.Stats.Hours>
			
			<cfset Activities.Joint.Enduring.Total.Attendees = Activities.Joint.Enduring.Internet.Stats.Attendees +
													 			Activities.Joint.Enduring.Other.Stats.Attendees>
			
			<cfset Activities.Joint.Enduring.Total.MD = Activities.Joint.Enduring.Internet.Stats.MD +
													 	 Activities.Joint.Enduring.Other.Stats.MD>
			
			<cfset Activities.Joint.Enduring.Total.NonMD = Activities.Joint.Enduring.Internet.Stats.NonMD +
													 		Activities.Joint.Enduring.Other.Stats.NonMD>
															
			<!--- JOINT > JOURNAL-BASED > TOTALS --->
        	<cfset Activities.Joint.JournalBased.Total.Count = Activities.Joint.JournalBased.JournalCME.Count>
			<cfset Activities.Joint.JournalBased.Total.Hours = Activities.Joint.JournalBased.JournalCME.Stats.Hours>
			<cfset Activities.Joint.JournalBased.Total.Attendees = Activities.Joint.JournalBased.JournalCME.Stats.Attendees>
			<cfset Activities.Joint.JournalBased.Total.MD = Activities.Joint.JournalBased.JournalCME.Stats.MD>
			<cfset Activities.Joint.JournalBased.Total.NonMD = Activities.Joint.JournalBased.JournalCME.Stats.NonMD>
			
			<!--- JOINT > ALL > TOTALS --->
			<cfset Activities.Joint.Total.Count = Activities.Joint.Live.Total.Count +
													Activities.Joint.Enduring.Total.Count +
													Activities.Joint.JournalBased.Total.Count>
													
			<cfset Activities.Joint.Total.Hours = Activities.Joint.Live.Total.Hours +
													Activities.Joint.Enduring.Total.Hours +
													Activities.Joint.JournalBased.Total.Hours>
													
			<cfset Activities.Joint.Total.Attendees = Activities.Joint.Live.Total.Attendees +
													Activities.Joint.Enduring.Total.Attendees +
													Activities.Joint.JournalBased.Total.Attendees>
													
			<cfset Activities.Joint.Total.MD = Activities.Joint.Live.Total.MD +
													Activities.Joint.Enduring.Total.MD +
													Activities.Joint.JournalBased.Total.MD>
													
			<cfset Activities.Joint.Total.NonMD = Activities.Joint.Live.Total.NonMD +
													Activities.Joint.Enduring.Total.NonMD +
													Activities.Joint.JournalBased.Total.NonMD>
			
			<!--- GRAND TOTALS --->
			<cfset Activities.Total.Count = Activities.Direct.Total.Count + Activities.Joint.Total.Count>
			<cfset Activities.Total.Hours = Activities.Direct.Total.Hours + Activities.Joint.Total.Hours>
			<cfset Activities.Total.Attendees = Activities.Direct.Total.Attendees + Activities.Joint.Total.Attendees>
			<cfset Activities.Total.MD = Activities.Direct.Total.MD + Activities.Joint.Total.MD>
			<cfset Activities.Total.NonMD = Activities.Direct.Total.NonMD + Activities.Joint.Total.NonMD>
			
			<!--- DOLLAR AMOUNTS --->
			<cfset Activities.Total.CommSupport = getDollars("1,5",Arguments.StartDate,Arguments.EndDate)>
			<cfset Activities.Total.Exhibitors = getDollars("2",Arguments.StartDate,Arguments.EndDate)>
			<cfset Activities.Total.OtherSources = getDollars("3,4",Arguments.StartDate,Arguments.EndDate)>
			
			<cfset createTheExcel(Activities)>
            <!--- Excel Section --->
            <cftry>
                <!--- Start Building Excel file --->
               
                                    
                <cfset Status = "Success|Your report has been generated!">
                <cfcatch type="any">
                    <cfset Status = "Fail|Error: " & cfcatch.Message>
                </cfcatch>
            </cftry>
        </cfif>
		
		<cfheader name="Content-Type" value="application/msexcel">
		<cfheader name="Content-Disposition" value="attachment; filename=#ReportFileName#">
		<cfcontent type="application/msexcel" file="#ReportPath##ReportFileName#" deletefile="No">
	</cffunction>
	
	<cffunction name="getActivityCount" access="private" output="no" returntype="numeric">
		<cfargument name="StartDate" type="string" required="yes" />
		<cfargument name="EndDate" type="string" required="yes" />
		<cfargument name="Grouping" type="numeric" required="yes" />
		<cfargument name="Sponsorship" type="string" required="yes" />
		
		<cfset var qGetCount = "">
		<cfset var ReturnCount = 0>
		
		<cfquery name="qGetCount" datasource="#Application.Settings.DSN#">
			DECLARE @StartDate datetime;
			DECLARE @EndDate datetime;
			DECLARE @Grouping int;
			DECLARE @Sponsorship nchar(1);
			
			SET @StartDate = <cfqueryparam value="#Arguments.StartDate# 00:00:00" cfsqltype="cf_sql_date" />;
			SET @EndDate = <cfqueryparam value="#Arguments.EndDate# 00:00:00" cfsqltype="cf_sql_date" />;
			SET @Grouping = <cfqueryparam value="#Arguments.Grouping#" cfsqltype="cf_sql_integer" />;
			SET @Sponsorship = <cfqueryparam value="#Arguments.Sponsorship#" cfsqltype="cf_sql_varchar" />;
			
			IF @Grouping = 2
			BEGIN
				SELECT Count(A.ActivityID) AS ActivityCount
				FROM ce_Activity As A
				WHERE 
						(A.ParentActivityID IS NULL) AND 
						(A.GroupingID = @Grouping) AND 
						(A.StatusID IN (1,2,3)) AND 
						(A.Sponsorship = @Sponsorship) AND 
						(A.DeletedFlag = 'N') AND 
						(SELECT Count(ActivityID) 
						FROM ce_Activity As A2 
						WHERE 
							(A2.ParentActivityID=A.ActivityID) AND 
							(A2.StartDate BETWEEN @StartDate AND @EndDate) AND 
							(A2.StatusID IN (1,2,3)) AND 
							(A2.DeletedFlag='N') AND 
							(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A2.ActivityID AND ACr.CreditID=1) > 0
								OR
							(A2.ParentActivityID=A.ActivityID) AND 
							(A2.EndDate BETWEEN @StartDate AND @EndDate) AND 
							(A2.StatusID IN (1,2,3)) AND 
							(A2.DeletedFlag='N') AND 
							(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A2.ActivityID AND ACr.CreditID=1) > 0
							) > 0
			END
			ELSE IF @Grouping = 6 OR @Grouping = 7 OR @Grouping = 8 OR @Grouping = 9 OR @Grouping = 10
			BEGIN
				SELECT Count(A.ActivityID) AS ActivityCount
				FROM ce_Activity As A
				WHERE 
						(A.ParentActivityID IS NULL) AND 
						(A.GroupingID = @Grouping) AND 
						(A.StatusID IN (1,2,3)) AND 
						(A.Sponsorship = @Sponsorship) AND 
						(A.DeletedFlag = 'N') AND 
						(SELECT Count(attendeeid) FROM ce_Attendee AS Att WHERE Att.ActivityID = A.ActivityID AND Att.CompleteDate BETWEEN @StartDate AND @EndDate) > 0 AND
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1) > 0 AND
						(A.StartDate BETWEEN @StartDate AND @EndDate)
					OR
						(A.ParentActivityID IS NULL) AND 
						(A.GroupingID = @Grouping) AND 
						(A.StatusID IN (1,2,3)) AND 
						(A.Sponsorship = @Sponsorship) AND 
						(A.DeletedFlag = 'N') AND 
						(SELECT Count(attendeeid) FROM ce_Attendee AS Att WHERE Att.ActivityID = A.ActivityID AND Att.CompleteDate BETWEEN @StartDate AND @EndDate) > 0 AND
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1) > 0 AND
						(A.EndDate BETWEEN @StartDate AND @EndDate)
			END
			ELSE
				SELECT Count(A.ActivityID) AS ActivityCount
				FROM ce_Activity As A
				WHERE 
						(A.ParentActivityID IS NULL) AND 
						(A.GroupingID = @Grouping) AND 
						(A.StatusID IN (1,2,3)) AND 
						(A.Sponsorship = @Sponsorship) AND 
						(A.DeletedFlag = 'N') AND 
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1) > 0 AND
						(A.StartDate BETWEEN @StartDate AND @EndDate)
					OR
						(A.ParentActivityID IS NULL) AND 
						(A.GroupingID = @Grouping) AND 
						(A.StatusID IN (1,2,3)) AND 
						(A.Sponsorship = @Sponsorship) AND 
						(A.DeletedFlag = 'N') AND 
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1) > 0 AND
						(A.EndDate BETWEEN @StartDate AND @EndDate)
		</cfquery>
		
		<cfif qGetCount.ActivityCount GT 0>
			<cfset ReturnCount = qGetCount.ActivityCount>
		</cfif>
		<cfreturn ReturnCount />
	</cffunction>
	
	<cffunction name="getActivityStats" access="private" output="no" returntype="struct">
		<cfargument name="StartDate" type="string" required="yes" />
		<cfargument name="EndDate" type="string" required="yes" />
		<cfargument name="Grouping" type="numeric" required="yes" />
		<cfargument name="Sponsorship" type="string" required="yes" />
		
		<cfset var qGetStats = "">
		<cfset var StatStruct = structNew()>
		<cfset StatStruct.Hours = 0>
		<cfset StatStruct.Attendees = 0>
		<cfset StatStruct.MD = 0>
		<cfset StatStruct.NonMD = 0>
		
		<cfquery name="qGetStats" datasource="#Application.Settings.DSN#">
			DECLARE @StartDate datetime;
			DECLARE @EndDate datetime;
			DECLARE @Grouping int;
			DECLARE @Sponsorship nchar(1);
			
			SET @StartDate = <cfqueryparam value="#Arguments.StartDate# 00:00:00" cfsqltype="cf_sql_date" />;
			SET @EndDate = <cfqueryparam value="#Arguments.EndDate# 00:00:00" cfsqltype="cf_sql_date" />;
			SET @Grouping = <cfqueryparam value="#Arguments.Grouping#" cfsqltype="cf_sql_integer" />;
			SET @Sponsorship = <cfqueryparam value="#Arguments.Sponsorship#" cfsqltype="cf_sql_varchar" />;
			
			IF @Grouping = 2
			BEGIN
				WITH RSS_Stats (StatHrs,StatAttendees,StatMD,StatNonMD)
				AS (
					SELECT
						StatHrs =
						(
						isNull((SELECT SUM(AC.Amount) AS TotalHours
								FROM ce_Activity_Credit AS AC 
								INNER JOIN ce_Activity AS A4 ON AC.ActivityID = A4.ActivityID
								WHERE (AC.CreditID = 1) AND (A4.ParentActivityID = A.ActivityID) AND (A4.StatusID IN (1,2,3)) AND (AC.DeletedFlag='N') AND (A4.StartDate BETWEEN @StartDate AND @EndDate)
								OR
								(AC.CreditID = 1) AND (A4.ParentActivityID = A.ActivityID) AND (A4.StatusID IN (1,2,3)) AND (AC.DeletedFlag='N') AND (A4.EndDate BETWEEN @StartDate AND @EndDate)),0)
						),
						StatAttendees =
						(
						isNull((SELECT Sum(A2.StatAttendees)
								FROM
								 ce_Activity AS A2
								 WHERE 
									(A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.StartDate BETWEEN @StartDate AND @EndDate)
									OR
									(A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.EndDate BETWEEN @StartDate AND @EndDate)),0)
						),
						StatMD =
						(
						isNull((SELECT Sum(A2.StatMD)
								FROM
								 ce_Activity AS A2
								 WHERE 
									(A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.StartDate BETWEEN @StartDate AND @EndDate)
									OR
									(A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.EndDate BETWEEN @StartDate AND @EndDate)),0)
						),
						StatNonMD =
						(
						isNull((SELECT isNull(Sum(A2.StatNonMD),0)+isNull(Sum(A2.StatAddlAttendees),0)
								FROM
								 ce_Activity AS A2
								 WHERE 
									(A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.StartDate BETWEEN @StartDate AND @EndDate)
									OR
									(A2.ParentActivityID = A.ActivityID) AND (A2.StatusID IN (1,2,3)) AND (A2.EndDate BETWEEN @StartDate AND @EndDate)),0)
						)
					FROM ce_Activity As A
					WHERE 
							(A.ParentActivityID IS NULL) AND 
							(A.GroupingID = @Grouping) AND 
							(A.StatusID IN (1,2,3)) AND 
							(A.Sponsorship = @Sponsorship) AND 
							(A.DeletedFlag = 'N') AND 
							(SELECT Count(ActivityID) 
							FROM ce_Activity As A2 
							WHERE 
								(A2.ParentActivityID=A.ActivityID) AND 
								(A2.StartDate BETWEEN @StartDate AND @EndDate) AND 
								(A2.StatusID IN (1,2,3)) AND 
								(A2.DeletedFlag='N') AND 
								(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A2.ActivityID AND ACr.CreditID=1) > 0
									OR
								(A2.ParentActivityID=A.ActivityID) AND 
								(A2.EndDate BETWEEN @StartDate AND @EndDate) AND 
								(A2.StatusID IN (1,2,3)) AND 
								(A2.DeletedFlag='N') AND 
								(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A2.ActivityID AND ACr.CreditID=1) > 0
								) > 0
				) SELECT Sum(StatHrs) As StatHrs,Sum(StatAttendees) As StatAttendees,Sum(StatMD) As StatMD,Sum(StatNonMD) As StatNonMD FROM RSS_Stats;
			END
			ELSE IF @Grouping = 6 OR @Grouping = 7 OR @Grouping = 8 OR @Grouping = 9 OR @Grouping = 10
			BEGIN
				SELECT 
					isNull(Sum(A.StatCMEHours),0) As StatHrs,
					isNull(Sum(A.StatAttendees),0) As StatAttendees,
					isNull(Sum(A.StatMD),0) As StatMD,
					isNull(Sum(A.StatNonMD),0)+isNull(Sum(A.StatAddlAttendees),0) As StatNonMD
				FROM ce_Activity As A
				WHERE 
						(A.ParentActivityID IS NULL) AND 
						(A.GroupingID = @Grouping) AND 
						(A.StatusID IN (1,2,3)) AND 
						(A.Sponsorship = @Sponsorship) AND 
						(A.DeletedFlag = 'N') AND 
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1) > 0 AND
						(SELECT Count(attendeeid) FROM ce_Attendee AS Att WHERE Att.ActivityID = A.ActivityID AND Att.CompleteDate BETWEEN @StartDate AND @EndDate) > 0 AND
						(A.StartDate BETWEEN @StartDate AND @EndDate)
					OR
						(A.ParentActivityID IS NULL) AND 
						(A.GroupingID = @Grouping) AND 
						(A.StatusID IN (1,2,3)) AND 
						(A.Sponsorship = @Sponsorship) AND 
						(A.DeletedFlag = 'N') AND 
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1) > 0 AND
						(SELECT Count(attendeeid) FROM ce_Attendee AS Att WHERE Att.ActivityID = A.ActivityID AND Att.CompleteDate BETWEEN @StartDate AND @EndDate) > 0 AND
						(A.EndDate BETWEEN @StartDate AND @EndDate)
			END
			ELSE
				SELECT 
					isNull(Sum(A.StatCMEHours),0) As StatHrs,
					isNull(Sum(A.StatAttendees),0) As StatAttendees,
					isNull(Sum(A.StatMD),0) As StatMD,
					isNull(Sum(A.StatNonMD),0)+isNull(Sum(A.StatAddlAttendees),0) As StatNonMD
				FROM ce_Activity As A
				WHERE 
						(A.ParentActivityID IS NULL) AND 
						(A.GroupingID = @Grouping) AND 
						(A.StatusID IN (1,2,3)) AND 
						(A.Sponsorship = @Sponsorship) AND 
						(A.DeletedFlag = 'N') AND 
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1) > 0 AND
						(A.StartDate BETWEEN @StartDate AND @EndDate)
					OR
						(A.ParentActivityID IS NULL) AND 
						(A.GroupingID = @Grouping) AND 
						(A.StatusID IN (1,2,3)) AND 
						(A.Sponsorship = @Sponsorship) AND 
						(A.DeletedFlag = 'N') AND 
						(SELECT Count(Activity_CreditID) FROM ce_Activity_Credit AS ACr WHERE ACr.ActivityID=A.ActivityID AND ACr.CreditID=1) > 0 AND
						(A.EndDate BETWEEN @StartDate AND @EndDate)
		</cfquery>
		
		<cfset StatStruct.Hours = qGetStats.StatHrs>
		<cfset StatStruct.Attendees = qGetStats.StatAttendees>
		<cfset StatStruct.MD = qGetStats.StatMD>
		<cfset StatStruct.NonMD = qGetStats.StatNonMD>
		
		<cfreturn StatStruct />
	</cffunction>
	
	<cffunction name="createTheExcel" returntype="any" access="private">
		<cfargument name="Activities" type="struct" required="yes" />
		
		<cfinclude template="accmeSummary-inc\poiTags.cfm" />
	</cffunction>
	
	<cffunction name="getDollars" access="private" returntype="numeric">
		<cfargument name="DollarsType" type="string" required="yes">
		<cfargument name="StartDate" type="string" required="yes">
		<cfargument name="EndDate" type="string" required="yes">
		
		<cfset var qDollars = "">
		<cfset var ReturnDollars = 0>
		
		<cfquery name="qDollars" datasource="#Application.SEttings.DSN#">
			DECLARE @StartDate datetime;
			DECLARE @EndDate datetime;
			
			SET @StartDate = <cfqueryparam value="#Arguments.StartDate# 00:00:00" cfsqltype="cf_sql_date" />;
			SET @EndDate = <cfqueryparam value="#Arguments.EndDate# 00:00:00" cfsqltype="cf_sql_date" />;
			
			SELECT     
				SUM(FS.Amount) As DollarAmount
			FROM
				ce_Activity_FinSupport AS FS 
			INNER JOIN
				ce_Activity AS A ON FS.ActivityID = A.ActivityID
			WHERE     
				(FS.SupportTypeID IN (#PreserveSingleQuotes(Arguments.DollarsType)#)) AND 
				(FS.DeletedFlag = 'N') AND
				(A.StatusID IN (1,2,3)) AND 
				(A.StartDate BETWEEN @StartDate AND @EndDate) AND
				(A.DeletedFlag='N')
					OR
				(FS.SupportTypeID IN (#PreserveSingleQuotes(Arguments.DollarsType)#)) AND 
				(FS.DeletedFlag = 'N') AND
				(A.StatusID IN (1,2,3)) AND 
				(A.StartDate BETWEEN @StartDate AND @EndDate) AND
				(A.DeletedFlag='N')
		</cfquery>
		
		<cfif qDollars.DollarAmount GT 0>
			<cfset ReturnDollars = qDollars.DollarAmount>
		</cfif>
		
		<cfreturn ReturnDollars />
	</cffunction>
</cfcomponent>