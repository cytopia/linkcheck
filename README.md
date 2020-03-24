# linkcheck

[![Build Status](https://travis-ci.org/cytopia/linkcheck.svg?branch=master)](https://travis-ci.org/cytopia/linkcheck)
![Tag](https://img.shields.io/github/tag/cytopia/linkcheck.svg)
[![](https://img.shields.io/docker/pulls/cytopia/linkcheck.svg)](https://hub.docker.com/r/cytopia/linkcheck)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

`linkcheck` was created in order to ensure that none of your files have broken links.

I use it personally to check my documentation, notes and recipes every once in a while
for valid URLs. I am aware that in case of [Sphinx documentation](http://www.sphinx-doc.org/en/master/)
there is already a bundled `linkcheck` tool. However this does not work on `raw::` sections.


## Requirements

* bash
* curl

Or use Docker:

[![Docker hub](http://dockeri.co/image/cytopia/linkcheck?kill_cache=1)](https://hub.docker.com/r/cytopia/linkcheck)

**https://github.com/cytopia/docker-linkcheck**



## Examples

#### Scan all files in current directory for httpd 200
```bash
# Ensure all URLs found in all files in current directory return 200
linkcheck
```

#### Scan Markdown and text files
```bash
# Ensure either 200, 301 or 302 are returned
linkcheck -e 'md,txt' -c '200,301,302' path/to/my/docs
```

#### Be strict on sphinx files
```bash
# Ensure only 200 is returned
linkcheck -e 'rst' -c '200' path/to/my/docs
```

#### Ignore specific URLs
```bash
# Ignore localhost, 127.0.0.1 and *.loc domains
linkcheck -i '^http(s)?:\/\/(localhost)|(127\.0\.0\.1|.)|(.+\.loc).*$' path/to/my/docs
```

#### Ignore invalid SSL certificates
```bash
linkcheck -k -c '200' path/to/my/docs
```

#### Follow redirects and only evaluate final HTTP code
```bash
# Ensure only 200 is returned from the last redirected page
linkcheck -l -c '200' path/to/my/docs
```

#### Show files which have invalid links
```bash
linkcheck -v path/to/my/docs
```


## Usage

```
Usage: linkcheck [-e -i -t -r -c -k -l -v] [<path>]
       linkcheck --version
       linkcheck --help


Options:

-e        Limit search to those file extensions.
          Defaults to limiting on non-binary files.
          Accepts comma separated string of extensions:
            -e txt
            -e txt,rst
            -e sh,py.c,h

-i        Ignore all URLs matching the specified regex.
          Defaults to: ^http(s)?:\/\/(127\.0\.0\.1)|(localhost).*$
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

-k        Ignore invalid SSL certificates for HTTPS connections.
          Defaults to error on invalid SSL certificates.
          This is just a single flag with no other arguments.

-l        Specify whether to follow redirect URLs or not.
          This argument does not accept parameters.
          Defaults to not following redirects.

-v        Be verbose and also show affected files.

--version Show version and exit.
--help    Show this help screen.


Optional arguments:

<path>    Specify what directory to scan files for URLs.
          Defaults to current directory.
```


## License

[MIT License](LICENSE.md)

Copyright (c) 2018 [cytopia](https://github.com/cytopia)
