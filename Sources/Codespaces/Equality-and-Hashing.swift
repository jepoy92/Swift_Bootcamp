import Foundation

// Start of equatable exercise
// Static functions that has two arguments (lhs, rhs) both
// of the exact same type as the current structure or class implementing it

struct Person: Equatable {
    let id: String
    let name: String
}

let foo1 = Person(
    id: "1",
    name: "Foo"
)

let foo2 = Person(
    id: "1",
    name: "Bar"
)

if foo1 == foo2 {
    print("They are equal")
} else {
    print("They are not equal")
}
// Extends struct Person so that it calls a static function that says as long as both vars have equal
// id's then they are equal
// extension Person {
//     static func == (
//         lhs: Self,
//         rhs: Self
//     ) -> Bool {
//         lhs.id == rhs.id
//     }
// }

// This is good enough to create an equatable
enum AnimalType: Equatable {
    case dog(breed: String)
    case cat(breed: String)
}

// let dog1 = AnimalType.dog(breed: "Labradoodle")
// let dog2 = AnimalType.dog(breed: "Labradoodle")

// if dog1 == dog2 {
//     print("They are equal")
// } else {
//     print("They are not equal")
// }

// This is valid to write, however, swift does not need this extension to execute an equatable if you
// make one of your classes an equtable

// extension AnimalType: Equatable {
//     static func == (
//         lhs: Self,
//         rhs: Self
//     ) -> Bool {
//         switch (lhs, rhs) {
//             case let (.dog(lhsBreed), .dog(rhsBreed)),
//                 let (.cat(lhsBreed), .cat(rhsBreed)):
//                 return lhsBreed == rhsBreed
//             default:
//                 return false
//         }
//     }
// }

struct Animal: Equatable {
    let name: String
    let type: AnimalType

    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(
    name: "Whiskers", 
    type: .cat(
        breed: "Street cat"
    )
)

let cat2 = Animal(
    name: "Whoosh", 
    type: .cat(
        breed: "Street cat"
    )
)

if cat1 == cat2 {
    print("They are equal because of their type.")
} else {
    print("They are not equal.")
}

// End of equatable exercise

// Start of Hash exercise

// Hash looks at all properties of struct or class to see if it's hashable
// Hashing is the process of converting a value (like a struct or object) into a unique numeric value called a hash value, 
// which is used to quickly compare, store, or look up that value—especially in sets and dictionaries.
// In Swift, when a type conforms to Hashable, Swift can use it as a dictionary key or set element, 
// because it knows how to uniquely identify and compare it using the hash.

struct House: Hashable {
    let number: Int
    let numberOfBedrooms: Int
}

let house1 = House(
    number: 123,
    numberOfBedrooms: 2
)

print(house1.hashValue)

let house2 = House(
    number: 123,
    numberOfBedrooms: 3
)

print(house2.hashValue)

let houses = Set([house1, house2])
print(houses.count)

struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }

    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.number == rhs.number
    }
}

let house3 = NumberedHouse(
    number: 123,
    numberOfBedrooms: 2
)

let house4 = NumberedHouse(
    number: 123,
    numberOfBedrooms: 3
)

let houses3And4 = Set([house3, house4])
print(houses3And4.count)
print(house3.hashValue)
print(house4.hashValue)
print(house3.number.hashValue)
print(house4.number.hashValue)

// If you make an enum that has no raw values it is both hashable and equatable
enum CarPart {
    case roof
    case tire
    case trunk
}

let uniqueParts: Set<CarPart> = [
    .roof,
    .tire,
    .roof,
    .trunk
]

print(uniqueParts)

enum HouseType: Hashable {
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType
.bigHouse(
    NumberedHouse(
        number: 1,
        numberOfBedrooms: 1
    )
)

let bigHouse2 = HouseType
.bigHouse(
    NumberedHouse(
        number: 1,
        numberOfBedrooms: 1
    )
)

let smallHouse1 = HouseType
.smallHouse(
    NumberedHouse(
        number: 1,
        numberOfBedrooms: 1
    )
)

let allHouses: Set <HouseType> = [
    bigHouse1,
    bigHouse2,
    smallHouse1
]

print(allHouses.count)
print(allHouses.first)

for value in allHouses {
    print(value)
}
