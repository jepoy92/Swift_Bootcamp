import Foundation

// Generics are used to avoid writing the same code multiple times

func perform <N: Numeric>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N {
    op(lhs, rhs)
}

print(perform(+, on: 10, and: 20))
print(perform(-, on: 10, and: 20))
print(perform(*, on: 10, and: 20))
print(perform(/, on: 20, and: 10))

// An alternative way of creating generic signatures
func perform2<N>(
    // This allows you to list A, B, C, D generic types
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N where N: Numeric{
    // And here is where you would list those types
    op(lhs, rhs)
}

print(perform2(+, on: 10, and: 20))
print(perform2(-, on: 10, and: 20))
print(perform2(*, on: 10, and: 20))
print(perform2(/, on: 20, and: 10))

protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func jump() {
        print("Jumping...")
    }

    func run() {
        print("Running...")
    }
}

func jumpAndRun<T: CanJump & CanRun>(value: T) {
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(value: person)

let names: Array<String> = ["Foo", "Bar"]

extension Array<String> {
    func longestString() -> String? {
        self.sorted { (lhs: String, rhs: String) -> Bool in
            lhs.count > rhs.count
        }.first 
    }
}

if let longest = ["Foo", "Bar Baz", "Qux"].longestString() {
    print("Longest string is:", longest)
}

protocol View {
    func addSubView(_ view: View)
}

extension View {
    func addSubView(_ view: View) {

    }
}

struct Button: View {

}

struct Table: View {

}

// A view represents a piece of UI (button, text, image, etc). Every SwiftUI conforms to the 
// View protocol, which requires a body property that describes the view's content and layout 
protocol PresentableAsView {
    associatedtype ViewType: View
    func produceView() -> ViewType
    func configure(
        superView: View,
        thisView: ViewType
    )
    func present(
        view: ViewType,
        on superView: View
    )
}

extension PresentableAsView {
   func configure(
        superView: View,
        thisView: ViewType
    ) {
        // Empty by default
    }
    func present(
        view: ViewType,
        on superView: View
    ) {
        superView.addSubView(view)
    }
}

struct MyButton: PresentableAsView {
    func produceView() -> Button {
       Button() 
    }
    func configure(
        superView: View,
        thisView: Button
    ) {
        
    }
}

extension PresentableAsView  {
    func doSomethingWithView () {
        print("This is a View")
    }
}

let button = MyButton()
button.doSomethingWithView()

extension Array where Element == Int {

    func average() -> Double {
        Double(self.reduce(0, +)) / Double(self.count) 
    }
}

print([1, 2, 3, 4].average())