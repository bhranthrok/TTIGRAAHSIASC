extends Control

@onready var animatedSprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animatedSprite.play("idle3hp")

func _on_back_button_pressed():
	$ClickSFX.play()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
