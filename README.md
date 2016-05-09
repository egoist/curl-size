# curl-size [![NPM version](https://img.shields.io/npm/v/curl-size.svg)](https://npmjs.com/package/curl-size) [![NPM downloads](https://img.shields.io/npm/dm/curl-size.svg)](https://npmjs.com/package/curl-size) [![Build Status](https://img.shields.io/circleci/project/egoist/curl-size/master.svg)](https://circleci.com/gh/egoist/curl-size)

> Use curl to get remote file size.

## Install

```bash
$ npm install -g curl-size
```

## Usage

```bash
$ curl-size $URL

# Example, reponse with a Content-Length header
$ curl-size http://downloadap1.teamviewer.com/download/TeamViewer.dmg
26 MB

# No Content-Length header
$ curl-size https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js
Be patient, downloading the file...
875 KB
```

## License

MIT © [EGOIST](https://github.com/egoist)
