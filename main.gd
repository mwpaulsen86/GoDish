extends Node


var testNum = 4

var customData = {}

var byte1nums = ["10", "172", "192"]
var byte2nums = ["11", "12", "16", "110", "111"]
var byte3nums = ["4", "7", "12", "14", "15", "23", "25", "48", "67", "81", "89", "106", "137", "201"]

var currentOctetPos = "1"
var gatewayIP = ["0", "0", "0", "0"]
var deviceIP = ["0", "0", "0", "0"]
var octetPossibleValues = {
	"1": ["10", "172", "192"],
	"2": ["11", "12", "16", "110", "111"],
	"3": ["4", "7", "12", "14", "15", "23", "25", "48", "67", "81", "89", "106", "137", "201"],
	"4": []
}

func _set_IP(ip):
	var ipString = ""
	for octet in ip:
		ipString += octet + "."
	ipString = ipString.left(ipString.length() - 1)
	var commandString = "ping -n 1" + ipString
	var numArg = "-n"
	var numOfPings = "1"
	
	var addressChangeString = "netsh interface ip set address name=\"Ethernet\" static 192.168.1.123 255.255.255.0 192.168.1.20"
	var command = "netsh"
	var arg1 = 'interface'
	var arg2 = "ip" 
	var arg3 = "set"
	var arg4 = "address"
	var arg5 = 'name="Ethernet"' 
	var arg6 = "static" 
	var arg7 = "192.168.1.123"
	var arg8 =  "255.255.255.0"
	var arg9 = "192.168.1.20"
	var output = []
	OS.execute(command, [arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9], output)
	var ipResult = output[0]
	print("ip result was: " + ipResult)
#	for thing in output:
#		print(thing)
#
	pass
