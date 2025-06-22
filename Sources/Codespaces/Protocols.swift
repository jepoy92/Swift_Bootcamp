import Foundation

// Protocols are special objects/interfaces that create a set of rules that objects
// that conform to a protocol have to follow.

// So, any object that CAN breathe has to breathe
protocol CanBreathe {
    // Characterized with having a function that has no body. You can't do this with anything else
    func breathe()
}

// Structs do allow inheritance from protocols. the func breathe was included so that
// the struct Animal conforms(matches the form of) to the protocol CanBreathe
struct Animal: CanBreathe {
    func breathe() {
        print("Animal breathing...")
    }
}

struct Person: CanBreathe {
    func breathe() {
        print("Person breathing...")
    }
}

let dog = Animal()
dog.breathe()
let foo = Person()
foo.breathe()

// You cannot write the function body in the protocol itself. 
// Think of it as a mold, after making the protocol, you create objects to fill in that mold.
// i.e. protocolCanBreathe is the rule, it's up to Person and Animal to say how they breathe. 
protocol CanJump {
    func jump()
}

// You can add implementation to functions inside protocols by creating extensions as below.
extension CanJump {
    func jump() {
        print("Jumping...")
    }
}

struct Cat: CanJump {
    // You don't HAVE to call func jump here for this to work, BUT you can change the function
    // by calling it and changing the func body as below
    // func jump() {
    //     print("POUNCE!")
    // }
}

let whiskers = Cat()
whiskers.jump()

protocol HasName {
    // let name: String is the same as the lines below. An immutable, unsetable variable.
    var name: String { get }
    // This makes age a variable that can actually be set
    var age: Int { get set }
}

extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old"
    }
    mutating func increaseAge() {
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String
    var age: Int
}

var woof = Dog(
    name: "Woof",
    age: 10
)

print(woof.name)
print(woof.age)
woof.age += 1
print(woof.age)
print(woof.describeMe())
woof.increaseAge()
print(woof.age)

protocol Vehicle {
    var speed: Int {get set}
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(
        by value: Int
        ) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}

// If you're envoking a mutable function, you must do it on a mutable variable
var bike = Bike()
print(bike.speed)
bike.increaseSpeed(by: 10)
print(bike.speed)

struct Worm {

}

// you can use is to check to see if an object conforms to a protocol. like an if statement

func describe(obj: Any) {
    if obj is Vehicle {
        print("Object conforms to the Vehicle protocol")
    } else {
        print("Object DOES NOT conform to the Vehicle protocol")
    }
}

describe(obj: bike)
let worm = Worm()
describe(obj: worm)

// as? can conditionally promote an object to a specific type

func increaseSpeedIfVehicle(
    obj: Any
) {
    if var vehicle = obj as? Vehicle {
    print(vehicle.speed)
    vehicle.increaseSpeed(by: 10)
    print(vehicle.speed)
    } else {
        print("This was not a vehicle")
    }
}

// Copies the object of bike and performs the action in the func
increaseSpeedIfVehicle(obj: bike)
// This makes a copy of the entire object of bike.
print(bike.speed)

