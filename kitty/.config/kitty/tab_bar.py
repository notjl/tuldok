# Taken from kitty/tab_bar.py and inspired by https://github.com/kovidgoyal/kitty/discussions/4447#discussioncomment-3240635
from datetime import datetime
from kitty.boss import get_boss
from kitty.fast_data_types import Screen, add_timer, get_options
from kitty.utils import color_as_int
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_title,
)

opts = get_options()
BAR_BG = as_rgb(color_as_int(opts.tab_bar_background))
BAT_TEXT_COLOR = as_rgb(color_as_int(opts.color15))
CLOCK_COLOR = as_rgb(color_as_int(opts.color15))
DATE_COLOR = as_rgb(color_as_int(opts.color8))
RIGHT_MARGIN = 1
REFRESH_TIME = 1
MARGIN_SYMBOL = "▊"
UNPLUGGED_BAT = {
    10: ["", as_rgb(0xFF6961)],
    20: ["", as_rgb(0xF9F871)],
    30: ["", as_rgb(0x96EFA1)],
    40: ["", as_rgb(0x96EFA1)],
    50: ["", as_rgb(0x96EFA1)],
    60: ["", as_rgb(0x96EFA1)],
    70: ["", as_rgb(0x96EFA1)],
    80: ["", as_rgb(0x96EFA1)],
    90: ["", as_rgb(0x96EFA1)],
    100: ["", as_rgb(0x96EFA1)],
}
PLUGGED_BAT = {
    10: ["󰢟 ", as_rgb(0xFF6961)],
    20: ["󰢜 ", as_rgb(0xF9F871)],
    30: ["󰂆 ", as_rgb(0x96EFA1)],
    40: ["󰂇 ", as_rgb(0x96EFA1)],
    50: ["󰂈 ", as_rgb(0x96EFA1)],
    60: ["󰢝 ", as_rgb(0x96EFA1)],
    70: ["󰂉 ", as_rgb(0x96EFA1)],
    80: ["󰢞 ", as_rgb(0x96EFA1)],
    90: ["󰂊 ", as_rgb(0x96EFA1)],
    100: ["󰂅 ", as_rgb(0x96EFA1)],
}

def _draw_icon(screen: Screen, index: int) -> int:
    if index != 1:
        return 0
    fg, bg = screen.cursor.fg, screen.cursor.bg
    screen.cursor.bg, screen.cursor.fg = as_rgb(0x11111B), as_rgb(0xCBA6F7)
    screen.draw(MARGIN_SYMBOL)
    screen.cursor.bg = BAR_BG
    screen.draw(" 🐙 ")
    screen.cursor.fg, screen.cursor.bg = fg, bg
    screen.cursor.x = len(MARGIN_SYMBOL + " 🐙 ")


def _draw_left_status(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    screen.cursor.bg, screen.cursor.fg = as_rgb(0x11111B), as_rgb(0xCBA6F7)
    if draw_data.leading_spaces:
        screen.draw(" " * draw_data.leading_spaces)
    draw_title(draw_data, screen, tab, index, max_title_length)
    trailing_spaces = min(max_title_length - 1, draw_data.trailing_spaces)
    max_title_length -= trailing_spaces
    extra = screen.cursor.x - before - max_title_length
    if extra > 0:
        screen.cursor.x -= extra + 1
        screen.draw('...')
    if trailing_spaces:
        screen.draw(' ' * trailing_spaces)
    end = screen.cursor.x
    screen.cursor.bold = screen.cursor.italic = False
    screen.cursor.fg = 0
    if not is_last:
        screen.cursor.bg = as_rgb(0x11111B)
        screen.draw(draw_data.sep)
    screen.cursor.bg = 0
    return end


def _draw_right_status(screen: Screen, is_last: bool, cells: list) -> int:
    if not is_last:
        return 0
    draw_attributed_string(Formatter.reset, screen)
    screen.cursor.x = screen.columns - right_status_length
    screen.cursor.fg = 0
    for color, status in cells:
        screen.cursor.fg = color
        screen.draw(status)
    screen.cursor.bg = 0
    screen.cursor.bg = as_rgb(0xCBA6F7)
    screen.draw(" ")
    return screen.cursor.x


def _redraw_tab_bar(_):
    tm = get_boss().active_tab_manager
    if tm is not None:
        tm.mark_tab_bar_dirty()


def get_battery_cells() -> list:
    def threshold(curr_percent: int, batt_table: dict) -> list:
        for key, content in batt_table.items():
            if key == 10:
                if curr_percent in range(0, key+1):
                    return content
            if curr_percent in range(key-10, key+1):
                return content

    try:
        with (
            open('/sys/class/power_supply/BAT0/status', 'r') as statfile,
            open('/sys/class/power_supply/BAT0/capacity', 'r') as capfile,
        ):
            status = statfile.read()
            percent = int(capfile.read())
        if status == 'Discharging\n':
            icon, icon_color = threshold(percent, UNPLUGGED_BAT)
        elif status == 'Not charging\n':
            icon, icon_color = threshold(percent, UNPLUGGED_BAT)
        else:
            icon, icon_color = threshold(percent, PLUGGED_BAT)
        percent_cell = (BAT_TEXT_COLOR, str(percent) + "% ")
        icon_cell = (icon_color, icon)
        return [percent_cell, icon_cell]
    except FileNotFoundError:
        return []

timer_id = None
right_status_length = -1

def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    global timer_id
    global right_status_length
    if timer_id is None:
        timer_id = add_timer(_redraw_tab_bar, REFRESH_TIME, True)
    clock = datetime.now().strftime(" %H:%M")
    date = datetime.now().strftime(" %d.%m.%Y")
    cells = get_battery_cells()
    cells.append((CLOCK_COLOR, clock))
    cells.append((DATE_COLOR, date))
    cells.append((as_rgb(0xCBA6F7), " "))
    right_status_length = RIGHT_MARGIN
    for cell in cells:
        right_status_length += len(str(cell[1]))

    _draw_icon(screen, index)
    _draw_left_status(
        draw_data,
        screen,
        tab,
        before,
        max_title_length,
        index,
        is_last,
        extra_data,
    )
    _draw_right_status(
        screen,
        is_last,
        cells,
    )
    return screen.cursor.x
