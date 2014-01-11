--test_nativesocket.lua

local Application = require("Application")

local NativeSocket = require("NativeSocket")
local NetStream = require("NetStream")

local socket, err = NativeSocket:createClient("www.bing.com", 80)

print("Socket: ", socket, err)

if not socket then
	print("No socket created: ", err)
	return;
end

netstream = NetStream:init(socket)

function waiter()
	sleep(3000)
	print("finished waiting")
end

function main()
	--spawn(waiter)

	netstream:writeLine("GET / HTTP/1.1")
	netstream:writeLine()
	netstream:writeLine()

--print("After writeLine()")

	local line, err = netstream:readLine();

	print("Line: ", line, err)
end

run(main)