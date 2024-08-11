extends RichTextLabel
func _ready():
	pass 

var fakeText = "JUMPS LEFT: %s / 4"
var printedText = fakeText % PlayerVars.jumpCounter

func _process(delta):
	fakeText = "JUMPS LEFT: %s / 4"
	printedText = fakeText % PlayerVars.jumpCounter
	self.text = printedText
	fakeText = "JUMPS LEFT: {str}"
	pass
