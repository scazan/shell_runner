-- # SCRIPTS
-- a very simple interface for
-- the norns to list and execute
-- any shell script located in
-- its "scripts" directory
-- directly from the norns.
--
--all data is copied to
-- ~/dust/data/norns_scripts/


local UI = require 'ui'
local util = require 'util'
local message

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
		newTable[i] = mappingFunction(t[i], i)
	end
	return newTable
end

files = scandir()
local scriptRoot = "/home/we/dust/code/util_scripts/scripts/"
local list = UI.ScrollingList.new (0, 20, 1, files);

function init()
  params:add_separator()
  map(function(scriptName) params:add{type = "trigger", id = "script_name", name = scriptName, action = function()  end } end, files)
  redraw()
  
  -- Start drawing to screen
  screen_refresh_metro = metro.init()
  screen_refresh_metro.event = function()
    if screen_dirty then
      screen_dirty = false
      redraw()
    end
  end
  screen_refresh_metro:start(1 / 24)

end

-- Encoder input
function enc(n, delta)
    if n == 2 then
      list:set_index_delta(util.clamp(delta, -1, 1))
      
      screen_dirty = true
    end
end

function key(n, z)
  if z == 1 then
    if n == 3 then
      if (message) then
        local scriptName = files[list.index]
          message = UI.Message.new({"executing "..scriptName})
          redraw()
          os.execute(scriptRoot..scriptName)
          message = nil
        else
          message = UI.Message.new({"execute "..files[list.index].."?", "", "KEY2 to cancel", "KEY3 to confirm"})
        end
    end
    if n == 2 then
      if (message) then
        message = nil
      end
    end
  end
  
  screen_dirty = true
end
  
  
function redraw()
  screen.clear()
  
  if message then
    message:redraw()
  else
    screen.move(0,10)
    screen.text('SCRIPTS')
  
    list:redraw()
  end
  screen.update()
end
