local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then
    return
end

autotag.setup({})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
