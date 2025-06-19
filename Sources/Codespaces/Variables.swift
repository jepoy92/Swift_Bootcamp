import Foundation

let myName = "Vandad"
let yourName = "Foo"

var names = [
    myName,
    yourName
]
names.append("Bar")
names.append("Baz")

let foo = "Foo"
var foo2 = foo
foo2 = "Foo 2"
print(foo)
print(foo2)

let moreNames = [
    "Foo",
    "Bar"
]
var copy = moreNames
copy.append("Baz")
print(moreNames)
print(copy)

let oldArray = NSMutableArray(
    array: [
        "Foo",
        "Bar"
    ]
)
oldArray.add("Baz")

var newArray = oldArray
newArray.add("Qux")
print(oldArray)
print(newArray)