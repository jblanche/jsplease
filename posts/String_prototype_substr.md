feature: String.prototype.substr
status: use
standard: false
min_ie: gtie7
ff: old
sf: old
webkit: true
chrome: old
opera: old
tags: polyfill
kind:
polyfillurls: [String.prototype.substr Polyfill](https://github.com/jblanche/polyfills/blob/master/String.prototype.substr.js)
ready: ready

Returns the characters in a string beginning at the specified location through the specified number of characters.
The method is available on every browser but if you're planning to use negative indexes, please use a polyfill for IE.

    // assumes a print function is defined
    var str = "abcdefghij";
    str.substr(1,2);    // 'bc'
    str.substr(-3,2);   // 'hi'
    str.substr(-3);     // 'hij'
    str.substr(1);      // 'bcdefghij'
    str.substr(-20,2);  // 'ab'
    str.substr(20,2);   // ''
