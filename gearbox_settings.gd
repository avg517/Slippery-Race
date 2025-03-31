extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_automatic_pressed() -> void:
	Global.manual= false
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_manual_pressed() -> void:
	Global.manual= true
	get_tree().change_scene_to_file("res://menu.tscn")
