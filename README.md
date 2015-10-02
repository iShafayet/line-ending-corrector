# line-ending-corrector
Line Ending Corrector - An utility that makes sure your files have consistent line endings.

It converts all those pesky `\r\n` (a.k.a `CRLF`) line endings in Microsoft Windows operating systems into the more commonly used and recognized `\n` (a.k.a `CR`). Though it lets you do the opposite as well ( converting `CR` to `CRLF` )

You should definitely have this in your build process especially if someone in your team works from a non UNIX system.

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
    
# Using from the command line

To operate on a single file inplace (the file will only be altered if any inconsistent line endings are found)

    line-ending-corrector <filename>


To operate on a single file with a diffrent output file name.

    line-ending-corrector <filename> -o <output-filename>

To operate on all the files in the current dirrectory

    line-ending-corrector -d
    
To operate on all the files in a directory

    line-ending-corrector -d <directory>

To operate on all the files in a directory and all subdirectories recursively

    line-ending-corrector -d -r <directory>
    
To use CRLF instead of LF as the desired End Of Line character

    line-ending-corrector <filename> --eol CRLF


    



