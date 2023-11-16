class Person {
    var name: String
    var age: Int

    // 모든 생성자는 자신의 프로퍼티를 다 초기화해줘야함
    init() {
        self.name = "Unknown"
        self.age = 0
    }

    init?(name: String, age: Int) {
        if name.isEmpty {
            return nil
        }
        self.name = name
        self.age = age
    }

    init?(age: Int) {
        if age < 0 {
            return nil
        }
        self.name = "Unkown"
        self.age = age
    }
}

class Student: Person {
    var major: String

    // 부모 클래스 생성자의 전달인자가 같으면 override 키워드 필요
    override init?(name: String, age: Int) {
        self.major = "Swift"
        // 자식 클래스의 생성자는 부모 클래스의 생성자 호출 필요
        super.init(name: name, age: age)
    }

    override init(age: Int) {
        self.major = "Swift"
        // 자식 클래스의 생성자는 부모 클래스의 생성자 호출 필요
        super.init()
    }
}