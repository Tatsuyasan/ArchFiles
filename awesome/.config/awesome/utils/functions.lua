local naughty = require 'naughty'

return {
    mydebug = function(msg)
        naughty.notify({ title = "My Debug", message = tostring(msg) })
    end
}
