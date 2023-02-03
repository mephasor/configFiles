from typing import List  # noqa: F401

import os
import subprocess

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = 'alacritty'

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html

    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "space", lazy.window.toggle_floating(), desc="toogle floating"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Monad-specific keys
    Key([mod, "control"], "h", lazy.layout.grow(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.shrink(),
        desc="shrink"),
    Key([mod, "control"], "j", lazy.layout.maximize(),
        desc="maximize"),
    Key([mod, "control"], "k", lazy.layout.normalize(), desc="normalize window"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod], "d", lazy.spawn('krunner'), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(),
    #    desc="Spawn a command using a prompt widget"),

    Key([mod], 'y', lazy.spawn('/home/kons/idea/idea.sh') , desc="opens intellij" )
]

groups = [Group(i, layout='monadtall') for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])


layout_theme = {
    "margin": 4,
    "border-focus:": "#8be9fd"
}

layouts = [
  #  layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            widgets=[
                widget.CurrentLayout(
                    font="Noto Sans Bold",
                    fontsize=8,
                ),
                widget.TextBox(" | ", fontsize=8),
                widget.WindowName(fontsize=8),
            ],
            size=10, opacity=0.85, background="000000"
        ),
        top=bar.Gap(24)
    ),
    Screen(
        bottom=bar.Bar(
            widgets=[
                widget.CurrentLayout(
                    font="Noto Sans Bold",
                    fontsize=8,
                ),
                widget.TextBox(" | ", fontsize=8),
                widget.WindowName(fontsize=8),
            ],
            size=10, opacity=0.85, background="000000"
        ),
        top=bar.Gap(24)
    ),
    Screen(
        bottom=bar.Bar(
            widgets=[
                widget.CurrentLayout(
                    font="Noto Sans Bold",
                    fontsize=8,
                ),
                widget.TextBox(" | ", fontsize=8),
                widget.WindowName(fontsize=8),
            ],
            size=10, opacity=0.85, background="000000"
        ),
        top=bar.Gap(24)
    )
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    # KDE specific windows
    Match(wm_class='Desktop — Plasma'),
    Match(wm_class='plasmashell'),
    Match(wm_class='Plasma'),
    Match(wm_class='plasma-desktop'),
    Match(wm_class='win7'),
    Match(wm_class='krunner'),
    Match(wm_class='Kmix'),
    Match(wm_class='Klipper'),
    Match(wm_class='Plasmoidviewer'),
    Match(wm_class='(?i)*nextcloud*'),
    Match(wm_class='plasmashell'),
    # Gnome and others,
    ],
    no_reposition_match = Match(wm_class = ['plamsashell', 'Plasma', 'plasma-desktop', 'win7', 'krunner', 'Kmix', 'Klipper', 'Plasmaoidviewer'])
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# KDE Plasma: kill desktop pane when it appears
@hook.subscribe.client_new
def auto_kill_window(window):
    if window.name:
        if "Desktop — Plasma".lower() in window.name.lower():
            window.kill()

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/Projects/configFiles/wallpaper/pickOne.sh'])
    subprocess.call(['picom -b --experimental-backends'])



# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
