import Foundation

// Closures are special type of functions that are created
// in-line so that you can actually pass them to another function.
// They can hold a function as well, kinda of like function references.

// func add(
//     _ lhs: Int, 
//     _ rhs: Int
//     ) -> Int {
//         lhs + rhs
//     }

// Defines the data type for add
let add:  (Int, Int) -> Int 
    // assigns the data type to the function below
    = { (lhs: Int, rhs: Int) -> Int in 
    lhs + rhs
}
print(add(20, 30))

func customAdd(
    _ lhs: Int,
    _ rhs: Int,
    using function: (Int, Int) -> Int
) -> Int {
    function(lhs, rhs)
}

print(
    customAdd(
        30,
        30
        ) 
    { (lhs: Int, rhs: Int) -> Int in
        lhs + rhs
    }
)

// Provides slower compiling speeds because it requries the compiler to determine on its own the arguments instead of being told what they are
print(
    customAdd(
        40,
        30
        ) 
    { (lhs, rhs) in
        lhs + rhs
    }
)
// An even more compact and harder to compile code
print(
    customAdd(
        50,
        30
        ) 
    { 
        // The dollar sign makes it so you just have to assign the index of the argument (0, 1)
        // when creating a function. This makes it so that you don't have to re-label the arguments (lhs + rhs)
        // but also, it forces the compiler to take more time figuring out what the arguments you're using are.
        $0 + $1
    }
)

let ages = [30, 20, 19, 40]
print(ages)
print(
    ages.sorted(by: {(lhs: Int, rhs: Int) -> Bool in 
    lhs > rhs
    })
)
// more advanced notation
print(
    ages.sorted(by: >),
    ages.sorted(by: <)
)

func customAdd2(
    _ lhs: Int,
    _ rhs: Int,
    using function : (Int, Int) -> Int
) -> Int {
    function(lhs, rhs)
}

print(customAdd2(
        40,
        30
        ) 
    { (lhs, rhs) in
        lhs + rhs
    }
)

func add10To(_ value: Int) -> Int {
    value + 10
}

func add20To(_ value: Int) -> Int {
    value + 20
}

func doAddition(
    on value: Int,
    using function: (Int) -> Int
) -> Int {
    function(value)
}

print(
    doAddition(
        on: 20,
        using: add10To(_:)
        )
)

print(
    doAddition(
        on: 20,
        using: add20To(_:)
        )
)
