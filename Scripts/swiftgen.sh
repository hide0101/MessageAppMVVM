#!/usr/bin/bash
if which mint >/dev/null; then
    mint run swiftgen
else
    echo 'warning: Mint not installed. Please install mint from https://github.com/yonaskolb/Mint'
fi