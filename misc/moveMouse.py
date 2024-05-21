#!/usr/bin/python3
#https://pypi.org/project/PyAutoGUI/

import pyautogui as pag
import time
import random

while True:
    x = random.randint(400,1000)
    y = random.randint(200,1000)
    pag.moveTo(x,y,0.5)
    time.sleep(2)

