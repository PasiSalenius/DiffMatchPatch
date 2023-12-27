# DiffMatchPatch

Swift package for [diff-match-patch](https://github.com/google/diff-match-patch) library from Google.

## Description

The originating code has not seen updates in years and the Objective-C code must be built with ARC disabled. I created this Swift package to abstract this configuration change outside of my main Xcode project.

## Usage

Add DiffMatchPatch in Xcode under Project > Package Dependencies.

Then import it as shown below:

```swift
import diff_match_patch
```

Get diffs between two Swift strings:

```swift
let dmp = DiffMatchPatch()

// optionally set a timeout to stop very long processing
dmp.diff_Timeout = TimeInterval(1.0)

let array = dmp.diff_main(ofOldString: string1, andNewString: string2)

// optionally perform a semantic cleanup of diffs
dmp.diff_cleanupSemantic(array)

// cast NSMutableArray to [Diff]
guard let diffs = array as? [Diff] else {
   return
}
```

## Changes

It contains a small change to `- (NSMutableArray *)diff_bisectOfOldString:(NSString *)_text1 andNewString:(NSString *)_text2 deadline:(NSTimeInterval)deadline;` that allocates the CFIndex buffer in heap instead of stack. This seems to fix crashes with EXC_BAD_ACCESS when diffing large (over 500kB) strings.

## License

The code carries the same Apache licence as the original code from Google.
