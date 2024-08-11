extends Label

var selected = 1
var selectedLevel = 1

func _ready():
	pass


func _process(delta):
	if selected == 1:
		$acts/ColorRect.position.y = 0
	elif selected == 2:
		$acts/ColorRect.position.y = 64
	elif selected == 3:
		$acts/ColorRect.position.y = 128
		
	if Input.is_action_just_pressed("ui_down"):
		print(selected)
		selected += 1
	if Input.is_action_just_pressed("ui_up"):
		print(selected)
		selected -= 1
	
	if selected == 4:
		selected = 1
	if selected == 0:
		selected = 3
	
	
