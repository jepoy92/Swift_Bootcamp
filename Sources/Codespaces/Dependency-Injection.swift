import Foundation
// A dependency (class for example) that depends on another thing (ex. variable)
// An injection is inserting (ex. variable) into soemthing else (ex. class)

class ViewController {
    
    var name: String?

    // Constructor injection - most common, sets the name value with an initializer in the class
    // init(with name: String) {
    //     self.name = name
    // }

    // Setter injection - sets the name value within the class
    // public func setName(with name: String) {
    //     self.name = name
    // }
}

// Constructor injection
// let vc = ViewController(with: "Frank")

// Setter injection
// let vc = ViewController()
// vc.setName(with: "Frank")

// Property injection - least common, sets the name value purely by the property outside of the class
let vc = ViewController()
vc.name = "Frank"

print(vc.name)
