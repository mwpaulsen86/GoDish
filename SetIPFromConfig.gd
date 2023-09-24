extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var something = Global.testNum
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _make_IP_block_button(byte, block):
	var ipButton = Button.new()
	Global.currentByte = byte
	#var buttonName = "byte" + byte + "block" + block
	#Global.customData.add 
	ipButton.text = byte
	ipButton.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ipButton.size_flags_vertical = Control.SIZE_EXPAND_FILL
	ipButton.pressed.connect(on_IP_block_button_pressed.bind(byte, block))
	
	get_node("ipEntryContainer").add_child(ipButton)
	pass

func _make_buttons_for_IP_blocks(bytes, block):
	for byte in bytes:
		print(byte)
		_make_IP_block_button(byte, block)
	pass

func _on_byte_1_pressed():
	#get_node("HBoxByte1").visible = true
	Global.currentBlock = "1"
	_make_buttons_for_IP_blocks(Global.byte1nums, "1")
	pass # Replace with function body.

func on_IP_block_button_pressed(byte, block):
	
	var blockName = "block" + Global.currentBlock
	var byteName = "byte" + Global.currentByte
	
	#print("blockname: " + blockName)
	#print("bytename: " + byteName)
	print(byte)
	#print("byte pressed was: " + get_node(byteName).)
	pass
