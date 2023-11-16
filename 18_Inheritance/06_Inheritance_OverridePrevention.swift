// final 키워드와 함께 생성된 코드는 상속, 재정의 불가능
class Person {
    final var name: String = ""

    final func speak() {
        print("가나다라마바사")
    }
}

final class Student: Person {
    // Person 클래스에서 name 변수는 final로 선언됨 (오류!)
    override var name: String {
        set {
            super.name = newValue
        }
        get {
            return "학생"
        }
    }

    // Person 클래스에서 speak() 메소드는 final로 선언됨 (오류!)
    override func speak() {
        print("저는 학생입니다.")
    }
}

// Student 클래스는 final로 선언됨 (오류!)
class UniversityStudent: Student { }