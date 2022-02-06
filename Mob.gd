extends RigidBody2D


export var min_speed = 150.0
export var max_speed = 250.0


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play()
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_VisibilityNotifier2D_screen_exited():
	print("mob exited")
	queue_free()
