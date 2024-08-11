extends ColorRect

@onready var timer := get_parent().get_node("BeamTimer")

func _ready():
	timer.start()

func _process(delta):
	pass
	

func _on_beam_timer_timeout() -> void:
	print("man")
