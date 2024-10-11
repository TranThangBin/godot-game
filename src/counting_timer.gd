extends Label

const HOUR_LIMIT := 99
const MAX_TIME_STR := "%2d:00:00.00" % HOUR_LIMIT

var format_str_minute := "{1}:{2}.{3}"
var format_str_hour := "{0}:{1}:{2}.{3}"
var active_format_str := format_str_minute

enum Times { HOURS, MINUTES, SECONDS, MILLISECONDS }
var times := [0.0, 0.0, 0.0, 0.0]
var elapsed_time_seconds := 0.0

func _process(delta):
	if times[Times.HOURS] >= HOUR_LIMIT and get_text() != MAX_TIME_STR:
		set_text(MAX_TIME_STR)
		set_process(false)
		return
	
	elapsed_time_seconds += delta
	
	times[Times.MILLISECONDS] = (elapsed_time_seconds - int(elapsed_time_seconds)) * 100
	times[Times.SECONDS] = int(elapsed_time_seconds) % 60
	times[Times.MINUTES] = int(elapsed_time_seconds / 60) % 60
	times[Times.HOURS] = elapsed_time_seconds / 3600
	
	if times[Times.HOURS] >= 1 and active_format_str != format_str_hour:
		active_format_str = format_str_hour
	
	set_text(active_format_str.format(times.map(func (time): return "%02d" % time)))
