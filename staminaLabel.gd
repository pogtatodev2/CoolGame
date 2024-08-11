extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
var fakeText = "Stamina: %s"
var trueText = fakeText % PlayerVars.stamina

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	trueText = fakeText % PlayerVars.stamina
	self.set_text(trueText)
	pass
