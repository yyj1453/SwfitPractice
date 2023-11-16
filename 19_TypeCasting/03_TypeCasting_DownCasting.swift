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
let myCoffee: Americano = Americano(shot: 2, iced: false)
let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)
print(actingConstant.description)   // 2 shot(s) vanilla latte

// 실패 (Americano -> Coffee)
if let actingOne: Americano = coffee as? Americano {
    print("This is Americano")
} else {
    print(coffee.description)
}
// 1 shot(s) coffee

// 실패 (Latte -> Coffee)
if let actingOne: Latte = coffee as? Latte {
    print("This is Latte")
} else {
    print(coffee.description)
}
// 1 shot(s) coffee

// 성공 (Coffee -> Coffee)
if let actingOne: Coffee = coffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}
// This is Just Coffee

// 성공 (Americano -> Americano)
if let actingOne: Americano = myCoffee as? Americano {
    print("This is Americano")
} else {
    print(coffee.description)
}
// This is Americano

// 실패 (Latte -> Americano)
if let actingOne: Latte = myCoffee as? Latte {
    print("This is Latte")
} else {
    print(coffee.description)
}
// 1 shot(s) coffee

// 성공 (Coffee -> Americano)
if let actingOne: Coffee = myCoffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}
// This is Just Coffee

// 강제 다운캐스팅 성공 (Coffee -> Latte)
let castedCoffee: Coffee = yourCoffee as! Coffee

// 강제 다운캐스팅 실패 (Americano -> Coffee)
//let castedAmericano: Americano = coffee as! Americano