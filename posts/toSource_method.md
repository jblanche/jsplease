feature: "toSource" method
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


Returns a string representing the source code of the object.

Only Mozilla is implemeting this non-standard method for now.

    function Dog(name, breed, color, sex) {
       this.name=name;
       this.breed=breed;
       this.color=color;
       this.sex=sex;
    }

    theDog = new Dog("Gabby", "Lab", "chocolate", "girl");
    theDog.toSource(); // ({name:"Gabby", breed:"Lab", color:"chocolate", sex:"girl"})

