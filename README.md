# linkcheck

[![Build Status](https://travis-ci.org/cytopia/linkcheck.svg?branch=master)](https://travis-ci.org/cytopia/linkcheck)
![Tag](https://img.shields.io/github/tag/cytopia/linkcheck.svg)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`linkcheck` was created in order to ensure that none of your files have broken links.

I use it specifically to check my documentation, notes and recipes every once in a while
for valid URLs.

## Requirements

* bash
* curl


## Examples

#### Scan Markdown and text files
```
# Ensure either 200, 301 or 302 are returned
linkcheck -e 'md,txt' -c '200,301,302' path/to/my/docs
```

#### Be strict on sphinx files
```
# Ensure only 200 is returned
linkcheck -e 'rst' -c '200' path/to/my/docs
```

## Usage

```
Usage: linkcheck [-e -i -t -r -c] [<path>]

Options:

-e        Limit search to those file extensions.
          Defaults to limiting on non-binary files.
          Accepts comma separated string of extensions:
            -e txt
            -e txt,rst
            -e sh,py.c,h

-i        Ignore all URLs matching the specified regex.
          Defaults to: ^http(s)?:\/\/(127\.0\.0\.1)|(localhost)|(.+\.loc).*$
          Accepts a single regex string:
            -i '^http(?):\/\/my-comapny.com.*$'

-t        Specify curl timeout in seconds, after which probing stops for one url.
          Defaults to 10 seconds.
          Accepts a positive integer:
            -t 5
            -t 10

-r        Specify how many time to retry probing a single URL, before giving up.
          Defaults to 3 times.
          Accepts a positive integer:
            -r 5
            -r 10

-c        Specify HTTP status codes that are valid for success.
          Any code not specified in here will produce an error for the given URL.
          Defaults to '200'.
          Accepts comma separated string of http status codes:
            -c '200'
            -c '200,301'
            -c '200,301,302'
```

## License

[MIT License](LICENSE.md)

Copyright (c) 2018 [cytopia](https://github.com/cytopia)
