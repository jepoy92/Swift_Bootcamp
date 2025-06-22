import Foundation

// Adds functionality to existing types
extension Int {
    func plusTwo() -> Int {
        // self inside extensions refers to the current instance.
        self + 2
    }
}
// i.e. self would be two here (self = 2)
let two = 2
print(two.plusTwo())

// You can add inits to existing types with extensions

struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(
            firstName: components.first ?? fullName, 
            lastName: components.last ?? fullName
        )
    }
}

let person = Person(fullName: "Foo Bar")
print(person.firstName)
print(person.lastName)

// You can extend existing types and add conformance protocols to an existing type

protocol GoesVroom {
    var vroomValue: String {get}
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        "\(self.vroomValue) goes vroom!"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(
    manufacturer: "Tesla",
    model: "X"
)

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}

print(modelX.goVroom())

class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
} 

print(MyDouble().value)

// You can extend a protocol even further by adding more extensions. I can see this as
// adding modularity to code. You can have certain extensions do certain things instead of 
// creating one large extension that does a lot of things that would be really hard to read and
// change over time.
extension GoesVroom {
    func goVroomVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more!"
    }
}

print(modelX.goVroomVroomEvenMore())

// Extensions are now my favorite part of swift. I'm learning that i enjoy 
// making things modular and iterable. This is the part of coding i enjoy the most.
