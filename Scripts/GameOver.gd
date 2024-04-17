extends Control

@onready var animatedSprite = $Juicer

var currentSkeletonAnimation = "PreSlice"
	
func _ready():
	$Quit.hide()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animatedSprite.play(currentSkeletonAnimation)

# it's 3am his name is juicer ok
func _on_juicer_animation_finished():
	if currentSkeletonAnimation == "PreSlice":
		$DamageSFX.play()
		currentSkeletonAnimation = "GameOver"
		$BGM.play()
	elif currentSkeletonAnimation == "GameOver":
		currentSkeletonAnimation = "Deadge"
		$AnimationPlayer.play("FadeIn")
		$Quit.show()


# Actually, let's go to main menu
func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
