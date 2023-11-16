// 요구 생성자는 자식클래스에서 반드시 명시되어야 함
class Person {
    var name: String

    required init() {
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"

    init(major: String) {
        self.major = major
        super.init()
    }

    required init() {
        self.major = "Unknown"
        super.init()
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
}

let youngjin1: Student = Student()
print(youngjin1.major)

let youngjin2: Student = Student(major: "Swift")
print(youngjin2.major)

let youngjin3: UniversityStudent = UniversityStudent(grade: "A+")
print(youngjin3.grade)