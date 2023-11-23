// Int 구조체 확장
extension Int {
    // 반환값이 있는 곱하기
    func multiply(by n: Int) -> Int {
        return self * n
    }
    
    // 반환값이 없는 곱하기
    mutating func multiplySelf(by n: Int) {
        self = self.multiply(by: n)
    }

    // 값이 정수인지 판별하는 매소드
    static func isIntTypeInstance(_ instance: Any) -> Bool {
        return instance is Int
    }
}

// 반환값이 있기 때문에 바로 출력가능
print(3.multiply(by: 2))
print(4.multiply(by: 5))

var number: Int = 3

// 반환값이 없기 때문에 변수 뒤에 붙여서 사용후 변수값을 출력
number.multiplySelf(by: 2)
print(number)

number.multiplySelf(by: 3)
print(number)

// 정수인지 판단
print(Int.isIntTypeInstance(number))
print(Int.isIntTypeInstance(3))
print(Int.isIntTypeInstance(3.0))
print(Int.isIntTypeInstance("3"))

// ++ 형태의 연산자 선언
prefix operator ++

// 좌표를 나타낼 구조체 생성
struct Position {
    var x: Int
    var y: Int
}

extension Position {
    // 스위프트 기본 제공 연산자인 + 를 오버로딩
    static func + (left: Position, right: Position) -> Position {
        return Position(x: left.x + right.x, y: left.y + right.y)
    }

    // 스위프트 기본 제공 연산자인 - 를 오버로딩
    static prefix func - (vector: Position) -> Position {
        return Position(x: -vector.x, y: -vector.y)
    }

    // 스위프트 기본 제공 연산자인 += 를 오버로딩 (inout 키워드는 전달인자를 값이 아닌 참조형태로 전달)
    static func += (left: inout Position, right: Position) {
        left = left + right
    }
}

extension Position {
    // 스위프트 기본 제공 연산자인 == 를 오버로딩
    static func == (left: Position, right: Position) -> Bool {
        return (left.x == right.x) && (left.y == left.y)
    }

    // 스위프트 기본 제공 연산자인 != 를 오버로딩
    static func != (left: Position, right: Position) -> Bool {
        return !(left == right)
    }
}

extension Position {
    // 임시연산자로 선언 해놓은 ++ 정의
    static prefix func ++ (position: inout Position) -> Position {
        position.x += 1
        position.y += 1
        return position
    }
}

var myPosition: Position = Position(x: 10, y: 10)
var yourPosition: Position = Position(x: -5, y: -5)

print(myPosition + yourPosition)
print(-myPosition)

myPosition += yourPosition
print(myPosition)

print(myPosition == yourPosition)
print(myPosition != yourPosition)

print(++myPosition)