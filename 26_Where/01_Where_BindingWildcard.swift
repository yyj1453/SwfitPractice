let tuples: [(Int, Int)] = [(1, 2), (1, -1), (1, 0), (0, 2)]

for tuple in tuples {
    switch tuple {
    case let (x, y) where x == y: 
        print("x == y")
    case let (x, y) where x == -y:
        print("x == -y")
    case let (x, y) where x > y:
        print("x > y")
    case (1, _): 
        print("x == 1")
    case (_, 2):
        print("y == 2")
    default:
        print("\(tuple.0), \(tuple.1)")
    }
}

var repeatCount: Int = 0

for tuple in tuples {
    switch tuple {
    case let (x, y) where x == y && repeatCount > 2:
        print("x == y")
    case let (x, y) where repeatCount < 2:
        print("\(x), \(y)")
    default:
        print("Nothing")
    }
    repeatCount += 1
}

let firstValue: Int = 50
let secondValue: Int = 30

switch firstValue + secondValue {
case let total where total > 100:
    print("total > 100")
case let total where total < 0:
    print("wrong value")
case let total where total == 0:
    print("zero")
case let total:
    print(total)
}