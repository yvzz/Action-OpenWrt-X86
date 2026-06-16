-- OpenList 应用过滤：从 services 移到 files 菜单
module("luci.controller.openlist", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/openlist") then
        return
    end

    local page
    page = entry({"admin", "files", "openlist"}, alias("admin", "files", "openlist", "config"), ("OpenList"), 99)
    page.dependent = false
    page.acl_depends = {"luci-app-openlist"}

    entry({"admin", "files", "openlist", "config"}, cbi("openlist"), _("Settings"), 10).leaf=true
    entry({"admin", "files", "openlist", "log"}, template("openlist/openlist_log"), _("Log"), 20).leaf=true

    entry({"admin","files","openlist","status"}, call("act_status")).leaf = true
    entry({"admin","files","openlist","get_log"}, call("act_log")).leaf = true
end

function act_status()
    local e = {}
    e.running = luci.sys.call("pgrep -f openlist >/dev/null") == 0
    luci.http.prepare_content("application/json")
    luci.http.write_json(e)
end

function act_log()
    local content, err = nixio.fs.readfile("/var/run/openlist/log/openlist.log")
    if content then
        luci.http.prepare_content("application/json")
        luci.http.write_json({log = content or ""})
    else
        luci.http.prepare_content("application/json")
        luci.http.write_json({error = tostring(err)})
    end
end
