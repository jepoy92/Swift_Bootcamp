import Foundation

// Classes is a storage space in memory (like struct or enums) that are structures but they're not value types, they're references.
// It also allows for mutability without having to prefix things.

// It needs constructor/initializer
class Person {
    var name: String
    var age: Int

    init(
        name: String,
        age: Int
    ) {
        self.name = name
        self.age = age
    }

    func increaseAge() {
        self.age += 1
    }
}

// Even though the variable was created with the immutable let, it is able to mutate due to the nature of classes
// This is because, even though the let constant cannot be changed, the class inside of the constant can
let foo = Person(
    name: "Foo",
    age:20
)

print(foo.age)
foo.increaseAge()
print(foo.age)

// i.e.
// foo = Person(
//     name: "Foo",
//     age: 20
// )
// Does not work because you're trying to change an immutable variable. Changing what's in the class however,
// is still allowed.

print(foo.age)
let bar = foo
bar.increaseAge()
print(foo.age)
print(bar.age)

// The results show that both foo and bar point to the exact same memory space (Person)
if foo === bar {
    print("Foo and Bar point to the same memory")
} else {
    print("They don't point to the same memory")
}

class Vehicle {
    func goVroom() {
        print("Vroom vroom")
    }
}

class Car: Vehicle {

}

let car = Car()
// Shows that you can create inheritance between classes as Car does not have func goVroom
// yet, when calling car via a variable, you can still access func goVroom from Vehicle
car.goVroom()

// Classes can have private setters (var), that can only be set privately. I.e. variables 
// that can only be changed within the class itself.

class Person2 {
    // How you make a private setter for a variable.
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increaseAge() {
        self.age += 1
    }
}
let baz = Person2(age: 20)
print(baz.age)
// The following will not work because age can only be changed within the class
// print(baz.age += 1) 
baz.increaseAge()
print(baz.age)

// Designated initializers ensure they construct an instance of a class by ensuring all the properties of the class are set,
// also ensuring the internal validity of that class holds up
// Convenience initializers add logic to the init of that class, they then designate the init
// of that class to the designated init
// Convenient inits take in the instructions, designated inits carry out those instructions

class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    // By default, inits are designated inits
    init() {
        self.model = "X"
        self.year = 2023
    }

    init(
        model: String,
        year: Int
    ) {
        self.model = model
        self.year = year
    }
    // This 
    convenience init(
        model: String
    ) {
        self.init(
            model: model,
            year: 2023
        )
    }
}

class TeslaModelY: Tesla {
    // Since this is a sub class, you need to tell an init that affects the same init in the
    // super class to override the init as below.
    override init() {
        // super.init(
        //     model: "Y", 
        //     year: 2023
        //     )
        super.init(
            model: "Y", 
            year: 2023
        )
    }
}
// Desingated inits in subclasses can only call designated inits in their super class
// Inside any class, a designated init cannot delegate to any other inits
// Conveninet inits can call either in our out of their super classes

let modelY = TeslaModelY()
print(modelY.model)
print(modelY.year)
print(modelY.manufacturer)

let fooBar = Person2(age: 20)

print(fooBar.age)

func doSomething(with person: Person2) {
    person.increaseAge()
}

doSomething(with: fooBar)
print(fooBar.age)

// De-inits are invoked automatically by swift when your classes instance is being
// cleaned from memory.

class MyClass {
    init() {
        print("Initialized")
    }
    func doSomething() {
        // empty
    }
    deinit{
        print("Deinitialized")
    }
}

let myClosure = {
    let myClass = MyClass()
    myClass.doSomething()
}

myClosure()