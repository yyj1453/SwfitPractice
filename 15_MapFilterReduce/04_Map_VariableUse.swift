// 딕셔너리 사용
let alphabetDictionary: [String: String] = ["a": "A", "b": "B"]
var keys: [String] = alphabetDictionary.map{ (tuple: (String, String)) -> String in
    return tuple.0
}

// 클로저 사용(축약)
keys = alphabetDictionary.map{ $0.0 }

let values: [String] = alphabetDictionary.map{ $0.1 }
print(keys)
print(values)

// 세트 사용
var numberSet: Set<Int> = [1, 2, 3, 4, 5]
let resultSet = numberSet.map{ $0 * 2 }
print(resultSet)

// 옵셔널 경우 + 클로저 축약 사용
let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map{ $0 * 2 }
print(resultInt)

// CountableClosedRange 사용 + 클로저 축약 사용
let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{ $0 * 2 }
print(resultRange)