#!/usr/bin/python3

#Seperate files based on formats

import os

mode = input("Enter 1 for automatic mode or 2 for customizable")

if mode != "1" and mode !="2":
    print("Please enter 1 or 2")
    mode = input("Enter 1 for automatic mode or 2 for customizable")

def automatic():
    for f in os.listdir():
        x = f.split(".",1)[-1]
        if x == "jpg" or x == "png" or x == "HEIC": #Pictures
            os.rename(f,f'/home/jay/Pictures/{f}')
        elif x == "pdf" or x == "docx": #Documents
            os.rename(f, f'/home/jay/Documents/files/{f}')
        elif x == "mp4": #Videos
            os.rename(f, f'/home/jay/Videos/{f}')
    return()

def customizable():
    file_format = input("Specify the file format that you want to move example png, pdf, docx/")
    destination = input("Specify the destination folder example /home/john/Pictures")

    for f in os.listdir():
        x = f.split(".",1)[-1]
        if x == file_format: #Pictures
            os.rename(f,f'{destination}/{f}')
    return()

if mode == "1":
    automatic()
elif mode == "2":
    customizable()

