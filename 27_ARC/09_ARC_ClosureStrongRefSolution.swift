class Person {
    let name: String
    let hobby: String?

    // 이 역시 youngjin -> Person -> (() -> String) -> Person 형태로 참조하지만
    // (() -> String)이 Person을 참조할 때 unowned(미소유)형태로 참조하므로 참조횟수가 증가하지 않음
    lazy var introduce: () -> String = { [unowned self] in
        var introduction: String = "My name is \(self.name)."

        guard let hobby = self.hobby else {
            return introduction
        }

        introduction += " "
        introduction += "My hobby is \(hobby)"

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

var youngjin: Person? = Person(name: "youngjin", hobby: "eating") // Person 참조 횟수: 1
print(youngjin?.introduce())
youngjin = nil // youngjin에 nil값을 부여하면서 메모리가 사라짐
// Person 참조 횟수: 0