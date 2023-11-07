func makeInCrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementerByTwo: (() -> Int) = makeInCrementer(forIncrement: 2)

let first: Int = incrementerByTwo()
let second: Int = incrementerByTwo()
let third: Int = incrementerByTwo()

print(first)
print(second)
print(third)