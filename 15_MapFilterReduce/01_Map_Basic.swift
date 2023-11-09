let numbers: [Int] = [0, 1, 2, 3, 4]
var doubleNumbers: [Int] = [Int]()                      // 정수타입 배열 선언
var strings: [String] = [String]()                      // 문자열타입 배열 선언

// for 구문 사용
for number in numbers {
    doubleNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubleNumbers)
print(strings)

// map 메서드 사용
doubleNumbers = numbers.map({ (number: Int) -> Int in   // map 메소드에 클로저 사용
    return number * 2
})
strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubleNumbers)
print(strings)