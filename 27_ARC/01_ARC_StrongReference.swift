class Person {
    let name: String

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "youngjin")
// youngjin is being initialized
// 인스턴스 참조 횟수: 1

reference2 = reference1 // 인스턴스 참조 횟수: 2
reference3 = reference1 // 인스턴스 참조 횟수: 3

reference3 = nil // 인스턴스 참조 횟수: 2
reference2 = nil // 인스턴스 참조 횟수: 1
reference1 = nil // 인스턴스 참조 횟수: 0

func foo() {
    // 함수 안에서 인스턴스가 생성되면 함수 범위 안에서만 존재
    let youngjin2: Person = Person(name: "youngjin2") // youngjin2 is being initialized
    // 인스턴스 참조 횟수: 1

    // 함수 종료 시점
    // 인스턴스 참조 횟수: 0
    // youngjin2 is being deinitialized
}
foo()

var youngjin3: Person?

func foo2() {
    let youngjin4: Person = Person(name: "youngjin4") // youngjin4 is being initialized
    // 인스턴스 참조 횟수: 1

    youngjin3 = youngjin4
    // 인스턴스 참조 횟수: 2

    // 함수 종료 시점
    // 기존의 Person(name: "youngjin4")을 참조하던 youngjin4는 사라졌지만 youngjin3가 여전히 참조중
    // 인스턴스 참조 횟수: 1
}
foo2()