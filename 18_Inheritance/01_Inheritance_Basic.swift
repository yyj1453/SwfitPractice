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

/*
    ※ 상속 기본 문법
        -> class 자식클래스: 부모클래스 {
            프로퍼티와 메소드
        }
*/

class Student: Person {
    var grade: String = "F"

    func study() {
        print("Study hard...")
    }
}

class UnversityStudent: Student {
    var major: String = ""
}

let youngjin: Person = Person()
youngjin.name = "youngjin"
youngjin.age = 24
print(youngjin.introduction)
youngjin.speak()

let youngjin2: Student = Student()
youngjin2.name = "youngjin2"
youngjin2.age = 23
youngjin2.grade = "A"
print(youngjin2.introduction)
youngjin2.speak()
youngjin2.study()

let youngjin3: UnversityStudent = UnversityStudent()
youngjin3.major = "ComputerEnjineering"
youngjin3.speak()
youngjin3.study()