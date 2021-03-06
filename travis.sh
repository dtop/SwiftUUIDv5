#! /bin/bash

TEST_CMD="xcodebuild -project UUIDv5.xcodeproj -scheme UUIDv5 -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6S,OS=10.0' test"

which -s xcpretty
XCPRETTY_INSTALLED=$?

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
  eval "${TEST_CMD} | xcpretty"
else
  eval "$TEST_CMD"
fi
