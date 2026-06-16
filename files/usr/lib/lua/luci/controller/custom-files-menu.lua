-- 创建"文件"左侧菜单
module("luci.controller.custom-files-menu", package.seeall)

function index()
    entry({"admin", "files"}, firstchild(), _("文件"), 55)
end
