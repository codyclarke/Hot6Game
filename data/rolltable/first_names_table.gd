class_name FirstNamesTable extends Node

var _random = RandomNumberGenerator.new()
var _names: Array[String] = [
	"Adonis",
	"Alpha",
	"Attila",
	"Blaze",
	"Bruce",
	"Chop",
	"Dirk",
	"Doctor",
	"Eagle",
	"George Washington",
	"Gunther",
	"Julian",
	"Juice",
	"Kip",
	"Krag",
	"Lance",
	"Mantis",
	"Melissa",
	"Muscles",
	"Palladium",
	"Pony",
	"Quad",
	"Quesadillas",
	"Shuriken",
	"Steel",
	"Thör",
	"Tony",
	"Tornado",
	"Ulysses",
	"Zip",
]

func roll() -> String:
	var index = _random.randi_range(0, _names.size() - 1)
	return _names[index]
