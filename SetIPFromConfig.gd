extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	var NumPad = get_node("NumPadContainer")
	for button in NumPad.get_children():
		button.connect("pressed", Callable(self,"_on_numpad_button_pressed").bind(button.text))
	NumPad.visible = false
	var octetBoxes = get_node("MarginContainer/HBoxContainer")
	for octetBox in octetBoxes.get_children():
		if octetBox.text != ".":
			octetBox.connect("pressed", Callable(self, "_on_octet_pressed").bind(octetBox.get_name()))
			print("name: " + octetBox.get_name())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _remove_all_children(node):
	for child in node.get_children():
		node.remove_child(child)
	pass

func _make_IP_block_button(octetPos, octetVal):
	var ipButton = Button.new()
	ipButton.text = octetVal
	ipButton.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ipButton.size_flags_vertical = Control.SIZE_EXPAND_FILL
	ipButton.add_theme_font_size_override("font_size", 55)
	ipButton.pressed.connect(on_IP_block_button_pressed.bind(octetVal, octetPos))
	
	get_node("ipEntryContainer").add_child(ipButton)
	pass

func _make_buttons_for_IP_blocks(octetPos):
	#clear whatever interface might be on the screen
	_hide_numpad()
	_remove_all_children(get_node("ipEntryContainer"))
	
	#find the possible octet values for a given octet
	var octetVals = Global.octetPossibleValues[octetPos]
	
	#make a button for each possible value 
	for octetVal in octetVals:
		_make_IP_block_button(octetPos, octetVal)
		
	#if it's the last octet, show the numpad
	if octetPos == "4":
		_show_numpad()
	pass
	
func _on_octet_pressed(octetPos):
	Global.currentOctetPos = octetPos
	print("Current OP: " + Global.currentOctetPos)
	var octetPosNum = octetPos.right(1)
	print("other: " + octetPos.right(1))
	Global.currentOctetPos = octetPosNum
	_make_buttons_for_IP_blocks(octetPosNum)
	if octetPos == "4":
		_show_numpad()
	pass
	
#func _on_byte_1_pressed():
#	Global.currentOctetPos = "1"
#	_make_buttons_for_IP_blocks(Global.byte1nums, "1")
#	pass # Replace with function body.
#


func on_IP_block_button_pressed(octetVal, octetPos):
	var octetNodeName = "MarginContainer/HBoxContainer/byte" + octetPos
	var octetNode = get_node(octetNodeName)
	octetNode.text = octetVal
#	print("val: " + octetVal)
#	print("pos: " + octetPos)
#	for val in Global.octetPossibleValues:
#		print(val)
#	Global.currentOctetPos = octetPos
#	_make_buttons_for_IP_blocks(Global.octetPossibleValues[octetPos], octetPos)
	pass


#func _on_byte_2_pressed():
#	Global.currentOctetPos = "2"
#	_make_buttons_for_IP_blocks(Global.byte2nums, "2")
#	pass # Replace with function body.
#
#func _on_byte_3_pressed():
#	Global.currentOctetPos = "3"
#	_make_buttons_for_IP_blocks(Global.byte3nums, "3")
#	pass # Replace with function body.
#
#func _on_byte_4_pressed():
#	Global.currentOctetPos = "4"
#	_show_numpad()
#	pass # Replace with function body.

func _on_numpad_button_pressed(text):
	print(text)
	_octet_string_manual_entry(text)
	pass
	
func _octet_string_manual_entry(numString):
	var octetToEdit = get_node("MarginContainer/HBoxContainer/byte" + Global.currentOctetPos)
	var octetLength = octetToEdit.text.length()
	if octetToEdit.text == "000" && numString.is_valid_int():
		octetToEdit.text = numString
	if octetLength < 3 && numString.is_valid_int():
		octetToEdit.text += numString
	elif numString == "Clr":
		octetToEdit.text = ""
	pass
	
func _show_numpad():
	var NumPad = get_node("NumPadContainer")
	NumPad.visible = true
	pass
	
func _hide_numpad():
	var NumPad = get_node("NumPadContainer")
	NumPad.visible = false
	pass

func _show_ip_result():
	var ipResultContainer = get_node("ipEntryContainer")
	ipResultContainer.visible = true
	pass

func _hide_ip_result():
	var ipResultContainer = get_node("ipResultContainer")
	ipResultContainer.visible = false
	pass

func _on_manual_pressed():
	_show_numpad()
	_remove_all_children(get_node("ipEntryContainer"))
	pass # Replace with function body.


func _on_set_pressed():
	_hide_numpad()
	_remove_all_children(get_node("ipEntryContainer"))
	var userIP = ["", "", "", ""]
	var octets = get_node("MarginContainer/HBoxContainer").get_children()
	
	for octet in octets:
		if octet.text != ".":
			var octetName = octet.get_name()
			var octetNum = octetName.right(1)
			var octetIndex = int(octetNum) - 1
			Global.gatewayIP[octetIndex] = octet.text
	Global._set_IP(Global.gatewayIP)
	pass # Replace with function body.

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://SetIPMenu.tscn")
	pass # Replace with function body.
