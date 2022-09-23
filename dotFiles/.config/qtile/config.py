# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


import os
import re
import socket
import subprocess
from typing import List  # noqa: F401
from libqtile import layout, bar, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen, Rule
from libqtile.command import lazy

from libqtile.widget import Spacer

# mod4 or mod = super key
mod = "mod4"
mod1 = "alt"
mod2 = "control"
home = os.path.expanduser('~')



@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


myTerm = "alacritty"

print('<<<><<><><>>>>>  hi kons')



# HOTKEYS
keys = [
    # SUPER + FUNCTION KEYS

    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "t", lazy.spawn('xterm')),
    Key([mod], "r", lazy.spawn('nwggrid -p -f -o 0.4')),
    Key([mod], "d", lazy.spawn('rofi -show drun -show-icons')),
    # lock screen
    Key([mod], "b", lazy.spawn('/home/kons/.config/qtile/scripts/lockMe')),
    Key([mod], "Escape", lazy.spawn('xkill')),
    Key([mod], "Return", lazy.spawn('alacritty')),
    Key([mod], "KP_Enter", lazy.spawn('alacritty')),
    Key([mod], "x", lazy.shutdown()),

    # monitor keys
    Key([mod], "w", lazy.to_screen(0)),
    Key([mod], "e", lazy.to_screen(1)),

    # SUPER + SHIFT KEYS

    Key([mod, "shift"], "Return", lazy.spawn('pcmanfm')),
    Key([mod, "shift"], "d", lazy.spawn(
        "dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'")),
    #    Key([mod, "shift"], "d", lazy.spawn(home + '/.config/qtile/scripts/dmenu.sh')),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "control"], "r", lazy.restart()),

    # CONTROL + ALT KEYS

    Key(["mod1", "control"], "o", lazy.spawn(
        home + '/.config/qtile/scripts/picom-toggle.sh')),
    Key(["mod1", "control"], "t", lazy.spawn('xterm')),
    Key(["mod1", "control"], "u", lazy.spawn('pavucontrol')),

    # ALT + ... KEYS


    Key(["mod1"], "p", lazy.spawn('pamac-manager')),
    Key(["mod1"], "f", lazy.spawn('vivaldi-stable')),
    Key(["mod1"], "m", lazy.spawn('pcmanfm')),
    Key(["mod1"], "w", lazy.spawn('garuda-welcome')),


    # CONTROL + SHIFT KEYS

    Key([mod2, "shift"], "Escape", lazy.spawn('lxtask')),


    # SCREENSHOTS

    Key([], "Print", lazy.spawn('flameshot full -p ' + home + '/Pictures')),
    Key([mod2], "Print", lazy.spawn('flameshot full -p ' + home + '/Pictures')),
    #    Key([mod2, "shift"], "Print", lazy.spawn('gnome-screenshot -i')),

    # MULTIMEDIA KEYS

    # INCREASE/DECREASE BRIGHTNESS
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),

    # INCREASE/DECREASE/MUTE VOLUME
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),

# Keyboard keys fro volume control
    Key([mod], "Page_Down", lazy.spawn("amixer -q set Master 5%-")),
    Key([mod], "Page_Up", lazy.spawn("amixer -q set Master 5%+")),

    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),

    #    Key([], "XF86AudioPlay", lazy.spawn("mpc toggle")),
    #    Key([], "XF86AudioNext", lazy.spawn("mpc next")),
    #    Key([], "XF86AudioPrev", lazy.spawn("mpc prev")),
    #    Key([], "XF86AudioStop", lazy.spawn("mpc stop")),

    # QTILE LAYOUT KEYS
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "space", lazy.next_layout()),

    # CHANGE FOCUS
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),


    # RESIZE UP, DOWN, LEFT, RIGHT
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),


    # FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),

    # FLIP LAYOUT FOR BSP
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),

    # MOVE WINDOWS UP OR DOWN BSP LAYOUT
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

    # Treetab controls
    # Key([mod, "control"], "k",
    #     lazy.layout.section_up(),
    #     desc='Move up a section in treetab'
    #     ),
    # Key([mod, "control"], "j",
    #     lazy.layout.section_down(),
    #     desc='Move down a section in treetab'
    #     ),



    # MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),

    # TOGGLE FLOATING LAYOUT for the currently focused window
    Key([mod, "shift"], "space", lazy.window.toggle_floating()), ]

