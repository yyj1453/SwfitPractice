// 스위프트의 기본 타입인 String 확장
extension String {
    // extension을 통해 생성자 추가 가능
    init(intTypeNumber: Int) {
        self = "\(intTypeNumber)"
    }
    
    init(doubleTypeNumber: Double) {
        self = "\(doubleTypeNumber)"
    }
}

let stringFromInt: String = String(intTypeNumber: 100)
let stringFromDouble: String = String(doubleTypeNumber: 100.0)
print(stringFromInt)
print(stringFromDouble)

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

// 확장을 통해 편의 생성자 추가
extension Person {
    convenience init() {
        self.init(name: "Unknown")
    }
}

// 인스턴스 생성하면서 편의 생성자 호출됨
let someOne: Person = Person()
print(someOne.name)

print("----------------------------------")

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Rect {
    var origin: Point = Point()
    var size: Size = Size()
}

// 구조체들을 생성할 때 초기값을 정해놨었으므로 따로 초기값 부여를 안해도 됨
let defaultRect: Rect = Rect()
let memberwiseRect: Rect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
print(defaultRect)
print(memberwiseRect)

// 확장을 통해 생성자 추가
extension Rect {
    init(center: Point, size: Size) {
        let originX: Double = center.x - (size.width / 2)
        let originY: Double = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect: Rect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
print(centerRect)