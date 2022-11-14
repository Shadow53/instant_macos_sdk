#!/bin/sh

cd "$(dirname "$0")"/sdk

echo "# Extracting the SDK"

mkdir root
cd root

# L.egacy?
#pbzx CLTools_macOSLMOS_SDK.pkg | cpio -i
# N.ew?
pbzx CLTools_macOSNMOS_SDK.pkg | cpio -i -H odc
# Tools
pbzx CLTools_Executables.pkg | cpio -i -H odc
# SDK
pbzx CLTools_macOS_SDK.pkg | cpio -i -H odc

mkdir -p Contents/Developer/Platforms/MacOSX.platform/Developer
mv Library/Developer/CommandLineTools/SDKs\
	Contents/Developer/Platforms/MacOSX.platform/Developer
cp -r Library/Developer/CommandLineTools/usr\
	Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX*.*.sdk
