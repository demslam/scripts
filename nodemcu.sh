#/bin/bash

####
#By: Matt (Dem) Briggs
#Date: 2020/03/27
#A simple bash script to start nodemcu-pyflasher
#https://github.com/marcelstoer/nodemcu-pyflasher
# pip3 install -U -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-20.04 wxPython
####

#directory of nodemcu-pyflasher
dir="~/Downloads/nodemcu-pyflasher"
cd $dir
#python3 -m venv venv; . venv/bin/active; python3 nodemcu-pyflasher.py
python3 -m venv venv; . venv/bin/activate; python3 nodemcu-pyflasher.py
