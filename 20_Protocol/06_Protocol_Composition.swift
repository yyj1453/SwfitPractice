protocol Named {
    // 변경이 불가능한 상수와도 같은 변수 name 생성
    var name: String { get }
}

protocol Aged {
    // 변경이 불가능한 상수와도 같은 변수 age 생성
    var age: Int { get }
}

struct Person: Named, Aged {
    // Named 프로토콜에서 요구된 변수 구현
    var name: String
    // Aged 프로토콜에서 요구된 변수 구현
    var age: Int
}

class Car: Named {
    // Named 프로토콜에서 요구된 변수 구현
    var name: String

    // 생성자 구현
    init(name: String) {
        self.name = name
    }
}

// Car클래스 상속, Aged프로토콜 준수 (상속받으면서 Named프로토콜도 준수)
class Truck: Car, Aged {
    var age: Int

    init(name: String, age: Int) {
        // 상위 클래스의 생성자를 호출하기전 자신의 모든 프로퍼티 초기화
        self.age = age
        // 상위 클래스의 생성자 호출
        super.init(name: name)
    }
}

// 전달인자로 Named와 Aged 프로토콜을 준수하는 것을 받음
func celebrateBirthday(to celebrator: Named & Aged) {
    print("Happy birthday \(celebrator.name)!! Now you are \(celebrator.age)")
}

let youngjin: Person = Person(name: "youngjin", age: 24)
celebrateBirthday(to: youngjin)

let myCar: Car = Car(name: "Boong Boong")
// celebrateBirthday(to: myCar)  // myCar은 Aged프로토콜을 준수하지 않음

// var someVariable: Car & Truck & Aged  // 클래스는 한 가지만 조합 가능

// Car을 받으면서 Aged 프로토콜까지 준수하는 인스턴스
var someVariable: Car & Aged

// Truck도 Car를 받고 Aged를 준수하므로 인스턴스 값 부여가능
someVariable = Truck(name: "Truck", age: 5)

// someVariable = myCar

print(youngjin is Named) // true
print(youngjin is Aged) // true

print(myCar is Named) // true
print(myCar is Aged) // false

if let castedInstance: Named = youngjin as? Named {
    print("\(castedInstance) is Named")
} // Person is Named

if let castedInstance: Aged = youngjin as? Aged {
    print("\(castedInstance) is Aged")
} // Person is Aged

if let castedInstance: Named = myCar as? Named {
    print("\(castedInstance) is Named")
} // Car is Named

if let castedInstance: Aged = myCar as? Aged {
    print("\(castedInstance) is Aged")
} // 툴력없음