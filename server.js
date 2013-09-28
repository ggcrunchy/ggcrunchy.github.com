// Modules
var express = require("express")
var http = require("http")
//var http_proxy = require("http-proxy")

// Static file server for regular stuff
var app = express()

app.configure(function(){
    app.use("/", express.static(__dirname))
})

app.listen(8080)

// Most requests get proxied
/*
var proxy = new http_proxy.HttpProxy({ 
  target: {
    host: "localhost",
    port: 8080
  }
})

// Main server
var in_progress

http.createServer(function(req, res) {
	// Pack request. Performs a pack if some scripts are out of date.
	
	if (req.url == "/taco") // TODO: do pack stuff here...
	{
		// Prohibit multiple packs.
		if (in_progress)
		{
			// Stern warnings, etc.
		}

		// Are we up to date?
		// Check modification time of scripts folder
		// Matches our local record?
			// Yes
				// Good to go!
				// in_progress = false
			// Nope
				// Kick off pack (some async / keep-alive thing?)
				// Get saved file size stuff
				// Find "dirty" files
				// Build up new list
				// Some non-awful way to send progress back...
				// ^^ Maybe a readable stream, writing (seek to 0, overwrite all) on Lua side?

		// Actually, this can pretty much all be moved client-side...

		res.writeHead(404, { 'Content-Type': 'text/plain' })
		res.write('Oh noes!')
		res.end()

		// Allow future packs.
		in_progress = false
	}

	// Progress request. Sent afterward, if a pack kicks off.
	// else if (req.url == "/progress") {} // Or is there a better way?
	
	// Proxy normal request.
	else proxy.proxyRequest(req, res)
}).listen(9000)*/