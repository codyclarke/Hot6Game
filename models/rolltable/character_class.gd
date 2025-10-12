class_name CharacterClass extends Node

@export var title: String
@export var prefix: String
@export var suffix: String

static func create(t: String, p: String, s: String) -> CharacterClass:
	var char_class = CharacterClass.new()
	char_class.title = t
	char_class.prefix = p
	char_class.suffix = s
	return char_class

func formatted_prefix() -> String:
	if (prefix.is_empty()):
		return ""
	else:
		return prefix + " "
		
func formatted_suffix() -> String:
	if (suffix.is_empty()):
		return ""
	else:
		return " " + suffix
