#!/bin/sh

# if DISPLAY is not set, then is not recognized X inside crontab
DISPLAY=:0 feh --bg-fill --auto-rotate -d --randomize /tank_data_1/photos/selection_photos/ -r
DISPLAY=:1 feh --bg-fill --auto-rotate -d --randomize /tank_data_1/photos/selection_photos/ -r

# DISPLAY=:0 feh --auto-rotate -d --randomize /tank_data_1/photos/
# DISPLAY=:1 feh --auto-rotate -d --randomize /tank_data_1/photos/
