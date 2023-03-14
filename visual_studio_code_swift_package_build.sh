#! /bin/zsh

SDK=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS16.2.sdk
TARGET=arm64-apple-ios16.2

swift build --arch arm64 -Xswiftc -sdk -Xswiftc $SDK -Xswiftc -target -Xswiftc $TARGET