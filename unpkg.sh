#!/bin/sh

set -ex

cd "$(dirname "$0")"/sdk

echo "# Extracting the SDK"

mkdir -p root
cd root

# L.egacy?
#pbzx ../CLTools_macOSLMOS_SDK.pkg | cpio -i -d -u
# N.ew?
pbzx ../CLTools_macOSNMOS_SDK.pkg | cpio -i -d -u
# Tools
pbzx ../CLTools_Executables.pkg | cpio -i -d -u
# SDK
pbzx ../CLTools_macOS_SDK.pkg | cpio -i -d -u

mkdir -p Contents/Developer/Platforms/MacOSX.platform/Developer
mv Library/Developer/CommandLineTools/SDKs Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs
cp -Rf Library/Developer/CommandLineTools/usr Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX*.*.sdk/usr
