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
	var commandString = "ping " + ipString
	var output = []
	OS.execute("ping", [ipString], output)
	for thing in output:
		print(thing)
	
	pass
