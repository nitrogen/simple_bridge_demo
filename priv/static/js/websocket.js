// Borrowed from https://github.com/extend/cowboy/blob/master/examples/websocket/priv/index.html

var websocket;

function init(Name) {
	if(!("WebSocket" in window)){  
		add_message("websockets are not supported");
	} else {
		add_message("websockets are supported!");
		connect(Name);
	};
};

function connect(Name)
{
	wsHost = "ws://localhost:8000?name=" + Name,
	websocket = new WebSocket(wsHost);
	add_message('Connecting to: ' +  wsHost); 
	websocket.onopen = function(evt) { onOpen(evt) }; 
	websocket.onclose = function(evt) { onClose(evt) }; 
	websocket.onmessage = function(evt) { onMessage(evt) }; 
	websocket.onerror = function(evt) { onError(evt) }; 
};  

function disconnect() {
	websocket.close();
}; 

function toggle_connection(){
	if(websocket.readyState == websocket.OPEN){
		disconnect();
	} else {
		connect();
	};
};

function send_msg() {
	if(websocket.readyState == websocket.OPEN){
		txt = $("#msg").val();
		websocket.send(txt);
	} else {
		add_message('websocket is not connected'); 
	};
};

function onOpen(evt) { 
	add_message("Connected");
};  

function onClose(evt) { 
};  

function onMessage(evt) { 
	add_message(evt.data);
};  

function onError(evt) {
	add_message("ERROR:" + evt.data);
};



function add_message(Text) {
	$("#chat").append($('<div>').text(Text));
}
