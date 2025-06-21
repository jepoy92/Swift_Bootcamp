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

