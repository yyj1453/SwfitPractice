// 제네릭 타입에 클래스 또는 프로토콜로 타입의 제한을 줄 수 있음
func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ b: inout T) {
    // 함수 구현
}

struct Stack<Element: Hashable> {
    // 구조체 구현
}

// 숫자를 계산 하는 연산 같은 경우엔 반드시 BinaryInteger같은 제약을 줘야함
func substractTwoValue<T: BinaryInteger>(_ a: T, _ b: T) -> T {
    return a - b
}

// 딕셔너리의 키는 반드시 Hashable로 타입제약을 줘야함
func makeDictionaryWithTwoValue<Key: Hashable, Value>(key: Key, value: Value) -> Dictionary<Key, Value> {
    let dictionary: Dictionary<Key, Value> = [key:value]
    return dictionary
}