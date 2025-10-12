class_name LastNamesTable extends Node

var _random = RandomNumberGenerator.new()
var _names: Array[String] = [
	"Carbonara",
	"Caboose",
	"Delerium",
	"Fantastic",
	"Ferocious",
	"Freestyle",
	"Horse",
	"Inferno",
	"Intensity",
	"Omega",
	"Manhattan",
	"Mojito",
	"Monsoon",
	"Vandalay",
	"Veracity",
	"You-Know-It!"
]

func roll() -> String:
	var index = _random.randi_range(0, _names.size() - 1)
	return _names[index]
