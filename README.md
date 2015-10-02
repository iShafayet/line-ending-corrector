# line-ending-corrector
Line Ending Corrector - An utility that makes sure your files have consistent line endings.

It converts all those pesky `\r\n` (a.k.a `CRLF`) line endings in Microsoft Windows operating systems into the more commonly used and recognized `\n` (a.k.a `CR`). Though it lets you do the opposite as well ( converting `CR` to `CRLF` )

# Features

* Supports recusive mode for all files in a directory
* Can be used from the command line
* Has a gulp module
* Exposes a programmatic API.

# Installation

For usage from the command line

    [sudo] npm install -g line-ending-corrector

For using programmatically

    [sudo] npm install line-ending-corrector --save-dev
    

