func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}

func integerToNil(param: Int) -> String? {
    return nil
}

var optionalString: String? = "2"
var result: Int?

result = optionalString.flatMap(stringToInteger).flatMap(integerToNil).flatMap(stringToInteger)
// integerToNil 함수를 통해 nil값이 3번째 flatMap으로 갔으므로 stringToInteger에서 아무런 일이 안일어나고 결국에 nil값을 반환
print(result)