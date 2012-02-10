feature: Array.isArray
status: use
standard: true
min_ie: gtie9
ff: new
sf: new
webkit: true
chrome: old
opera: old
tags:
kind:
polyfillurls: [Array.isArray polyfill](https://github.com/jblanche/polyfills/blob/master/Array.isArray.js)
ready: ready

Returns true if an object is an array, false if it's not.

    Array.isArray([]); // true
    Array.isArray({}); // false

Array.isArray is not available in some old browsers, but there's a polyfill for those.
