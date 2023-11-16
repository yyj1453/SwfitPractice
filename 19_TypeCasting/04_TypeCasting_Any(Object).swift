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

print("● AnyObject의 타입 확인 ●")

func checkType(of item: AnyObject) {
    if item is Latte {
        print("item is Latte")
    } else if item is Americano {
        print("item is Americano")
    } else if item is Coffee {
        print("item is Coffee")
    } else {
        print("Unknown Type")
    }
}

checkType(of: coffee)
checkType(of: myCoffee)
checkType(of: yourCoffee)
checkType(of: actingConstant)

print("--------------------------------------")
print("● AnyObject의 타입캐스팅 ●")

func castTypeToAppropriate(item:  AnyObject) {
    if let castedItem: Latte = item as? Latte {
        print(castedItem.description)
    } else if let castedItem: Americano = item as? Americano {
        print(castedItem.description)
    } else if let castedItem: Coffee = item as? Coffee {
        print(castedItem.description)
    } else {
        print("Unknown Type")
    }
}

castTypeToAppropriate(item: coffee)
castTypeToAppropriate(item: myCoffee)
castTypeToAppropriate(item: yourCoffee)
castTypeToAppropriate(item: actingConstant)