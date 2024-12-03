#!/usr/bin/env bash

#TODO: Change below flutter sdk path
export PATH="$PATH:/home/concettolabs/Android/FlutterSDK/flutter/bin"
printf "#================================================================\n"
printf "\t\t%s\n" '--- Pre-Commit hook ---'
printf "#================================================================\n\n"
# Flutter formatter
printf "+---+-----------------------------------------------------------+\n"
printf "%s\t\t\t\t|" '| X |  Running Flutter Formatter'
printf "\n+---+-----------------------------------------------------------+\n"
dart format .

hasNewFilesFormatted=$(git diff)
if [ -n "$hasNewFilesFormatted" ]; then
    git add .
    printf "%s\t\t\t\t|\n" '| Formatted files added to git stage'
fi
printf "%s\t\t\t\t|\n" '| Finished running Flutter Formatter'
printf "+---------------------------------------------------------------+\n"
# Flutter Analyzer

printf "\n\n+---+-----------------------------------------------------------+\n"
printf "%s\t\t\t\t\t|" '| X |  Running Flutter analyzer'
printf "\n+---+-----------------------------------------------------------+\n"

if ! flutter analyze; then
  printf "%s\t\t\t\t\t|" '| X |  Flutter analyzer error'
  printf "\n+---+-----------------------------------------------------------+\n"
  exit 1
fi
printf "\n\n+---+-----------------------------------------------------------+\n"
printf "%s\t\t\t|" '| X |  Finished running Flutter analyzer'
printf "\n+---+-----------------------------------------------------------+\n"
# Unit tests add test in widget_test.dart for test
#printf "\n\n+---+-----------------------------------------------------------+\n"
#printf "%s\t\t\t\t\t|" '| X |  Running Unit Tests'
#printf "\n+---+-----------------------------------------------------------+\n"
#if ! flutter test; then
#  printf "\n\n+---+-----------------------------------------------------------+\n"
#  printf "%s\t\t\t\t\t\t|" '| X |  Unit tests error'
#  printf "\n+---+-----------------------------------------------------------+\n"
#  exit 1
#fi
#printf "%s\n" 'Finished running Unit Tests'
#printf "\n+---+-----------------------------------------------------------+\n"
