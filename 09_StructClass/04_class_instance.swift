class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()
yagom.height = 123.4
yagom.weight = 123.4

let jenny: Person = Person()
jenny.height = 123.4
jenny.weight = 123.4

print("yagom's height is \(yagom.height)")
print("jenny's weight is \(jenny.weight)")