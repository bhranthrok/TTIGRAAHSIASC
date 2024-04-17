extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	var elapsed: float = (Global.time_end - Global.time_start) / 1000
	set_text("Time:\n " + str(elapsed) + "s")
