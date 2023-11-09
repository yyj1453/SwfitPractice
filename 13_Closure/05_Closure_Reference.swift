func makeInCrementer(forIncrement amount: Int) -> (() -> Int) {             // 매개변수 amount를 받아 매개변수가 없고 반환타입이 Int인 함수를 반환하는 함수
    var runningTotal = 0                                                    // 작동한 총 횟수를 담을 runningTotal을 담을 변수
    func incrementer() -> Int {                                             // 반환값이 될 반환타입이 Int인 함수
        runningTotal += amount                                              // 작동횟수 누적
        return runningTotal
    }
    return incrementer                                                      // 반환값이 incremeter함수
}

let incrementerByTwo: (() -> Int) = makeInCrementer(forIncrement: 2)
let sameWithIncrementByTwo: (() -> Int) = incrementerByTwo

let first: Int = incrementerByTwo()
let second: Int = sameWithIncrementByTwo()                                  // 값이 같은것이 아닌 참조값이 같으므로 작동을 두번한것으로 계산

print(first)
print(second)