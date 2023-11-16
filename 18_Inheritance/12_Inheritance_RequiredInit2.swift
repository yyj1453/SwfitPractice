class Person {
    var name: String

    init() {
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"

    init(major: String) {
        self.major = major
        super.init()
    }

    // 부모 클래스의 일반 생성자를 요구 생성자로 변경 가능 (override 키워드 필요)
    required override init() {
        self.major = "Unknown"
        super.init()
    }

    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

class UniversityStudent: Student {
    var grade: String

    init(grade: String) {
        self.grade = grade
        super.init()
    }

    required init() {
        self.grade = "F"
        super.init()
    }

    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

let youngjin1: UniversityStudent = UniversityStudent()
print(youngjin1.grade)

let youngjin2: UniversityStudent = UniversityStudent(name: "youngjin2")
print(youngjin2.name)