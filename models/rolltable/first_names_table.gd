class_name FirstNamesTable extends Node

var _random = RandomNumberGenerator.new()
var _names: Array[String] = [
	"Horse",
	"Thør",
	"Juice"
]

func roll() -> String:
	var index = _random.randi_range(0, _names.size() - 1)
	return _names[index]
