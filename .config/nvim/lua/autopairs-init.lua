------- NVIM-AUTOPAIRS -------

local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
    enable_check_bracket_line = false,
    -- ignored_next_char = "[%w%.]",
    fast_wrap = {
        pattern = [=[[%'%"%)%>%]%)%}%,%;]]=],
    }
})

-- press % => %% only while inside a comment or string
local Rule = require('nvim-autopairs.rule')
-- local ts_conds = require('nvim-autopairs.ts-conds')
npairs.add_rules({
    Rule('#include <', '>', "c"),
    Rule('#include <', '>', "cpp")
    -- Rule("%", "%", "lua")
    --     :with_pair(ts_conds.is_ts_node({'string','comment'})),
    -- Rule("$", "$", "lua")
    --     :with_pair(ts_conds.is_not_ts_node({'function'}))
})
