#!/usr/bin/env python3

import argparse
import os
import os.path
from os import path

def globber(gpath):

    ifiles = []

    if path.exists(os.path.normpath(gpath)):
        for root, dirs, files in os.walk(os.path.normpath(args.path)):
            for file in files:
                if file.endswith(".d"):
                    ifiles.append(os.path.join(root, file))
    else:
        return FileNotFoundError("Path is not valid or does not exist!")

    return ifiles

argParser = argparse.ArgumentParser()
argParser.add_argument("-p", "--path", help="requires location of generated files in buildpath")

args = argParser.parse_args()

if args.path:
    result = globber(args.path)
    print("\n".join(result))
else:
    print("in order to print generated files, a valid path needs to be givin using flag as --path [location of generated files]")

