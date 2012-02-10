feature: __count__
status: avoid
standard: false
min_ie: false
ff: old
sf: false
webkit: false
chrome: false
opera: false
tags:
kind:
polyfillurls:


The __count__ property, is supposed to exists on all user-defined objects by default and indicates how many properties and methods are on the object.
This property cannot be overwritten nor can it be removed using the delete operator due to its special use.

To be more specific, the __count__ property always reflects the number of object instance members. Every time you add a property or method to the object, the __count__ property is updated; whenever you remove a property or method using delete, the __count__ property is updated. For example:


    var person = {
        name: "Nicholas"
    };

    alert(person.__count__);    //1

    person.hair = "brown";
    alert(person.__count__);    //2

    delete person.name;
    alert(person.__count__);    //1
