#!/bin/bash -

if [ -d iCalUtil.framework ] ; then
	rm -rf iCalUtil.framework
fi

if [ -d build ] ; then
	rm -rf build
fi

xcodebuild -target iCal -sdk iphonesimulator
xcodebuild -target iCal -sdk iphoneos

mkdir iCalUtil.framework
lipo -create build/Release-iphoneos/libiCal.a build/Release-iphonesimulator/libiCal.a -o iCalUtil.framework/iCalUtil
cp -r build/Release-iphoneos/usr/local/include iCalUtil.framework/Headers
