extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.onGrass = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://players_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_settngs_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")
