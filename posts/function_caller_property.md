feature: function "caller" property
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

The caller property is avalable on functions.
If the function f was invoked by the top level code, the value of f.caller is null, otherwise it's the function that called f

    function myFunc() {
       if (myFunc.caller == null) {
          return ("The function was called from the top!");
       } else
          return ("This function's caller was " + myFunc.caller);
    }

Function.caller is currently supported by all major javascript implementations.

