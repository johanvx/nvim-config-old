local status, stylua = pcall(require, "stylua-nvim")
if not status then
	return
end

stylua.setup({})

-- vim:sw=2:ts=2:sts=2:et:tw=80:cc=+1:fdm=marker:fdl=0:norl:
