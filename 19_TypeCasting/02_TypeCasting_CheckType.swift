class Coffee {
    let name: String
    let shot: Int 

    var description: String {
        return "\(shot) shot(s) \(name)"
    }

    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String

    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }

    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool

    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }

    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)

let myCoffee: Americano = Americano(shot: 2, iced: false)
print(myCoffee.description)

let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
print(yourCoffee.description)

// is: 타입 확인 연산자  ex) 인스턴스 is 타입
print("● is 연산자를 통한 타입 확인 ●")
print(coffee is Coffee)
print(coffee is Americano)
print(coffee is Latte)

print(myCoffee is Coffee)
print(yourCoffee is Coffee)

print(myCoffee is Latte)
print(yourCoffee is Latte)

print("--------------------------------------")
print("● type(of:) 함수와 .self를 통한 타입 확인 ●")
print(type(of: coffee) == Coffee.self)
print(type(of: coffee) == Americano.self)
print(type(of: coffee) == Latte.self)

print(type(of: coffee) == Americano.self)
print(type(of: myCoffee) == Americano.self)
print(type(of: yourCoffee) == Americano.self)

print(type(of: coffee) == Latte.self)
print(type(of: coffee) == Latte.self)
print(type(of: coffee) == Latte.self)

print("--------------------------------------")
print("● 메타 타입을 통한 타입 확인 ●")
protocol SomeProtocol { }
class SomeClass: SomeProtocol { }

let intType: Int.Type = Int.self
let stringType: String.Type = String.self
let classType: SomeClass.Type = SomeClass.self
let protocolProtocol: SomeProtocol.Protocol = SomeProtocol.self

var someType: Any.Type

someType = intType
print(someType)

someType = stringType
print(someType)

someType = classType
print(someType)

someType = protocolProtocol
print(someType)