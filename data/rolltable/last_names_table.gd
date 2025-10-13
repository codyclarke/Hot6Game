class_name LastNamesTable extends Node

var _random = RandomNumberGenerator.new()
var _names: Array[String] = [
	"Antares",
	"Book'Em",
	"Carbonara",
	"Caboose",
	"Chainsaw",
	"Delerium",
	"Deluxe",
	"Dingler",
	"Fantastic",
	"Ferocious",
	"Freestyle",
	"Glasseater",
	"Horse",
	"Inferno",
	"Intensity",
	"Omega",
	"Mandalay",
	"Manhattan",
	"Mojito",
	"Monsoon",
	"Tarantula",
	"Turtledove",
	"Veracity",
	"Whiplash",
	"You-Know-It!",
	"Zweihander",
]

func roll() -> String:
	var index = _random.randi_range(0, _names.size() - 1)
	return _names[index]
