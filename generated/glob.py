#!/usr/bin/env python3
import os
import os.path
from os import path
import sys

def main(sourcePath):

    sourcePath = ''.join(sourcePath)

    foundFiles = []

    if path.exists(sourcePath):
        for root, dirs, files in os.walk(os.path.normpath(sourcePath)):
            for file in files:                
                if file.endswith(".d"):
                    #foundFiles.append(os.path.join(root, file))
                    foundFiles.append(os.path.relpath(os.path.join(os.path.relpath(sourcePath, start = sourcePath), root, file)))
                    
    else:
        return FileNotFoundError("Path is not valid or does not exist!")
    return foundFiles

if __name__ == '__main__':
    
    fileList = main(sys.argv[1:])

    for file in fileList:
        print(file)