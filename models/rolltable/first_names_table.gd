class_name FirstNamesTable extends Node

var _random = RandomNumberGenerator.new()
var _names: Array[String] = [
	"Adonis",
	"Alpha",
	"Blaze",
	"Bruce",
	"Chop",
	"Doctor",
	"George Washington",
	"Julian",
	"Juice",
	"Lance",
	"Melissa",
	"Muscles",
	"Palladium",
	"Pony",
	"Quad",
	"Quesadillas",
	"Steel",
	"Thör",
	"Tony",
	"Tornadoes",
]

func roll() -> String:
	var index = _random.randi_range(0, _names.size() - 1)
	return _names[index]
