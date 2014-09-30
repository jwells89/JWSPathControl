## JWSPathControl

### Overview
`JWSPathControl` is a simple subclass of NSPathControl that does one of two things when the user clicks on one of its segments:

1. If the segment represents a folder, open that folder in the Finder
2. If the segment represents a file, open its containing folder in the Finder and select that file.

### Usage
In your xib, drag out an NSPathControl, click on the Identity inspector, and set the control's class to `JWSPathControl`. That's it!