import Foundation

let myAge = 22
let yourAge = 20

if myAge > yourAge {
    print("I'm older than you")
} else if myAge < yourAge {
    print("I'm younger than you")
} else {
    print("Oh hey, we are the same age")
}

let myMothersAge = myAge + 30
print(myMothersAge);

let doubleMyAge = myAge * 2
print(doubleMyAge);

// 1. unary prefix - works with 1 value
let foo = !true
// The operator (!) works on the single value (true) on the right hand side to inverse it
print(foo);

// 2. unary postfix
let name = Optional("Vandad");
// We put the optional value "Vandad" into unmutable variable name, 
// it can contain no values OR "Vandad"
print("Optional value:", name); // This is an optional string type
print("Type of 'name':", type(of: name)); 
let unaryPostFix = name!
// The "!" operator takes the internal optional value of "Vandad" and inserts it into the variables name
print("Unwrapped with '!' :", unaryPostFix); // this is a string type
print("Type of 'unwrappedName':", type(of: unaryPostFix));

// 3. binary infix - works with two values
let result = 1 + 2
print(result);
// The operator (+) sits in between the two values (1 and 2)
let names = "Foo" + " " + "Bar"
print(names);

// 4. Ternary operator
let age = 30
print(age)
// let message: String
// if age >= 18 {
//     message = "You are an adult"
// } else {
//     message = "You are not yet an adult"
// }
let message = age >= 18 // The message will print something depending on the condition of age being greater than or equal to 18
    ? "You are an adult" // Prints this message if the condition IS(?) met
    : "You are not yet an adult" // Prints this message if the condition IS NOT(:) met
print(message)
