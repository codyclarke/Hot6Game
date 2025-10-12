class_name IdGenerator extends Node

var _mutex = Mutex.new()
var _id_seq: int = 0

# mutex ensures that only one thread can access this function at a time,
#  which ensures there will be no collisions where two threads request an id 
#  at the exact same time and end up with the same value.
func generate() -> int:
	_mutex.lock()
	_id_seq += 1
	var new_id = _id_seq
	_mutex.unlock()
	return new_id
	
