extends CharacterBody2D

var right = true
var locked = false

func _process(delta):
	pass
func _physics_process(delta):
	if $RayCast2D.is_colliding() or $RayCast2D4.is_colliding():

		if right == true:
			position.x -= 1
		elif right == false:
			position.x += 1
	else: 
		position.y += 2.5
		
	if $RayCast2D2.is_colliding() or $RayCast2D5.is_colliding():
		right = true
	elif $RayCast2D3.is_colliding() or $RayCast2D6.is_colliding():
		right = false
	if $RayCast2D2.is_colliding() and $RayCast2D5.is_colliding() or $RayCast2D3.is_colliding() and $RayCast2D6.is_colliding():
		position.y -= 2
		
		
	move_and_slide()
	
	

		
