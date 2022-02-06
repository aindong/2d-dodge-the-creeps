extends CanvasLayer


signal start_game


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_score(score):
	$ScoreLabel.text = str(score)


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()	
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over :(")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Dodge the Creeps"
	$MessageLabel.show()
	yield(get_tree().create_timer(1.0), "timeout")
	$Button.show()

func _on_Button_pressed():
	$Button.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLabel.hide()
