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
			print(octetBox.get_name())
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
	ipButton.pressed.connect(on_IP_block_button_pressed.bind(octetVal, octetPos))
	
	get_node("ipEntryContainer").add_child(ipButton)
	pass

func _make_buttons_for_IP_blocks(octetVals, octetPos):
	_remove_all_children(get_node("ipEntryContainer"))
	for octetVal in octetVals:
		print(octetVal)
		_make_IP_block_button(octetPos, octetVal)
	pass
	
func _on_octet_pressed(octetPos):
	Global.currentOctetPos = octetPos
	print(octetPos.right(1))
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
	print(octetVal)
	pass


func _on_byte_2_pressed():
	Global.currentOctetPos = "2"
	_make_buttons_for_IP_blocks(Global.byte2nums, "2")
	pass # Replace with function body.

func _on_byte_3_pressed():
	Global.currentOctetPos = "3"
	_make_buttons_for_IP_blocks(Global.byte3nums, "3")
	pass # Replace with function body.

func _on_byte_4_pressed():
	Global.currentOctetPos = "4"
	_show_numpad()
	pass # Replace with function body.

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
	
	
	
	
	
	
	
	
	
	
	
	
#
#func _on_num_pad_1_pressed():
#
#	pass # Replace with function body.
#
#
#func _on_num_pad_2_pressed():
#	pass # Replace with function body.
#
#
#func _on_num_pad_3_pressed():
#	pass # Replace with function body.
#
#
#func _on_num_pad_4_pressed():
#	pass # Replace with function body.
#
#
#func _on_num_pad_5_pressed():
#	pass # Replace with function body.
#
#
#func _on_num_pad_6_pressed():
#	pass # Replace with function body.
#
#
#func _on_num_pad_7_pressed():
#	pass # Replace with function body.
#
#
#func _on_num_pad_8_pressed():
#	pass # Replace with function body.
#
#
#func _on_num_pad_9_pressed():
#	pass # Replace with function body.



