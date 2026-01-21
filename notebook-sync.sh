#!/bin/bash

git pull && git add . && git diff --cached --quiet || git commit -m "Update notebook" && git push

