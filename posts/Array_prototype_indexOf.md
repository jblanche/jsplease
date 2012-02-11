feature: Array.prototype.indexOf and lastIndexOf
status: use
standard: true
min_ie: gtie9
ff: old
sf: old
webkit: true
chrome: old
opera: old
tags: polyfill
kind:
polyfillurls: [Array.prototype.indexOf and lastIndexOf polyfill](https://github.com/kriskowal/es5-shim/blob/master/es5-shim.js)
ready: ready

Array.prototype.indexOf and Array.prototype.lastIndexOf were introduced in javascript 1.6. They are available everywhere except ie<9, but there is a polyfill.

Array.prototype.indexOf returns the first index at which a given element can be found in the array, or -1 if it is not present.

Array.prototype.indexOf returns the last index at which a given element can be found in the array, or -1 if it is not present. The array is searched backwards.


    var array = [2, 5, 9, 2];

    array.indexOf(2);         // 0
    array.indexOf(7);         // -1
    array.lastIndexOf(2);     // 3
    array.lastIndexOf(7);     // -1

