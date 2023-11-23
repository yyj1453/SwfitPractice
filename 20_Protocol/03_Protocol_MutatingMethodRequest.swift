protocol Resettable {
    mutating func reset()
}

class Person: Resettable {
    var name: String?
    var age: Int?

    // 프로토콜에서 가변 메소드가 요구 되었어도 클래스의 인스턴스는 참조타입이므로 mutating 키워드가 필요없음
    func reset() {
        self.name = nil
        self.age = nil
    }
}

struct Point: Resettable {
    var x: Int = 0
    var y: Int = 0

    // 구조체의 인스턴스는 값타입이므로 mutating 키워드가 필요함
    mutating func reset() {
        self.x = 0
        self.y = 0
    }
}

enum Direction: Resettable {
    case east, west, south, north, unknown

    // 열거형의 인스턴스는 값타입이므로 mutating 키워드가 필요함
    mutating func reset() {
        self = Direction.unknown
    }
}