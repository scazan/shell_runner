function scandir()
	local i, t, popen = 0, {}, io.popen
	for filename in popen('ls /home/we/dust/code/util_scripts/scripts/'):lines() do
		i = i + 1
		t[i] = filename
	end
	return t
end


function map(mappingFunction, t)
	local newTable = {}
	local t_len = #t
	for i = 1, t_len do
		newTable[i] = mappingFunction(t[i])
	end
	return newTable
end

file_table = scandir(script_path)
function init()
  params:add_separator()
  map(function(scriptName) params:add{type = "trigger", id = "script_name", name = scriptName, action = function() os.execute("/home/we/dust/code/util_scripts/scripts/"..scriptName) end } end, scandir())
  redraw()
end

function redraw()
  screen.clear()
  screen.move(0,10)
  screen.text('check the params to trigger scripts')
  screen.update()
end