groups = []

# FOR QWERTY KEYBOARDS
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ]


group_labels = ["1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ", "9 ", "0", ]
#group_labels = ["1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ", "9 ", "0",]
#group_labels = ["", "", "", "", "", "", "", "", "", "",]
#group_labels = ["", "", "", "", "",]
#group_labels = ["Web", "Edit/chat", "Image", "Gimp", "Meld", "Video", "Vb", "Files", "Mail", "Music",]

group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall",
                 "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", ]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend([

        # CHANGE WORKSPACES
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod], "Tab", lazy.screen.next_group()),
        Key([mod, "shift"], "Tab", lazy.screen.prev_group()),
        Key(["mod1"], "Tab", lazy.screen.next_group()),
        Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),

        # MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON WORKSPACE
        #Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
        # MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND FOLLOW MOVED WINDOW TO WORKSPACE
        Key([mod, "shift"], i.name, lazy.window.togroup(
            i.name), lazy.group[i.name].toscreen()),
    ])


def init_layout_theme():
    return {"margin": 10,
            "border_width": 2,
            "border_focus": "#ff00ff",
            "border_normal": "#f4c2c2"
            }


layout_theme = init_layout_theme()


layouts = [
    layout.MonadTall(margin=16, border_width=2,
                     border_focus="#ff00ff", border_normal="#f4c2c2"),
    layout.MonadWide(margin=16, border_width=2,
                     border_focus="#ff00ff", border_normal="#f4c2c2"),
    layout.Floating(**layout_theme),
    layout.Max(**layout_theme),
    layout.Columns(**layout_theme),
    # layout.Matrix(**layout_theme),
    #    layout.Bsp(**layout_theme),
    #    layout.RatioTile(**layout_theme),
    #    layout.Stack(**layout_theme),
    #    layout.Tile(**layout_theme),
    #    layout.TreeTab(
    #        sections=['FIRST', 'SECOND'],
    #        bg_color = '#141414',
    #        active_bg = '#0000ff',
    #        inactive_bg = '#1e90ff',
    #        padding_y =5,
    #        section_top =10,
    #        panel_width = 280),
    #    layout.VerticalTile(**layout_theme),
    #    layout.Zoomy(**layout_theme)
]

# COLORS FOR THE BAR


def init_colors():
    return [
        ["#282a36", "#282a36"],  #  0 - Background
        ["#282a36", "#282a36"],  #  1 - Background
        ["#44475a", "#44475a"],  #  2 - Current line
        ["#f8f8f2", "#f8f8f2"],  #  3 - Foreground
        ["#6272a4", "#6272a4"],  #  4 - Comment
        ["#8be9fd", "#8be9fd"],  #  5 - Cyan
        ["#50fa7b", "#50fa7b"],  #  6 - Green
        ["#ffb86c", "#ffb86c"],  #  7 - Orange
        ["#ff79c6", "#ff79c6"],  #  8 - Pink
        ["#bd93f9", "#bd93f9"],  #  9 - Purple
        ["#ff5555", "#ff5555"],  # 10 - Red
        ["#f1fa8c", "#f1fa8c"]   # 11 - Yellow
    ]


colors = init_colors()


def base(fg='text', bg='dark'):
    return {'foreground': colors[4], 'background': colors[1]}


# WIDGETS FOR THE BAR

def init_widgets_defaults():
    return dict(font="Noto Sans",
                fontsize=16,
                padding=2,
                background=colors[1])


widget_defaults = init_widgets_defaults()


