extends CharacterBody2D

@onready var main = get_tree().get_root().get_node("Main")
@onready var fireball = load("res://Scenes/fireball.tscn")
@onready var player = get_parent().get_node("Player")

@onready var animatedSprite = $AnimatedSprite2D
var currentAnimation = "spawn"

# Takes direction in degrees of rotation from 0
func shootFireball():
	# start new instance of original fireball
	var instance = fireball.instantiate()
	#sets values according to wizards position
	instance.direction = rotation
	instance.spawnPosition = global_position
	instance.spawnRotation = rotation
	# adds childs
	main.add_child.call_deferred(instance)

# Run on every frame
func _physics_process(delta):
	animatedSprite.play(currentAnimation)
	look_at(player.position)

func _on_animated_sprite_2d_animation_finished():
	if currentAnimation == "spawn":
		currentAnimation = "idle"
	$Offset.start()

# After spawn animation is done
func _on_offset_timeout():
	# change animation
	currentAnimation = "cast"
	$SpellDelay.start()

func _on_spell_delay_timeout():
	shootFireball()
	$Cooldown.start()

# waits for spawn animation to be done
func _on_cooldown_timeout():
	shootFireball()
