func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInteger).flatMap(integerToString).flatMap(stringToInteger)
// flatMap 메소드는 컨텍스트(포장)을 계속 뜯어 위상을 끝까지 낮추므로 이어서 나오는 flatMap 수행 가능 (연쇄 연산 가능)
let mappedResult = optionalString.map(stringToInteger)
// map 메소드를 사용하면 값이 옵셔널이라는 컨텍스트가 또다시 옵셔널이라는 컨텍스트에 포장되어 나오므로 이어서 나오는 map메소드를 수행할 수 없음 (연쇄 연산 불가능)
// map 메소드는 기본적으로 컨텍스트(포장)을 뜯지만 한번만 뜯을 수 있음

print(flattenResult) // Optional(2)
print(mappedResult) // Optional(Optional(2))