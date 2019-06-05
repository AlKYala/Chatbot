<!DOCTYPE HTML>
<html>
  <head>
    <title>
      CHATSCRIPT SERVER
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
  #responseHolder{
  overflow-y: auto;
	padding-top: 90px; 
  padding-bottom: 50px;
}

.chatbot{
  background: #fff;
  color: #000;
  float: left;
  margin-left: 20px;
  margin-right: 55px;
}

.header{	
	position: center;
	width: auto;
  text-align: center;
	padding-top: 5px;
  height: 40px;
  color: #fff;
  background-color: #0145F0;
  font-weight: none;
  font-size: 30px;
}

.container{	
  border-right: 1px solid #000;
  border-left: 1px solid #000;
	margin: auto;
	width: 100%;
  min-height: 100vh;
}

.msgInputFrom {	
  width: 50%;
 position: fixed;
  bottom: 0;
  padding-bottom: 15px;
  height: 3em;
}

.user{
  float: right;
  background: #b2b2ff;
  color: #fff;
  margin-right: 10px;
  margin-left: 50px;
}

#txtMessage{
  margin-left: 17%;
  width:60%;
	height: 30px;
	margin-bottom: 20px;
	color: #333;
	background-color: #eee;
	border: 2px solid #bbb;
	border-radius: 5px;
	/*float: left;*/	
}

#txtMessage:focus{
	border: 1px solid #F59305;
}

#Button{
	  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 9px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 2px 2px;
  border-radius: 15px;
  
}

ul li{
  display:inline-block;
  clear: both;
  padding: 20px;
  border-radius: 30px;
  margin-bottom: 10px;
}

ul{
  list-style: none;
  padding: 0px;
  margin-top: 0px;
}

img{
  max-width:100%;
  max-height: 100%;
}

a {
  color: #0145f0;
  text-decoration: none;
}

body {
	background-color: #;
	font-family: Helvetica, Arial, sans-serif;
	margin-top: 0px;
  font-size: 18px;
}

div.bild {
   position: absolute;
   top: -1px;
   width:200px; /*width of your image*/
   height:46px; /*height of your image*/
   background-image:url('utr_logoSM.png');
   background-color: #000;
  /* If you want no margin */
   padding:; /*if your want to padding */
	</style>
   </head>
  <body >
  
  	<div class="header">Kaufberatung Uni-Shop
  	</div> 
    
            <div class="bild">&nbsp;</div>

  	<div class="container"> 

		<ul id="responseHolder"></ul>
		<form class="msgInputFrom" id="frmChat" action="#">           
		    <input type="hidden" name="send" />
			    <input type="text" name="message" autocomplete="off" placeholder="Geben Sie Ihre Nachricht ein" id="txtMessage"/>
			    <input id="Button" type="submit" name="send" value="Senden" />
    	</form>
	</div>	
    
   

<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">

// declare timer variables
var alarm = null;
var callback = null;
var loopback = null;

/*$(document).ready(function(){sendMessage(":reset")});*/

$(function(){
	$('#frmChat').submit(function(e){
	// this function overrides the form's submit() method, allowing us to use AJAX calls to communicate with the ChatScript server
	e.preventDefault();  // Prevent the default submit() method   
   
	var chatLog = $('#responseHolder').html();
	var youSaid = '<li class="user">' + $('#txtMessage').val() + "<br>\n"+'</li>';
	update(youSaid);
	var data = $(this).serialize();
	sendMessage(data);
	$('#txtMessage').val('').focus();
	});

	// any user typing cancels loopback or callback for this round 
	$('#txtMessage').keypress(function(){
          window.clearInterval(loopback);
          window.clearTimeout(callback);
        });
});

function sendMessage(data){ //Sends inputs to the ChatScript server, and returns the response-  data - a JSON string of input information
$.ajax({
	url: 'ui.php',
	dataType: 'text',
	data: data,
    type: 'post',
    success: function(response){
		processResponse(parseCommands(response));
    },
    error: function(xhr, status, error){
		alert('oops? Status = ' + status + ', error message = ' + error + "\nResponse = " + xhr.responseText);
    }
  });
}

function parseCommands(response){ // Response is data from CS server. This processes OOB commands sent from the CS server returning the remaining response w/o oob commands

	var len  = response.length;
	var i = -1;
	while (++i < len )
	{
		if (response.charAt(i) == ' ' || response.charAt(i) == '\t') continue; // starting whitespace
		if (response.charAt(i) == '[') break;	// we have an oob starter
		return response;						// there is no oob data 
	}
	if ( i == len) return response; // no starter found
	     
	// walk string to find oob data and when ended return rest of string
	var start = 0;
	while (++i < len )
	{
		if (response.charAt(i) == ' ' || response.charAt(i) == ']') // separation
		{
			if (start != 0) // new oob chunk
			{
				var blob = response.slice(start,i);
				start = 0;

				var commandArr = blob.split('=');
				if (commandArr.length == 1) continue;	// failed to split left=right

				var command = commandArr[0]; // left side is command 
				var interval = (commandArr.length > 1) ? commandArr[1].trim() : -1; // right side is millisecond count
				if (interval == 0)  /* abort timeout item */
				{
					switch (command){
						case 'alarm':
							window.clearTimeout(alarm);
							alarm = null;
							break;
						case 'callback':
							window.clearTimeout(callback);
							callback = null;
							break;
						case 'loopback':
							window.clearInterval(loopback);
							loopback = null;
							break;
					}
				}
				else if (interval == -1) interval = -1; // do nothing
				else
				{
					var timeoutmsg = {send: true, message: '[' + command + ' ]'}; // send naked command if timer goes off 
					switch (command) {
						case 'alarm':
							alarm = setTimeout(function(){sendMessage(timeoutmsg );}, interval);
							break;
						case 'callback':
							callback = setTimeout(function(){sendMessage(timeoutmsg );}, interval);
							break;
						case 'loopback':
							loopback = setInterval(function(){sendMessage(timeoutmsg );}, interval);
							break;
					}
				}
			} // end new oob chunk
			if (response.charAt(i) == ']') return response.slice(i + 2); // return rest of string, skipping over space after ] 
		} // end if
		else if (start == 0) start = i;	// begin new text blob
	} // end while
	return response;	// should never get here
 }
 
function update(text){
	var responseHolder = $('#responseHolder'); //Liste
	var chatLog =responseHolder.html();
	responseHolder.html(chatLog + text);	
	var height = $('body').get(0).scrollHeight;
	//$('body').scrollTop(height); //scroll to bottom
	$('#responseHolder').animate({scrollTop: $('#responseHolder').prop(height)}, 500);
	window.scrollTo(0,document.body.scrollHeight);
	console.log(chatLog);
}

function processResponse(response) { // given the final CS text, converts the parsed response from the CS server into HTML code for adding to the response holder div
	var botSaid = '<li class="chatbot">' + response + "<br>\n"+'</li>';
	update(botSaid);
}

</script>
</body>
</html>
