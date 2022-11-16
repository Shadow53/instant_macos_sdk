#!/bin/sh

set -ex

cd "$(dirname "$0")"/sdk

echo "# Extracting the SDK"

mkdir root
cd root

# L.egacy?
#pbzx ../CLTools_macOSLMOS_SDK.pkg | cpio -i -d -u -v
# N.ew?
pbzx ../CLTools_macOSNMOS_SDK.pkg | cpio -i -d -u -v
# Tools
pbzx ../CLTools_Executables.pkg | cpio -i -d -u -v
# SDK
pbzx ../CLTools_macOS_SDK.pkg | cpio -i -d -u -v

mkdir -p Contents/Developer/Platforms/MacOSX.platform/Developer
mv Library/Developer/CommandLineTools/SDKs Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs
cp -rfv Library/Developer/CommandLineTools/usr Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX*.*.sdk/usr
