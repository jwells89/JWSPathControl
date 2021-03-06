//
//  JWSPathControl.m
//
// Copyright (c) 2014 John Wells
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "JWSPathControl.h"

@implementation JWSPathControl

-(void)awakeFromNib
{
    [self setAction:@selector(showClickedSegmentPath)];
}

-(void)showClickedSegmentPath
{
    NSWorkspace  *workspace = [NSWorkspace sharedWorkspace];
    NSURL        *clickedURL = [self.clickedPathComponentCell URL];
    BOOL         urlIsDirectory;
    
    NSUInteger   keyFlags = [NSEvent modifierFlags] & NSDeviceIndependentModifierFlagsMask;
    
    [[NSFileManager defaultManager] fileExistsAtPath:[clickedURL path]
                                         isDirectory:&urlIsDirectory];
    
    if (keyFlags == NSCommandKeyMask ) {
        [workspace activateFileViewerSelectingURLs:@[clickedURL]];
        
        return;
    }
    
    if (urlIsDirectory) {
        [workspace openURL:clickedURL];
        
        return;
    }
    
    [workspace activateFileViewerSelectingURLs:@[clickedURL]];
}

@end