def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = [

        widget.Sep(
            linewidth=1,
            padding=10,
            foreground=colors[4],
            background=colors[9]
        ),              #
        # only works in garuda
        widget.GroupBox(
            **base(bg=colors[1]),
            font='UbuntuMono Nerd Font',
            fontsize=11,
            margin_y=3,
            margin_x=2,
            padding_y=5,
            padding_x=4,
            borderwidth=3,

            active=colors[5],
            inactive=colors[6],

            rounded=True,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=colors[10],
            this_current_screen_border=colors[10],
            this_screen_border=colors[7],
            other_current_screen_border=colors[3],
            other_screen_border=colors[6],
            disable_drag=True
        ),

        # 
        # 
        widget.CurrentLayout(
            font="Noto Sans Bold",
            fontsize=12,
            foreground=colors[4],
            background=colors[9]
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            foreground=colors[4],
            background=colors[9],
            padding=0,
            scale=0.7
        ),
        widget.CurrentScreen(
            active_text="⬤",
            inactive_text="⬤",
            foreground=colors[4],
            background=colors[9],
        ),
        widget.TaskList(
            highlight_method='border',  # or block
            icon_size=17,
            max_title_width=150,
            rounded=True,
            padding_x=0,
            padding_y=0,
            margin_y=0,
            fontsize=14,
            border=colors[2],
            foreground=colors[4],
            margin=2,
            txt_floating='🗗',
            txt_minimized='>_ ',
            borderwidth=1,
            background=colors[1],
            #unfocused_border = 'border'
        ),

        widget.Net(
            font="Noto Sans",
            fontsize=12,
            # Here enter your network name
            interface=["wlp61s0"],
            format='{down} ↓↑ {up}',
            foreground=colors[4],
            background=colors[9],
            padding=5,
        ),
        widget.CPU(
            font="Noto Sans",
            #format = '{MemUsed}M/{MemTotal}M',
            update_interval=1,
            fontsize=12,
            foreground=colors[4],
            background=colors[1],
            padding=5,
            mouse_callbacks={
                'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
        ),

        widget.Memory(
            font="Noto Sans",
            format='{MemUsed: .0f}G/{MemTotal: .0f}G',
            update_interval=1,
            fontsize=12,
            padding=3,
            measure_mem='G',
            foreground=colors[4],
            background=colors[9],
            mouse_callbacks={
                'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
        ),

        widget.OpenWeather(
            cityid="5957776",
            format="{main_temp} °{units_temperature} {humidity}%",
            fontsize=12,
            foreground=colors[4],
            background=colors[1]
        ),

        widget.Clock(
            foreground=colors[4],
            background=colors[7],
            fontsize=16,
            format="%Y-%m-%d %H:%M"
        ),

        widget.Battery(
        ),

        widget.Systray(
            background=colors[1],
            icon_size=20,
            padding=4
        ),
        widget.Sep(
            linewidth=1,
            padding=10,
            foreground=colors[4],
            background=colors[1]
        ),              #
    ]
    return widgets_list


widgets_list = init_widgets_list()


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2


widgets_screen1 = init_widgets_screen1()
widgets_screen2 = init_widgets_screen2()


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=24, opacity=0.85, background="000000")),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), size=24, opacity=0.85, background="000000"))]


screens = init_screens()


# MOUSE CONFIGURATION
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]

dgroups_key_binder = None
dgroups_app_rules = []


main = None




floating_types = ["notification", "toolbar", "splash", "dialog"]


follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class='confirm'),
        Match(wm_class='dialog'),
        Match(wm_class='download'),
        Match(wm_class='error'),
        Match(wm_class='file_progress'),
        Match(wm_class='notification'),
        Match(wm_class='splash'),
        Match(wm_class='toolbar'),
        Match(wm_class='confirmreset'),
        Match(wm_class='makebranch'),
        Match(wm_class='maketag'),
        Match(wm_class='Arandr'),
        Match(wm_class='feh'),
        Match(wm_class='Galculator'),
        Match(title='branchdialog'),
        Match(title='Open File'),
        Match(title='pinentry'),
        Match(wm_class='ssh-askpass'),
        Match(wm_class='lxpolkit'),
        Match(wm_class='Lxpolkit'),
        Match(wm_class='yad'),
        Match(wm_class='Yad'),
        Match(wm_class='Cairo-dock'),
        Match(wm_class='cairo-dock'),
    ],
    fullscreen_border_width=0,
    border_width=0)
auto_fullscreen = True

focus_on_window_activation = "focus"  # or smart

wmname = "LG3D"

# HOOKS


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])


@hook.subscribe.startup
def start_always():
    print('startup')
    # Set the cursor to something sane in X
    #subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])


@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True
