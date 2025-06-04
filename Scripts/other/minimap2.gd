extends SubViewport


@onready var camera: Camera2D = $Camera2D

func _physics_process(_delta):
	camera.position = owner.find_child("Node2D").position
