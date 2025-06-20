import Foundation

// Structures in swift are a way of group data together and giving them a name
// Structures are value types, when you assign an instance of a structure to a variable
// the data inside that structure is copied over so you don't get the same reference using
// two variables.

struct Person {
    let name: String
    let age: Int
}

let foo = Person(
    name: "Foo",
    age: 20
)

print(foo.name)
print(foo.age)

struct CommodoreComputer {
    let name: String
    let manufacturer = "Commodore"
    // init(name: String) {
    //     self.name = name
    //     self.manufacturer = "Commodore"
    // }
}

let c64 = CommodoreComputer(name: "C64")
print(c64.name)
print(c64.manufacturer)

struct Person2 {
    let firstName: String
    let lastName: String
    // let fullName = "\(firstName) \(lastName)"
    // To achieve this, you have to turn fullName into a var.
    // Then, after defining the data type, you create a function that calls out
    // the value you want the var to be as noted below.
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    // init(
    //     firstName: String,
    //     lastName: String
    // ) {
    //     self.firstName = firstName
    //     self.lastName = lastName
    //     self.fullName = "\(firstName) \(lastName)"
    // }
}

let fooBar = Person2(
    firstName: "Foo",
    lastName: "Bar"
)

print(fooBar.firstName)
print(fooBar.lastName)
print(fooBar.fullName)

// Structs do not inherently allow mutation (i.e. each variables are lets)

struct Car {
    var currentSpeed: Int
    // Adding mutating infront of func allows a func to be mutable in an imutable struct
    mutating func drive(speed: Int) {
        print("Driving...")
        currentSpeed = speed
    }
}

let immutableCar = Car(currentSpeed: 10)
// print(immutableCar.drive(speed: 20))

var mutableCar = Car(currentSpeed: 10)
let copy = mutableCar
print(mutableCar.currentSpeed)
mutableCar.drive(speed:30)
print(mutableCar.currentSpeed)
print(copy.currentSpeed)

struct LivingThing {
    init() {
        print("I'm a living thing")
    }
}

// This does not work because structures cannot inheret anything from eachother
// struct Animal: LivingThing {
// 
// }

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        Bike(
            manufacturer: self.manufacturer,
            currentSpeed: currentSpeed   
        )
    }
}

let bike1 = Bike(
    manufacturer: "HD",
    currentSpeed: 20
)

let bike2 = bike1.copy(currentSpeed: 30)
print(bike1.currentSpeed)
print(bike2.currentSpeed)