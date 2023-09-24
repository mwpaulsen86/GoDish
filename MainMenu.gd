extends Control
@export var byte1nums = ["10", "172", "196"]
@export var byte2nums10 = ["11", "12", "110", "111"]
@export var byte2nums172 = ["16"]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_set_ip_pressed():
	get_tree().change_scene_to_file("res://SetIPMenu.tscn")
	pass # Replace with function body.
