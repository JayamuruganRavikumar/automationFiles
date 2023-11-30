#!/usr/bin/python3

#Seperate files based on formats

import os

for f in os.listdir():
    x = f.split(".",1)[-1]
    if x == "jpg" or x == "png" or x == "HEIC": #Pictures
        os.rename(f,f'/home/jay/Pictures/{f}')
    elif x == "pdf" or x == "docx": #Documents
        os.rename(f, f'/home/jay/Documents/files/{f}')
    elif x == "mp4": #Videos
        os.rename(f, f'/home/jay/Videos/{f}')


