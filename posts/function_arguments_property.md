feature: function "arguments" property
status: use
standard: false
min_ie: gtie7
ff: old
sf: old
webkit: true
chrome: old
opera: old
tags:
kind:
polyfillurls:
ready: ready

The arguments object is a local variable available within all functions containing an array-like object corresponding to the arguments passed to a function.

For example, if a function is passed three arguments, you can refer to the argument as follows:

      arguments[0]
      arguments[1]
      arguments[2]

You can use it as a "real" Array with :

    var args = Array.prototype.slice.call(arguments);

The function "arguments" property is currently supported by all major javascript implementations.
