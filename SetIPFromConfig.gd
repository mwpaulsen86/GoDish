extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var something = Global.testNum
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _make_IP_block_button(block):
	var ipButton = Button.new()
	ipButton.text = block
	ipButton.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	ipButton.size_flags_vertical = Control.SIZE_EXPAND_FILL
	get_node("ipEntryContainer").add_child(ipButton)
	pass

func _make_buttons_for_IP_blocks(blocks):
	for block in blocks:
		_make_IP_block_button(block)
	pass

func _on_byte_1_pressed():
	#get_node("HBoxByte1").visible = true
	_make_buttons_for_IP_blocks(Global.byte1nums)
	pass # Replace with function body.
