#!/bin/bash
if which mint >/dev/null; then
    # UseCase
    mint run mockolo --sourcedirs $SRCROOT/MessageAppMVVM/Model/UseCase/ --destination $SRCROOT/MessageAppMVVM/Model/UseCase/Mock/UseCaseMock.swift
else
    echo 'warning: Mint not installed. Please install mint from https://github.com/yonaskolb/Mint'
fi