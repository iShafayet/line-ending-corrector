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
    
# Usage the command line

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

    line-ending-corrector <filename> --eolc CRLF


    
# Programmatic Usage

## To require

CoffeeScript
```CoffeeScript
{ LineEndingCorrector } = require 'line-ending-corrector'
```

JavaScript
```JavaScript
LineEndingCorrector = require('line-ending-corrector').LineEndingCorrector
```

## Methods

### LineEndingCorrector.correctSync(contents, options)
returns `{ wasAltered Boolean, modifiedContents String }`

CoffeeScript
```CoffeeScript
contentsOfSomeFile = arbitaryFunctionToLoadFile()
{ wasAltered, modifiedContents } = LineEndingCorrector.correctSync contentsOfSomeFile
if wasAltered
  arbitaryFunctionToSaveFile modifiedContents
```

JavaScript
```JavaScript
contentsOfSomeFile = arbitaryFunctionToLoadFile();
res = LineEndingCorrector.correctSync(contentsOfSomeFile);
if(res.wasAltered) {
  arbitaryFunctionToSaveFile(res.modifiedContents);
}
```

ES6
```JavaScript
contentsOfSomeFile = arbitaryFunctionToLoadFile();
{ wasAltered, modifiedContents } = LineEndingCorrector.correctSync(contentsOfSomeFile);
if(wasAltered) {
  arbitaryFunctionToSaveFile(modifiedContents);
}
```

### LineEndingCorrector.correctStream(contentStream, options)
returns `{ wasAltered Boolean, modifiedContentStream ReadableStream }`

CoffeeScript
```CoffeeScript
contentStream = arbitaryFunctionToLoadFileAsStream()
{ wasAltered, modifiedContentStream } = LineEndingCorrector.correctStream contentStream
if wasAltered
  arbitaryFunctionToSaveFileFromStream modifiedContents
```


### LineEndingCorrector.correct(content, options, callbackFunction)
`callbackFunction` is called with `(err Error, wasAltered boolean, modifiedContent String)`

CoffeeScript
```CoffeeScript
content = arbitaryFunctionToLoadFile()
LineEndingCorrector.correct content, { eolc: 'LF' }, (err, wasAltered, modifiedContent)=>
  throw err if err
  if wasAltered
    arbitaryFunctionToSaveFileFromStream modifiedContent
```

## Options

`eolc`
Desired End of Line character. can be `CR` (`\r`), `LF`(`\n`) (Default), `CRLF`(`\r\n`)

`encoding`
Any meaningful encoding that nodejs supprots. Default `utf8`. It is advisable to use `utf8` since others are not tested by the devs.

# Gulp

See [gulp-line-ending-corrector](https://github.com/ishafayet/gulp-line-ending-corrector)

# Testing

You need [mocha](https://github.com/mochajs/mocha)

`npm test`






