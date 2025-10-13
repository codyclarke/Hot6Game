class_name LastNamesTable extends Node

var _random = RandomNumberGenerator.new()
var _names: Array[String] = [
	"Adrenaline",
	"Antares",
	"Attitude",
	"Book'Em",
	"Bloater",
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
	"Gymnasium",
	"Horse",
	"Inferno",
	"Intensity",
	"Omega",
	"Mandalay",
	"Manhattan",
	"Mojito",
	"Monsoon",
	"Spittoon",
	"Tarantula",
	"Tittleman",
	"Turtledove",
	"Veracity",
	"Strongbody",
	"Whiplash",
	"You-Know-It!",
	"Zweihander",
]

func roll() -> String:
	var index = _random.randi_range(0, _names.size() - 1)
	return _names[index]
