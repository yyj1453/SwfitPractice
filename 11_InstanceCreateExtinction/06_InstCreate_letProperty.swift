class Person {
    let name: String
    var age: Int?

    init(name: String) {
        self.name = name
    }
}

let yagom : Person = Person(name: "yagom")
yagom.name = "Eric"