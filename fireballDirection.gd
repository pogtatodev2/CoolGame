extends Sprite2D


func _process(delta):
	if PlayerVars.DIR == "right":
		flip_h = true
	else: 
		flip_h = false
