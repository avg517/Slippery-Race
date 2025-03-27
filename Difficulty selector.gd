extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cc_pressed() -> void:
	Global.top_speed = 120
	Global.acc = 5.0
	get_tree().change_scene_to_file("res://level_selector.tscn")

func _on_cc_2_pressed() -> void:
	Global.top_speed = 220
	Global.acc = 6.0
	get_tree().change_scene_to_file("res://level_selector.tscn")

func _on_cc_3_pressed() -> void:
	Global.top_speed = 360
	Global.acc = 7.0
	get_tree().change_scene_to_file("res://level_selector.tscn")
