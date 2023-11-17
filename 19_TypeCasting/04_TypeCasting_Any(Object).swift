// 커피 기본 정보를 담는 상위 클래스 Coffee 선언
class Coffee {
    let name: String
    let shot: Int 

    // 기본 정보를 출력할 프로퍼티(속성) 생성
    var description: String {
        return "\(shot) shot(s) \(name)"
    }

    // 생성자 선언
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

// 상위 클래스인 Coffee를 상속해오는 하위 클래스 Latte 생성
class Latte: Coffee {
    var flavor: String

    // 상위 클래스의 description을 Latte 클래스에 알맞게 재정의(override)
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }

    // Latte의 생성자 선언
    init(flavor: String, shot: Int) {
        // 자신의 모든 프로퍼티 초기화
        self.flavor = flavor
        // 하위 클래스는 반드시 상위 클래스의 생성자를 호출
        super.init(shot: shot)
    }
}

// 상위 클래스인 Coffee를 상속해오는 하위 클래스 Americano 생성
class Americano: Coffee {
    let iced: Bool

    // 상위 클래스의 description을 Americano 클래스에 알맞게 재정의(override)
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }

    // Americano의 생성자 선언
    init(shot: Int, iced: Bool) {
        // 자신의 모든 프로퍼티 초기화
        self.iced = iced
        // 하위 클래스는 반드시 상위 클래스의 생성자를 호출
        super.init(shot: shot)
    }
}

// 각 클래스의 인스턴스들 생성
let coffee: Coffee = Coffee(shot: 1)
let myCoffee: Americano = Americano(shot: 2, iced: false)
let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
// Coffee의 인스턴스를 생성하고 Latte로 다운캐스팅하면서 Latte의 생성자 호출
let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)

print("● AnyObject의 타입 확인 ●")

// 전달인자로 모든종류의 클래스 인스턴스를 받아올 수 있음
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

print("--------------------------------------")
print("● Any의 타입캐스팅 ●")

// 전달인자 타입으로 Any가 사용되면 클래스, 구조체, 열거형의 인스턴스 뿐만 아니라 숫자, 문자 등 모든 것들을 받을 수 있음
func checkAnyType(of item: Any) {
    switch item {
        case 0 as Int:
            print("zero as an Int")
        case 0 as Double:
            print("zero as a Double")
        case let someInt as Int:
            print("an integer value of \(someInt)")
        case let someDouble as Double where someDouble > 0:
            print("a positive double value of \(someDouble)")
        case is Double:
            print("some other double value that I don't want to print")
        case let someString as String:
            print("a string value of \"\(someString)\"")
        case let (x, y) as (Double, Double):
            print("an (x, y) point at \(x), \(y)")
        case let latte as Latte:
            print(latte.description)
        case let stringConverter as (String) -> String:
            print(stringConverter("youngjin"))
        default:
            print("something else : \(type(of: item))")
    }
}

checkAnyType(of: 0)
checkAnyType(of: 0.0)
checkAnyType(of: 42)
checkAnyType(of: 3.14159)
checkAnyType(of: -0.25)
checkAnyType(of: "hello")
checkAnyType(of: (3.0, 5.0))
checkAnyType(of: yourCoffee)
checkAnyType(of: coffee)
checkAnyType(of: { (name: String) -> String in "Hello, \(name)" })