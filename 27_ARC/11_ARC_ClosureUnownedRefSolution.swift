class Person {
    let name: String
    let hobby: String?

    lazy var introduce: () -> String = { [weak self] in 
        // self(인스턴스)의 값이 nil일때
        guard let self = self else {
            return "원래의 참조 인스턴스가 없어졌습니다."
        }

        var introduction: String = "My name is \(self.name)."

        guard let hobby = self.hobby else {
            return introduction
        }

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

var youngjin1: Person? = Person(name: "youngjin1", hobby: "eating")
var youngjin2: Person? = Person(name: "youngjin2", hobby: "game")

youngjin2?.introduce = youngjin1?.introduce ?? { " " }

print(youngjin1?.introduce())

youngjin1 = nil

print(youngjin2?.introduce())
// guard let self = self else {..} 코드로 오류를 방지하고 문구를 출력할 수 있음