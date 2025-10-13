class_name CharacterTitle extends Resource

@export var title: String
@export var prefix: String
@export var suffix: String

static func create(t: String, p: String = "", s: String = "") -> CharacterTitle:
	var char_title = CharacterTitle.new()
	char_title.title = t
	char_title.prefix = p
	char_title.suffix = s
	return char_title

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
