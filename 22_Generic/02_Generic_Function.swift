func swapTwoInteger(_ a: inout Int, _ b: inout Int) {
    let temporaryInt: Int = a
    a = b
    b = temporaryInt
}

var IntOne: Int = 1
var IntTwo: Int = 2

swapTwoInteger(&IntOne, &IntTwo)
print("\(IntOne), \(IntTwo)")

func swapTwoValues1(_ a: inout Any, _ b: inout Any) {
    let temporaryA: Any = a
    a = b
    b = temporaryA
}

var anyOne: Any = 1
var anyTwo: Any = "Two"

swapTwoValues1(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")

// 전달인자로 정수가 들어오면 T는 Int로 변하고 문자열이 들어오면 String으로 변하는 등 인자값을 인식해 자동으로 바뀜
func swapTwoValues2<T>(_ a: inout T, _ b: inout T) {
    let temporaryA: T = a
    a = b
    b = temporaryA
}

swapTwoValues2(&IntOne, &IntTwo)
swapTwoValues2(&anyOne, &anyTwo)
print("\(IntOne), \(IntTwo)")
print("\(anyOne), \(anyTwo)")