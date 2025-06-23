import Foundation
// Collections are arrays and dictionaries or even json objects
let numbers = [1, 2, 3, 4]
print(numbers.first)
print(numbers.last)
print(numbers.count)
print(numbers.map(-))

var mutatingNumbers = [4, 5, 6]
mutatingNumbers.append(7)
print(mutatingNumbers)
mutatingNumbers.insert(3, at: 0)
print(mutatingNumbers)
mutatingNumbers.insert(
    contentsOf: [1, 2],
    at: 0
)
print(mutatingNumbers)

for value in numbers {
    print(value)
}

print("------------------------")

for value in numbers where value % 2 == 0 {
    print(value)
}

let values = numbers.map{ (value: Int) -> Int in 
    value * 2
}

print(values)

let values2 = numbers.filter { (value: Int) -> Bool in
    value >= 3
} 

print(values2)

let values3 = numbers.compactMap { (value:Int) -> String? in
    value % 2 == 0 
    ? String(value
    ): nil
}

print(values3)

let numbers2: [Int?] = [1, 2, nil, 4, 5]
print(numbers2.count)
let notNils = numbers2.filter { (value: Int?) ->
    Bool in
    value != nil
}
print(notNils)

let numbers3 = [1, 2, 1, 2]
print(numbers3.count)

let stuff1 = [
    1, 
    "Hello",
    2,
    "World"
] as [Any]

print(stuff1.count)

let stuff2: [Any] = [
    1, 
    "Hello",
    2,
    "World"
]

print(stuff2.count)

// Sets removes duplicate values and swaps the ordering of the data set
let uniqueNumbers = Set([1, 2, 1, 2, 3])
print(uniqueNumbers.count)
print(uniqueNumbers.map(-))

let myNumbers = Set([1, 2, 3, nil, 5])
let notNilNumbers = Set(myNumbers.compactMap {
    $0
    }
)
print(notNilNumbers)

let stuff3: Set<AnyHashable> = [
    1, 2, 3, "Vandad"
]
print(stuff3.count)

let intsInStuff1 = stuff1.compactMap{(value: Any) -> Int? in 
    value as? Int
}

print(intsInStuff1)

let intsInStuff3 = stuff3.compactMap{(value: AnyHashable) -> Int? in 
    value as? Int
}

print(intsInStuff3)

struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}

let fooID = UUID()
let foo = Person(
    id: fooID,
    name: "Foo",
    age: 20
)

let bar = Person(
    id: fooID,
    name: "Bar",
    age: 30
)

let people: Set<Person> = [foo, bar]
print(people.count)

struct Person2: Hashable {
    let id: UUID
    let name: String
    let age: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.id == rhs.id
    }
}

let bazID = UUID()
let baz = Person2(
    id: bazID,
    name: "Baz",
    age: 20
)
let qux = Person2(
    id: bazID,
    name: "Qux",
    age: 30
)

let people2 = Set([baz, qux])
print(people2.count)

// Dictionaries are also json objects in other program languages

let userInfo = [
    "name": "Foo",
    "age": 20,
    "address": [
        "line1": "Address line 1",
        "postCode": "12345"
    ]
] as [String: Any]

print(userInfo["name"])
print(userInfo["age"])
print(userInfo["address"])
// Never do (as!) in production code since it force downcast a value which may cause programs and devices
// to crash
print((userInfo["address"] as! [String: String])["postCode"])

print(userInfo.keys)
print(userInfo.values)

for (key, value) in userInfo {
    print(key)
    print(value)
}

for (key, value) in userInfo where value is Int {
    print(key)
    print(value)
}

for (key, value) in userInfo where value is
    Int && key.count > 2 {
        print(key)
        print(value)
    }