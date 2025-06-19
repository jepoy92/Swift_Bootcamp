import Foundation

func noArgumentsAndNoReturnValue() {
    print("I don't know what I'm doing.")
}
noArgumentsAndNoReturnValue()

func plusTwo(value: Int) {
    let newValue = value + 2
    print(newValue) // This function originally did not have a return value, 
    // this was added simply to show the result in terminal to emulate how it would look in playgrounds
}

plusTwo(value: 30)

 //The -> Is what you use when you want to return a value, in this case the value will be an Int
func newPlusTwo(value: Int) -> Int {
    value + 2 //Now you don't have to enter a return value here. In the previous example, print(newValue) was included so you could return a value in the terminal. In playgrounds, it would just display the value
} 
print(newPlusTwo(value: 30))

func customAdd(
    value1: Int,
    value2: Int
) -> Int {
    value1 + value2
}

let customAdded = customAdd(
    value1: 10, value2: 20
)
print(customAdded)

// Example of a function that DOES NOT have external lables
func customMinus(
    _ lhs: Int, // "_ " before your arguments adds an additional label such that your function no longer needs to re-add the labels to your argument when called
    _ rhs: Int // Allowing you to fully ignore external argument names
) -> Int {
    lhs - rhs
}

let customSubtracted = customMinus(20, 10)
print(customSubtracted)

// External vs internal arguments. When calling a function that uses arguments, if the "_ " is not added to 
// the arguments within the function, you will have to call them externally when calling the function later(i.e func(arg1: value, arg2: value))
// However, by including "_ " to your arguments, they will instead be called INTERNALLY, meaning, when the function
// is called later( func(1, 3) ), the two arguments will implicitly be labeled to the internal arguments within the function.

print(customAdd(
    value1: 20,
    value2: 30
    )
)

@discardableResult // Allows you to call a function without assigning its value to any variables
func myCustomAdd(
    _ lhs: Int,
    _ rhs: Int
 ) -> Int {
        lhs + rhs
}

print(myCustomAdd(20, 30))

func doSomethingComplicated(
    with value: Int
    ) -> Int {
        func mainLogic(value: Int) -> Int { // This function cannot be called outside of doSomethingComplicated
            value + 2
        }
        return mainLogic(value: value + 3) // This is the return value of doSomethingComplicated that uses the INTERNAL
        //function mainLogic.
    }

    print(doSomethingComplicated(with: 30))

    func getFullName(
        firstName: String = "Foo",
        lastName: String = "bar"
    ) -> String {
        "\(firstName) \(lastName)"
    }

    print(getFullName())
    print(getFullName(firstName: "Baz"))
    print(getFullName(lastName: "Foo"))
    print(getFullName(firstName: "Baz", lastName: "Qux"))