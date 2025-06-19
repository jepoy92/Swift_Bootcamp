import Foundation

let myName = "Vandad"
let myAge = 20
let yourName = "Foo"
let yourAge = 19

if myName == "vandad" {
    print("Your name is \(myName)") 
} else {
    print("Oops, I guess it wrong")
}

if myName == "Vandad" {
    print("Now I guessed it correctly")
} else if myName == "Foo" {
    print("Are you foo?")
} else {
    print("Okay, I give up")
}

if myName == "Vandad" && myAge == 30 {
    print("Name is \(myName) and age is 30")
} else if myAge == 20 {
    print("I only guessed the age right")
} else {
    print("I don't know what I'm doing")
}

if myAge == 20 || myName == "Foo" {
    print("Either age is 20, name is Foo or both")
}  else if myName == "Vandad" || myAge == 20 {
    print("It's too late to get in this clause")
} // if statements are serial so if the prior condition is met then the rest of the code will not be processed

if myName == "Vandad"
    && myAge == 22
    && yourName == "Foo"
    || yourAge == 19 {
        print("My name is Vandad and I'm 22 and your name is Foo...OR... you are 19")
    } // Based on this condition, even though myAge != 22, 
    // because the condition after the OR(||) operator is true, the code still prints the message. 

    if (myName == "Vandad"
        && myAge == 22)
        &&
        (yourName == "Foo"
        || yourAge == 19) {
            print("My name is Vandad and I'm 22...AND...your name is Foo or you are 19")
        } // By separating your conditions (myName && myAge) && (yourName || yourAge) in paranthesis
        // you are separating your conditions. So, your || in the second condition no longer applies
        // to the first condition. 
        else {
            print("Hmm, that didn't work so well")
        }