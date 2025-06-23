import Foundation

let firstName: String? = "Foo"
let lastName: String? = "Bar"
// The following does not work because first and lastname or options strings
let fullName = firstName + lastName

func + (
    lhs: String?,
    rhs: String?
) -> String? {
    switch(lhs, rhs) {
        case(.none, .none):
            return nil
        case let (.some(value), .none),
            let (.none, .some(value)):
            return value
        case let (.some(lhs), .some(rhs)):
            return lhs + rhs
    } 
}

print(fullName ?? "nil")

// prefix/suffix operator assigned to an operator (^) allows you to make a custom operator that does
// whatever you want it to your values.
prefix operator ^
prefix func ^ (value: String) -> String {
    value.uppercased()
}

let lowercaseName = "Foo Bar"
print(lowercaseName)
// Unary prefix that works with one argument that works with the right side
let uppercaseName = ^lowercaseName
print(uppercaseName)

let withStars = lowercaseName*
postfix operator *
postfix func * (value: String) -> String {
    "*** \(value) ***"
}
print(withStars)

struct Person {
    let name: String
}

struct Family {
    let members: [Person]
}

func + (
    lhs: Person,
    rhs: Person
) -> Family {
    Family(
        members: [
            lhs,
            rhs
        ]
    )
}

func + (
    lhs: Family,
    rhs: Person
) -> Family {
    var members = family.members
    members.append(rhs)
    return Family(members: members)
}

func + (
    lhs: Family,
    rhs: [Person]
) -> Family {
    var members = lhs.members
    members.append(contentsOf: rhs)
    return Family(
        members: members
    )
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daughter1 = Person(name: "Daughter 1")
let daughter2 = Person(name: "Daughter 2")

let family = mom + dad
print(family)
print(family.members.count)
let familyWithSon = family + son
print(familyWithSon)
print(familyWithSon.members.count)
let familyWithDaughters = familyWithSon + [
    daughter1,
    daughter2
]
print(familyWithDaughters)
print(familyWithDaughters.members.count)