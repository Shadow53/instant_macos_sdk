#!/bin/sh

set -x

cd "$(dirname "$0")"/sdk

echo "# Extracting the SDK"

mkdir root
cd root

# L.egacy?
#pbzx CLTools_macOSLMOS_SDK.pkg | cpio -i
# N.ew?
pbzx CLTools_macOSNMOS_SDK.pkg | cpio -i
# Tools
pbzx CLTools_Executables.pkg | cpio -i
# SDK
pbzx CLTools_macOS_SDK.pkg | cpio -i

mkdir -p Contents/Developer/Platforms/MacOSX.platform/Developer
mv Library/Developer/CommandLineTools/SDKs\
	Contents/Developer/Platforms/MacOSX.platform/Developer
cp -r Library/Developer/CommandLineTools/usr\
	Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX*.*.sdk
