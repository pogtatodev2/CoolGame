extends Control

var on = false

func _process(delta):
	if Input.is_action_pressed("debug_toggle") and on == false:
		on = true
	if Input.is_action_pressed("debug_toggle") and on == true:
		on = false
	if on == true:
		self.visible = true
	if on == false:
		self.visible = false
		
