class Person {
    let name: String
    let hobby: String?

    // introduce는 전달인자가 없고 반환값이 String인 클로저
    // 이 클로저는 self.name과 self.hobby로 인해 다시 Person을 참조
    // yougjin 인스턴스로 참조된 Person이 내부 클로저 프로퍼티인 introduce로 인에 다시 Person을 참조
    // youngjin -> Person -> (() -> String) -> Person => 순환 문제 발생
    lazy var introduce: () -> String = {
        var introduction: String = "My name is \(self.name)."

        // 옵셔널 프로퍼티인 hobby의 값이 nil값이면 바로 introduction 반환
        guard let hobby = self.hobby else {
            return introduction
        }

        // hobby 값이 있을 경우 hobby를 추가로 출력
        introduction += " "
        introduction += "My hobby is \(hobby)."

        return introduction
    }

    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var youngjin: Person? = Person(name: "youngjin", hobby: "eating")
// Person 참조 횟수: 2 (Person의 프로퍼티인 introduce가 Person자기 자신은 다시 참조함)
print(youngjin?.introduce())

// introduce() 클로저로 인해 메모리가 해제되지 않음
youngjin = nil
// Person 참조 횟수: 1