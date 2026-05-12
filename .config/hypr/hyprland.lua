
local function init_config()
    return {
        general = {
            border_size=0,
            gaps_in = 0,
            gaps_out = 0,
            layout = "scrolling",
            allow_tearing = false,
        },
        animations = {
            enabled = false
        },
        input = {
            kb_layout = "us,ru",
            kb_variant ="",
            kb_model ="",
            kb_options = "grp:caps_toggle",
            kb_rules ="",

            follow_mouse = 1,

            sensitivity = 0 ,
            touchpad = {
                natural_scroll = false
            }
        },
        decoration = {
            rounding = 0,
            shadow = {
                enabled = false
            },
            blur = {
                enabled = false
            }
        }
    }
end
local function init_monitor()
   return  {
       output = "",
       mode = "preferred",
       position = "auto",
       scale = 2
   }
end
hl.monitor(init_monitor())
hl.on("hyprland.start", function ()
    hl.exec_cmd("waybar & hyprpaper")
end)
local terminal = "alacritty"
local browser = "firefox"
local modkey = "SUPER"
hl.config(init_config())
hl.env("XCURSOR_SIZE",24)
hl.env("HYPRCURSOR_SIZE",24)
hl.bind(modkey .. "+RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(modkey .. "+ D", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind(modkey .."+ W",hl.dsp.window.kill())
hl.bind(modkey .."+ K", hl.dsp.layout("focus r"))
hl.bind(modkey .."+ J",hl.dsp.layout("focus l"))
hl.bind(modkey .."+ H",hl.dsp.layout("swapcol l"))
hl.bind(modkey .. "+ L",hl.dsp.layout("swapcol r"))
hl.bind(modkey .. "+ M",hl.dsp.layout("colresize 1"))
hl.bind(modkey  .. "+ O",hl.dsp.layout("colresize 0.5"))
hl.bind(modkey .. "+ F",hl.dsp.window.fullscreen())
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))
hl.bind(modkey.."+P",hl.dsp.exec_cmd("hyprshot -m region"))
for num = 1,9 do
    hl.bind(string.format(modkey.." + %d",num),hl.dsp.focus({workspace=num}))
    hl.bind(string.format(modkey.."+ SHIFT + %d",num),hl.dsp.window.move({workspace=num}))
    hl.bind(string.format(modkey.." + CTRL + %d",num),hl.dsp.window.move({workspace=num,follow=true}))
end

hl.define_submap("resize",function ()
    hl.bind("l", hl.dsp.layout("colresize +0.1"))
    hl.bind("h", hl.dsp.layout("colresize -0.1"))
    hl.bind("escape",hl.dsp.submap("reset"))
end)
hl.bind(modkey.."+ R",hl.dsp.submap("resize"))
hl.define_submap("launcher",function ()
    hl.bind("1",hl.dsp.exec_cmd(terminal.." -e nvim"))
    hl.bind("1",hl.dsp.submap("reset"))
    hl.bind("2",hl.dsp.exec_cmd(browser))
    hl.bind("2",hl.dsp.submap("reset"))
    hl.bind("escape",hl.dsp.submap("reset"))
end)
hl.bind(modkey.."+ A",hl.dsp.submap("launcher"))

hl.window_rule({
    name= "apply-hiddify",
    match = {
        class = "hiddify"
    },
    workspace = 9
})
hl.window_rule({

    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = true,
        pin = false
    },
    no_focus = true
})
hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*"
    },
    suppress_event = "maximize"
})
