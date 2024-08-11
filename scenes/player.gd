extends Area2D

@export var speed = 425
var screen_size 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	
	#ahahahaha
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("moveRight"):
		velocity.x += 20
	if Input.is_action_pressed("moveLeft"):
		velocity.x -= 20
	if Input.is_action_pressed("moveDown"):
		velocity.y += 20
	if Input.is_action_pressed("moveUp"):
		velocity.y -= 20
		
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$walkAnim.play()
		$idleAnim.stop()
		$idleAnim.visible = false
		$walkAnim.visible = true
		
	else:
		$walkAnim.stop()
		$walkAnim.visible = false
		$idleAnim.play()
		$idleAnim.visible = true
		
		
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
