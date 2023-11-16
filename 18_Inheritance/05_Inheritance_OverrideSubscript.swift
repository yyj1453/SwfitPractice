class Person {
    var name: String = ""
    var age: Int = 0

    var introduction: String {
        return "이름: \(name), 나이: \(age)"
    }

    func speak() {
        print("가나다라마바사")
    }
}

class Student: Person {
    var grade: String = "F"

    func study() {
        print("Study hard...")
    }
}

class School {
    var students: [Student] = [Student]()

    subscript(number: Int) -> Student {
        print("School subscript")
        return students[number]
    }
}

// 서브스크립트 역시 오버라이드 가능
class MiddleSchool: School {
    var middleStudents: [Student] = [Student]()

    override subscript(index: Int) -> Student {
        print("MiddleSchool subscript")
        return middleStudents[index]
    }
}

let university: School = School()
university.students.append(Student())
university[0]

let middle: MiddleSchool = MiddleSchool()
middle.middleStudents.append(Student())
middle[0]