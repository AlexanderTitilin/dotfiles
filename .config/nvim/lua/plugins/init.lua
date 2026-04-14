
local files = vim.fs.dir(
    vim.fn.expand("~/.config/nvim/lua/plugins"))
local plugins = {}
for file in files do
    if file ~= "init.lua" and file:match("%.lua$") then
        local plugin_name = string.format("plugins.%s",string.sub(file,1,-5))
        table.insert(plugins,{import=plugin_name})
    end
end
return plugins
