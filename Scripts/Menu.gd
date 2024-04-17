extends Control

@onready var animatedSprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()
	$BGM.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animatedSprite.play("idle3hp")

func _on_start_button_pressed():
	$VBoxContainer/ClickSFX.play()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

# Instructions
func _on_how_to_play_pressed():
	$VBoxContainer/ClickSFX.play()
	get_tree().change_scene_to_file("res://Scenes/instructions.tscn")

func _on_quit_pressed():
	$VBoxContainer/ClickSFX.play()
	get_tree().quit()
	
