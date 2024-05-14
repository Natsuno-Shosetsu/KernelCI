#!/usr/bin/env bash

DATE=$(date +"%Y%m%d-%H%M")
export KBUILD_COMPILER_STRING
KBUILD_COMPILER_STRING="Proton clang 14.0"
BUILD_BY="Build with ❤️ by @Shiinaeru"
export BUILD_BY
DEVICE="Redmi Note 11"
export DEVICE
CODENAME="Spes"
export CODENAME
ID=-1002146262108
export ID
TOKEN=7145658525:AAGnqSF7XxiK8ciydvrzIV2nkCWVbG117Ko
export TOKEN

tgs() {
    MD5=$(md5sum "$1" | cut -d' ' -f1)
    curl -fsSL -X POST -F document=@"$1" https://api.telegram.org/bot"${TOKEN}"/sendDocument \
        -F "chat_id=${ID}" \
        -F "parse_mode=Markdown" \
        -F "caption=$2 | *MD5*: \`$MD5\`"
}

# Push kernel to channel
push() {
    ZIP=$(echo *.zip)
    tgs "${ZIP}" "Build took $((DIFF / 60)) minute(s) and $((DIFF % 60)) second(s). | For *${DEVICE} (${CODENAME})* | ${KBUILD_COMPILER_STRING} | ${BUILD_BY}" 
}

push
