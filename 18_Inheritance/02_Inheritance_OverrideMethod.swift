class Person {
    var name: String = ""
    var age: Int = 0

    var introduction: String {
        return "이름: \(name), 나이: \(age)"
    }

    func speak() {
        print("가나다라마바사")
    }

    // 클래스 메소드생성 (인스턴스를 생성하지 않고도 사용가능)
    class func introduceClass() -> String {
        return "인류의 소원은 평화입니다."
    }
}

class Student: Person {
    var grade: String = ""

    func study() {
        print("Study hard...")
    }

    // Person의 speak()를 재정의
    override func speak() {
        print("저는 학생입니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""

    // 반환 타입이 없는(Void) 메소드 생성
    class func introduceClass() {
        // Student의 introduceClass()를 실행(Student클래스에 작성되어있지는 않지만 Person의 메소드를 상속받음)
        print(super.introduceClass())
    }

    override class func introduceClass() -> String {
        return "대학생의 소원은 A+ 입니다."
    }

    // Student의 speak()를 재정의
    override func speak() {
        // Student의 speak()를 호출
        super.speak()
        print("대학생이죠.")
    }
}

let youngjin1: Person = Person()
youngjin1.speak()

let youngjin2: Student = Student()
youngjin2.speak()

let youngjin3: UniversityStudent = UniversityStudent()
youngjin3.speak()

print(Person.introduceClass())
print(Student.introduceClass())

// 메소드를 String으로 캐스팅 -> 반환 값이 String인 메소드 호출
print(UniversityStudent.introduceClass() as String)

// 메소드를 Void으로 캐스팅 -> 반환 값이 없는(Void) 메소드 호출
UniversityStudent.introduceClass() as Void