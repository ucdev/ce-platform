<!DOCTYPE HTML>
<html>
<head>
	<title>Long Polling With ColdFusion And jQuery</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
	<script type="text/javascript">
 
		// Define a class that will handle long polling.
		var LongPoll = function( url, timeout ){
			// I am the long poll url.
			this.url = url;
 
			// I am how long the timer will pause before re-checking
			// the long-poll stream for more data.
			this.timeout = (timeout || 250);
 
			// I am the interval timer for checking the stream.
			this.timer = null;
 
			// I am the current AJAX connection making the long poll
			// connection.
			this.xhr = null;
 
			// I am the length of the known stream.
			this.streamLength = 0;
 
			// I flag whether or not this is running.
			this.isRunning = false;
		};
 
 
		// I connect to the server to start the long poll process.
		LongPoll.prototype.pollServer = function(){
			var self = this;
 
			// Reset the stream length since we are about to start
			// a new poll session.
			this.streamLength = 0;
 
			// Connect to the server and store the current connect
			// object so we can periodically check its data.
			this.xhr = $.ajax({
				type: "get",
				url: this.url,
				cache: false,
				complete: function(){
					// Clear out the request object since our
					// connection has died.
					self.xhr = null;
 
					// Kick off the long poll again if the poll is
					// still running.
					if (self.isRunning){
						self.pollServer();
					}
				}
			});
		};
 
 
		// I check the current connection stream to see if there is
		// any new data flushed from the server.
		LongPoll.prototype.checkStream = function(){
			var self = this;
 
			// Check to see if we have an open connection and that
			// the connection stream length is longer than it was
			// the last time we checked.
			if (
				!this.xhr ||
				(this.xhr.responseText.length == this.streamLength)
				){
 
				// There is nothing to check at this point, so just
				// return out of the function.
				return( false );
			}
 
			// Grab the stream data, which is everything we've
			// grabbed since the last time we checked.
			var streamData = this.xhr.responseText.substring(
				this.streamLength,
				this.xhr.responseText.length
			);
 
			// Store the new length of the stream so we don't try
			// to re-parse this portion.
			this.streamLength = this.xhr.responseText.length;
 
			// Split the stream on our chunk delimiter.
			var dataParts = streamData.split(
				new RegExp( "::DATA::", "" )
			);
 
			// Loop over the parts to make sure that the data has
			// a valid length and can be parsed as JSON.
			$.each(
				dataParts,
				function( index, data ){
					// Clean the data up.
					data = $.trim( data );
 
					// Check to make sure it has a length.
					if (data.length){
 
						// Try to parse the JSON.
						try {
							// Parse the JSON data and publish it
							// to anyone who is listening.
							self.publishData( $.parseJSON( data ) );
						} catch( e ){
							// The JSON was invalid.
						}
 
					}
				}
			);
 
		};
 
 
		// I publish the poll data to anyone listening.
		LongPoll.prototype.publishData = function( data ){
			// Use jQuery to trigger the data event on this object.
			$( this ).trigger({
				type: "data",
				pollData: data
			});
		};
 
 
		// I start the long polling.
		LongPoll.prototype.start = function(){
			var self = this;
 
			// Flag the long poll as started.
			this.isRunning = true;
 
			// Set the timer.
			this.timer = setInterval(
				function(){
					self.checkStream();
				},
				this.timeout
			);
 
			// Poll the server.
			this.pollServer();
		};
 
 
		// I stop the long polling.
		LongPoll.prototype.stop = function(){
			// Flag the long poll as stopped.
			this.isRunning = false;
 
			// Kill the timer.
			clearInterval( this.timer );
 
			// Abort any current request.
			if (this.xhr){
				this.xhr.abort();
			}
		};
 
 
		// -------------------------------------------------- //
		// -------------------------------------------------- //
 
 
		// When the DOM is ready, initialize.
		$(function(){
 
			// Get a reference to the messages list.
			var messages = $( "#messages" );
 
			// Create an instance of the long poll object.
			var poll = new LongPoll( "/channel/pull" );
 
			// Bind to the poll data event.
			$( poll ).bind(
				"data",
				function( event ){
 
					// Loop over the long poll data and append the
					// messages to the UI.
					$.each(
						event.pollData,
						function( i, message ){
 
							// Prepend the message to our list.
							messages.prepend(
								"<li>" + message + "</li>"
							);
 
						}
					);
				}
			);
 
			// Start the long poll.
			poll.start();
 
		});
 
	</script>
</head>
<body>
 
	<h1>
		Long Polling With ColdFusion And jQuery
	</h1>
 
	<ul id="messages">
		<!--- These will be populated via long-polling. --->
	</ul>
 	
	<cfdump var="#application.messages#" />
</body>
</html>