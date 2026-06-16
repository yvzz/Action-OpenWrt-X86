-- Transmission: 从 NAS 菜单移到 文件 菜单
module("luci.controller.transmission", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/transmission") then
        return
    end

    local page = entry({"admin", "files", "transmission"}, cbi("transmission"), _("Transmission"))
    page.dependent = true
end
