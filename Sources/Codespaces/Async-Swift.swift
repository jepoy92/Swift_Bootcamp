import Foundation

// Define an async function
func calculateFullName(
    firstName: String,
    lastName: String
) async -> String{
    try? await Task.sleep(nanoseconds: 1_000_000_000)
    return "\(firstName) \(lastName)"
}

// Call it inside a top-level Task
Task {
    let result1 = await calculateFullName(
        firstName: "Foo",
        lastName: "Bar"
    )
    async let result2 = await calculateFullName(
        firstName: "Foo",
        lastName: "Bar"
    ) 
    print("\(result1)")
    await print("\(result2)")
    exit(0)
}

enum Clothe {
    case socks, shirt, trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(nanoseconds: 1_000_000_000)
    return Clothe.socks
}

func buyShirt() async throws -> Clothe {
    try await Task.sleep(nanoseconds: 1_000_000_000)
    return Clothe.shirt
}

func buyTrousers() async throws -> Clothe {
    try await Task.sleep(nanoseconds: 1_000_000_000)
    return Clothe.trousers
}

struct Ensemble {
    let clothes: [Clothe]
    let totalPrice: Double
    
    var debugDescription: String {
        "Clothes = \(clothes), price = \(totalPrice)"
    }
}

func buyWholeEnsemble() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirt = buyShirt()
    async let trousers = buyTrousers()
    let ensemble = Ensemble(
        clothes: await [
            try socks, 
            try shirt, 
            try trousers
    ], 
        totalPrice: 200
    )
    return ensemble
}

Task {
    if let ensemble = try? await 
        buyWholeEnsemble() {
            ensemble
    } else {
        print("Failed to buy the ensemble")
    }
}

func getFullName(
    delay: Duration,
    calculator: () async -> String
) async -> String {
    try? await Task.sleep(nanoseconds: delay.nanoseconds)
    return await calculator()
}

func fullName() async -> String { "Foo Bar" }

Task {
    await getFullName(
        delay: .seconds(1),
    ) {
        await let name = fullName()
        return await name
    }
}
RunLoop.main.run() // Keeps the script alive