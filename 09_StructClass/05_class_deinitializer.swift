class Person {
    var height: Float = 0.0
    var weight: Float = 0.0

    deinit {
        print("Person의 인스턴스가 소멸되었습니다.")
    }
}

var yagom: Person? = Person()
yagom = nil