protocol Named {
    // 변경이 불가능한 프로퍼티 name 생성
    var name: String { get }
    
    // 생성자 요구
    init(name: String)
}

struct Pet: Named {
    var name: String
    
    // 요구된 생성자 생성
    init(name: String) {
        self.name = name
    }
}

class Person1: Named {
    var name: String

    // 클래스는 상속이 가능하기 때문에 요구된 생성자를 생성하고 required라는 키워드로 생성자를 강요해야함 (하위클래스도 Named라는 프로토콜을 따라야하기 때문)
    required init(name: String) {
        self.name = name
    }
}

final class Person2: Named {
    var name: String

    // 더이상 상속이 안되게 하면 required 키워드가 필요없음
    init(name: String) {
        self.name = name
    }
}

class School {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class MiddleSchool: School, Named {
    var name: String

    // 프로토콜을 준수하지 않는 클래스를 상속받고 프로토콜을 준수해야하므로 required, override 키워드 둘다 필요함
    required override init(name: String) {
        super.init(name: name)
    }
}