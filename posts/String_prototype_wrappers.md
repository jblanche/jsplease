feature: String.prototype wrappers
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

OK, not sure why you would need this, but if you do, it's avalable everywhere.

    "foo".anchor('bar') // "<a name="bar">foo</a>"
    "foo".big()         // "<big>foo</big>"
    "foo".blink()       // "<blink>foo</blink>" Please don't !
    "foo".bold()        // "<b>foo</b>"
    "foo".link('bar')   //"<a href="bar">foo</a>"
