feature: Array.prototype iteration methods
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
polyfillurls: [Array.prototype iteration methods polyfill](https://github.com/kriskowal/es5-shim/blob/master/es5-shim.js)
ready: ready

All those methods have been introduced in Javascript 1.6 or Javascript 1.8 (reduce and reduceRight) and available in most browsers and for those who don't, there are polyfills.

`Array.filter` creates a new array with all elements that pass the test implemented by the provided function.

`Array.map` creates a new array with the results of calling a provided function on every element in this array.

`Array.some` tests whether some element in the array passes the test implemented by the provided function.

`Array.reduce` apply a function against an accumulator and each value of the array (from left-to-right) as to reduce it to a single value.

`Array.reduceRight` apply a function simultaneously against two values of the array (from right-to-left) as to reduce it to a single value.

    function isBigEnough(element) { return (element >= 10); };
    function sum(a, b) { return a + b; };
    function flatten(a, b) { return a.concat(b); }

    // Filter
    [12, 5, 8, 130, 44].filter(isBigEnough); // [12, 130, 44]

    // Every
    [12, 5, 8, 130, 44].every(isBigEnough); //  false
    [12, 130, 44].every(isBigEnough);       // true

    // Map
    [1, 4, 9].map(Math.sqrt);               // [1, 2, 3]

    // Some
    [2, 5, 8, 1, 4].some(isBigEnough);      // false
    [12, 5, 8, 1, 4].some(isBigEnough);     // true

    // Reduce
    [0, 1, 2, 3].reduce(sum);               //  6

    // ReduceRight
    [[0, 1], [2, 3], [4, 5]].reduceRight(flatten, []); // [4, 5, 2, 3, 0, 1]



