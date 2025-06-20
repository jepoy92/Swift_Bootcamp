import Foundation

// Enumerations are categorizations of similar data together by a name
enum Animals {
    // case cat
    // case dog
    // case rabbit
    // Either the below or bottom cases work
    case cat, dog, rabbit, hedgehog
}

let cat = Animals.cat
print(cat)

if cat == Animals.cat {
    print("This is a cat")
} else if cat == Animals.dog {
    print("This is a dog")
} else {
    print("This is something else")
}

func describeAnimal(_ animal: Animals) {
    switch animal {
    case .cat:
        print("This is a cat")
        break
    case .dog:
        print("This is a dog")
        break
    case .rabbit:
        print("This is a rabbit")
        break
    case .hedgehog:
        print("This is a hedgehog")
        break
    }    
}

describeAnimal(Animals.rabbit)

// Enumerations have the ability to have associated values

enum Shortcut {
    // Examples of associated values to different cases (urls and artist and song names)
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(
    path: URL(string: "https://apple.com")!
)

switch wwwApple {
    case .fileOrFolder(
        path: let path, 
        name: let name
        ):
    print(path)
    print(name)
    break
    case .wwwUrl(
        path: let path
        ):
    print(path)
    break
    case .song(
        artist: let artist, 
        songName: let songName
        ):
    print(artist)
    print(songName)
    break
}

// It's preferred to remove the argument callout before the variable
switch wwwApple {
    case .fileOrFolder(
        let path, 
        let name
        ):
    print(path)
    print(name)
    break
    case .wwwUrl(
        let path
        ):
    print(path)
    break
    case .song(
        let artist, 
        let songName
        ):
    print(artist)
    print(songName)
    break
}

// It is even better to remove the let from the variables as well and just add them to the case
switch wwwApple {
    case let .fileOrFolder(
        path, 
        name
        ):
    print(path)
    print(name)
    break
    case let .wwwUrl(
        path
        ):
    print(path)
    break
    case let .song(
        artist, 
        songName
        ):
    print(artist)
    print(songName)
    break
}

if case let .wwwUrl(path) = wwwApple {
    print(path)
}

// if case let .fileOrFolder(path, name: String) = wwwApple {
//     print(path, name)
// }

// if case let .song(artist, songName) = wwwApple {
//     print(artist, songName)
// }

let withoutYou = Shortcut.song(
    artist: "Symphony X",
    songName: "Without You"
)

// You can ignore values in a enum by using the "_" in place of where the argument would go
if case let .song(_, songName) = withoutYou {
    print(songName)
}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)

    var manufacturer: String {
        switch self {
        case let .car(manufacturer, _),
        let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

let car = Vehicle.car(
    manufacturer: "Tesla",
    model: "X"
)

switch car {
    case let .car(manufacturer, _):
        print(manufacturer)
        break
    case let .bike(manufacturer, _):
        print(manufacturer)
        break
}

let bike = Vehicle.bike(
    manufacturer: "HD",
    yearMade: 1987
)

print(car.manufacturer)

switch bike {
    case let .car(manufacturer, _):
        print(manufacturer)
        break
    case let .bike(manufacturer, _):
        print(manufacturer)
        break
}

print(bike.manufacturer)

// Enums with raw values, by setting the data type to String you tell swift that each case has a String raw value
enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}
// And, by calling the FamilyMember enum property with a rawValue property, you can then call its raw value
print(FamilyMember.father.rawValue)
print(FamilyMember.brother.rawValue)

// CaseIterable is a protocol you can call in an enum to grab all cases
enum FavoriteEmoji: String, CaseIterable {
    case blush = "😳"
    case rocket = "🚀"
    case fire = "🔥"
}

// Now this lists all cases in your enum
print(FavoriteEmoji.allCases)
// This then maps the raw values in your enum to then display those values
print(FavoriteEmoji.allCases.map(\.rawValue))

if let blush = FavoriteEmoji(rawValue: "😳") {
    print("Found the blush emoji")
    print(blush)
} else {
    print("This emoji doesn't exist")
}

if let snow = FavoriteEmoji(rawValue: "❄️") {
    print("Snow exists?! Really?")
    print(snow)
} else {
    print("As expected, snow does not exist in our enum")
}

enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
print(myHeight)
myHeight.makeLong()
print(myHeight)

// This is an example of a recursive enum, by adding "indirect" to your enum 
// you can then refer to the enum istelf in operation
indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)

    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
       switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        } 
    }
}

let freeHand = IntOperation.freeHand(.add(2,4))

print(freeHand.calculateResult())