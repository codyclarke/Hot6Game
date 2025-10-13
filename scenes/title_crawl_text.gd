extends Label

signal finished_printing

var crawl_text: String
var finished: bool = false
@onready var stage_1: PackedScene = preload("res://scenes/stage.tscn")


func _ready() -> void:
	var text_file = FileAccess.open('res://resources/text/title_crawl.txt', FileAccess.READ)
	crawl_text = text_file.get_as_text()
	
	InputMap.add_action("skip_intro")
	var ev = InputEventKey.new()
	ev.keycode = KEY_ENTER
	InputMap.action_add_event("skip_intro", ev)

func _on_timer_timeout() -> void:
	# seems like there should just be a way to pop the first char off one string
	#  and append it to the other
	if text.length() < crawl_text.length():
		text += crawl_text[text.length()]
	else:
		finished_printing.emit()
		
		
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("skip_intro"):
		InputMap.erase_action("skip_intro")
		get_tree().change_scene_to_packed(stage_1)
