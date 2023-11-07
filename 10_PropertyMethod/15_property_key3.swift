struct Person {
    let name: String
    let nickname: String?
    let age: Int

    var isAdult: Bool {
        return age > 18
    }
}

let yagom: Person = Person(name: "yagom", nickname: "bear", age: 100)
let hana: Person = Person(name: "hana", nickname: "na", age: 98)
let youngjin: Person = Person(name: "youngjin", nickname: "yyj", age: 14)

let family: [Person] = [yagom, hana, youngjin]
let names: [String] = family.map(\.name)
let nicknames: [String] = family.compactMap(\.nickname)
let adults: [String] = family.filter(\.isAdult).map(\.name)

print(names)
print(nicknames)
print(adults)