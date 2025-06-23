import Foundation

struct Person {
    let firstName: String?
    let lastName: String?


    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }

    func getFullName() throws -> String {
        switch (firstName, lastName) {
            case(.none, .none):
                throw Errors.bothNamesAreNil
            case(.none, .some):
                throw Errors.firstNameIsNil
            case(.some, .none):
                throw Errors.lastNameIsNil
            case let (.some(firstname), .some(lastName)):
                return "\(firstname) \(lastName)"
        }
    }
}

let foo = Person (
    firstName: nil,
    lastName: nil
)

do {
    let fullName = try foo.getFullName()
    print("Full name is \(fullName)")
} catch {
    print(
        "Got an error = \(error)"
    )
}

do {
    let fullName = try foo.getFullName()
    print(fullName)
} catch is Person.Errors {
    print(
        "Got an error"
    )
}

let bar = Person(
    firstName: nil,
    lastName: nil
)

do {
    let fullName = try bar.getFullName()
    print(fullName)
} catch Person.Errors.firstNameIsNil {
    print(
        "First name is nil"
    )
} catch Person.Errors.lastNameIsNil {
    print(
        "Last name is nil"
    )
} catch Person.Errors.bothNamesAreNil {
    print(
        "Both names are nil"
    )
} catch {
    print(
        "Some other error was thrown"
    ) 
}

struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }

    init(
        manufacturer: String
    ) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
    print(myCar)
} catch Car.Errors.invalidManufacturer {
    print(
        "Invalid manufacturer"
    )
} catch {
    print(
        "Some other error"
    )
}

if let yourCar = try? Car(manufacturer: "Tesla") {
    print(
        "Success, your car = \(yourCar)"
    )
} else {
    print( 
        "Failed to construct and error is not accessible now"
    )
}

// Forcefully unwraps a function that gets throw, which may cause your app or device to crash if an error occurs
let theirCar = try! Car(manufacturer: "Ford")
print(theirCar.manufacturer) 

struct Dog {
    let isInjured: Bool
    let isSleeping: Bool

    enum BarkingErrors: Error {
        case cannotBarkIsSleeping
    }

    enum RunningErrors: Error {
        case cannotRunIsInjured
    }
    
    func bark() throws {
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSleeping
        }
        print("Sleeps...")
    }
    
    func run() throws {
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        print("Runs...")
    }

    func barkAndRun() throws {
        try bark()
        try run()
    }
}

let dog = Dog(
    isInjured: true,
    isSleeping: true
)

do {
    try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping,
        Dog.RunningErrors.cannotRunIsInjured {
            print("Cannot-bark-is-sleeping OR cannot-run-is-injured")
} catch {
            print("Some other error")
}


func fullName(
    firstName: String?,
    lastName: String?,
    calculator: (String?, String?) throws -> String?
) rethrows -> String? {
    try calculator(
        firstName,
        lastName
    )
}

enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (
    firstName: String?,
    lastName: String?
) throws -> String? {
    guard let firstName, 
        !firstName.isEmpty else {
    throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, 
        !lastName.isEmpty else {
    throw NameErrors.lastNameIsInvalid
    }
    return "\(firstName) \(lastName)"
}

do {
    let fooBar = try fullName(
        firstName: "Foo",
        lastName: "Bar",
        calculator: +
    )
    print(fooBar)
} catch NameErrors.firstNameIsInvalid {
    print("First name is invalid")
} catch NameErrors.lastNameIsInvalid {
    print("Last name is invalid")
} catch let err {
    print("Some other error = \(err)")
}

enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(
    from int: Int
) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return  Result.failure(
            IntegerErrors.noPositiveIntegerBefore(
                thisValue: int
            )
        )
    }
    return Result.success(int - 1)
}

func performGet(forValue value: Int) {
    switch getPreviousPositiveInteger(from: value) {
        case let .success(previousValue):
    print("Previous value is \(previousValue)")
        case let .failure(error):
        switch error {
            case let .noPositiveIntegerBefore(thisValue):
                print("No positive integer before \(thisValue)")
        }
    }
}

performGet(forValue:0)
performGet(forValue:2)