/process/python

/process/python/setup()
	name = "python"
	schedule_interval = 5 SECONDS
	start_delay = 1 SECOND
	fires_at_gamestates = list()
	priority = PROCESS_PRIORITY_IRRELEVANT
	processes.python = src

/process/python/fire()
	return

/process/python/proc/execute(var/command, var/list/args = list())
	if (shell())
		for (var/argument in args)
			command = "[command] [argument]"
		log_debug("Executing python3 command '[command]'")
		return shell("sudo python3 [command]")
	return FALSE

/process/python/proc/getScriptDir()
	return "WW13"
