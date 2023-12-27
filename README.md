# DiffMatchPatch

Swift package for [diff-match-patch](https://github.com/google/diff-match-patch) library from Google.

## Description

The originating code has not seen updates in years and the Objective-C code must be built with ARC disabled. I created this Swift package to abstract this configuration change outside of my main Xcode project.

## Changes

It contains a small change to `- (NSMutableArray *)diff_bisectOfOldString:(NSString *)_text1 andNewString:(NSString *)_text2 deadline:(NSTimeInterval)deadline;` that allocates the CFIndex buffer in heap instead of stack. This seems to fix crashes with EXC_BAD_ACCESS when diffing large (over 500kB) strings.

## License

The code carries the same Apache licence as the original code from Google.
