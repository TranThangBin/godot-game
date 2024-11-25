extends Label

const _HOUR_LIMIT := 99
const _MAX_TIME_STR := "%2d:00:00.00" % _HOUR_LIMIT

var _elapsed_time_seconds := 0.0
var _milliseconds:
	get:
		return (_elapsed_time_seconds - int(_elapsed_time_seconds)) * 100
var _seconds:
	get:
		return int(_elapsed_time_seconds) % 60
var _minutes:
	get:
		return int(_elapsed_time_seconds / 60) % 60
var _hours:
	get:
		return _elapsed_time_seconds / 3600


func _process(delta):
	if _hours >= _HOUR_LIMIT and get_text() != _MAX_TIME_STR:
		set_text(_MAX_TIME_STR)
		set_process(false)
		return

	_elapsed_time_seconds += delta

	if _hours >= 1:
		set_text("%2d:%2d:%2d.%2d" % [_hours, _minutes, _seconds, _milliseconds])
	else:
		set_text("%2d:%2d.%2d" % [_minutes, _seconds, _milliseconds])
