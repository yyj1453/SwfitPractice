class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    convenience init(name: String) {
        // 편의 생성자는 기본적으로 자신의 지정 생성자 호출
        self.init(name: name, age: 0)
    }
}

class Student: Person {
    var major: String

    // 부모 클래스 지정 생성자와 전달인자가 같다면 같은 생성자로 인식 -> override 키워드 필요
    override init(name: String, age: Int) {
        // 자식 클래스의 지정 생성자는 기본적으로 자신의 모든 프로퍼티를 초기화
        self.major = "Swift"
        // 자식 클래스의 지정 생성자는 기본적으로 부모 클래스의 지정 생성자를 호출해야함
        super.init(name: name, age: age)
    }

    convenience init(name: String) {
        // 편의 생성자는 기본적으로 자신의 지정 생성자 호출
        self.init(name: name, age: 7)
    }
}