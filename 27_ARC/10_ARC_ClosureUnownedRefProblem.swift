class Person {
    let name: String
    let hobby: String?

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

var youngjin1: Person? = Person(name: "youngjin1", hobby: "eating") // Persone 참조 횟수: 1
var youngjin2: Person? = Person(name: "youngjin2", hobby: "game") // Persone 참조 횟수: 2

// youngjin2의 introduce에 youngjin1의 introduce를 참조 할당 (값 할당 아님!!)
youngjin2?.introduce = youngjin1?.introduce ?? {" "}

print(youngjin1?.introduce())

// youngjin1의 참조를 제거
youngjin1 = nil

// youngjin2의 introduce는 youngjin1의 introduce응 참조하고있는데 
// youngjin에 nil값이 부여되면서 메모리가 해제되므로
// youngjin2?.introduce()는 이미 해제된 메모리에 접근시도하는 것이 됨 (오류 발생!!)
print(youngjin2?.introduce())