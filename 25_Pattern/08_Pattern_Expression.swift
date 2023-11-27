switch 3 {
case 0...5:
    print("0과 5 사이")
default:
    print("0보다 작거나 5보다 큽니다.")
}

var point: (Int, Int) = (1, 2)

switch point {
case (0, 0):
    print("원점")
case (-2...2, -2...2):
    print("(\(point.0), \(point.1))은 원점과 가깝습니다.")
default:
    print("point (\(point.0), \(point.1))")
}

func ~= (pattern: String, value: Int) -> Bool {
    return pattern == "\(value)"
}

point = (0, 0)

switch point {
case ("0", "0"):
    print("원점")
default:
    print("point (\(point.0), \(point.1)")
}

struct Person{
    var name: String
    var age: Int
}

let lingo: Person = Person(name: "Lingo", age: 24)

func ~= (pattern: String, value: Person) -> Bool {
    return pattern == value.name
}
func ~= (pattern: Person, value: Person) -> Bool {
    return pattern.name == value.name && pattern.age == value.age
}

switch lingo {
case Person(name: "Lingo", age: 24):
    print("Same Person!!")
case "Lingo":
    print("Hello Lingo!!")
default:
    print("I don't know who you are")
}