import Foundation

func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

print(multiplyByTwo())
print(multiplyByTwo(nil))
print(multiplyByTwo(4))
print(multiplyByTwo(8))

let age: Int? = nil
if age != nil {
    print("Age is there! How odd!")
} else {
    print("Age is nil. Correct")
}

if let age {
    print("Age is there. How odd! It's value is \(age)")
} else {
    print("No age is present. As expected")
}

func checkAge() {
    guard age != nil else {
        print("Age is nil as expected")
        return
    } 
    print("Age is not nil here. Strange!")
}

checkAge()

let age2: Int? = 0

func checkAge2() {
    guard let age2 else {
        print("Age is nil. How strange.")
        return
    }
    print("Age2 is not nil as expected. Value = \(age2)")
}

switch age {
    case .none:
        print("Age has no value as expected")
        break
    case let .some(value):
        print("Age has the value of \(value)")
        break
}

if age2 == 0 {
    print("Age2 is 0 as expected, and is not nil")
} else {
    print("Age2 is not 0. How strange!")
}

// Same as the function above, except, the (.some) makes it more descriptive that the value put in age is optional
if age2 == .some(0) {
    print("Age2 is 0 as expected, and is not nil")
} else {
    print("Age2 is not 0. How strange!")
}

struct Person {
    let name: String
    let address: Address?
    struct Address {
        let firstLine: String?
    }
}

let foo: Person = Person(
    name: "Foo",
    address: nil
)

if let fooFirstAddressLine = 
    foo.address?.firstLine {
        print(fooFirstAddressLine)
    } else {
        print("Foo doesn't have an address with first line. as expected")
    }

if let fooAddress = foo.address,
    let firstLine = fooAddress.firstLine{
        print(fooAddress)
        print(firstLine)
    }

let bar: Person? = Person(
    name: "Bar",
    address: Person.Address(
        firstLine: nil
    )
)

if bar?.name == "Bar",
   bar?.address?.firstLine == nil {
    print("Bar's name is Bar and has no first line of address")
} else {
    print("Seems like something isn't working right")
}

let baz: Person? = Person(
    name: "Baz",
    address: Person.Address(
        firstLine: "Baz first line"
    )
)

switch baz?.address?.firstLine {
    case let .some(firstLine) where 
    firstLine.starts(with: "Baz"):
    print("Baz first address line = \(firstLine)")
    case let .some(firstLine):
    print("Baz first address line that didn't match the previous case")
    print(firstLine)
    case .none:
    print("Baz first address line is nil??? Weird")

}

func getFullName(
    firstName: String,
    lastName: String?
) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    } else {
        return nil
    }
}

getFullName(
    firstName: "Foo",
    lastName: nil
)

getFullName(
    firstName: "Foo",
    lastName: "Bar"
)

func getFullName2(
    firstName: String,
    lastName: String?
) -> String? {
    guard let lastName else {
        return nil
    } 
    return "\(firstName) \(lastName)"
}
