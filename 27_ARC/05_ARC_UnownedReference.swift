class Person {
    let name: String

    var card: CreditCard? // 강한 참조

    init(name: String) {
        self.name = name
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt

    unowned let owner: Person // 미소유 참조

    init(number: UInt, owner: Person) {
        self.number = number
        self.owner = owner
    }

    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var youngjin: Person? = Person(name: "youngjin") // Person 참조 횟수: 1

if let person: Person = youngjin {
    // CreditCard 참조 횟수: 1
    person.card = CreditCard(number: 1004, owner: person) 
    // owner에서 Person 인스턴스를 참조해도 owner는 미소유 프로퍼티라 참조 횟수가 증가하지 않음
    // Person 참조 횟수: 1
}

youngjin = nil // Person 참조 횟수: 0
// youngjin의 프로퍼티인 card가 CreditCard 인스턴스를 강한 참조하고있으므로 
// youngjin이 nil값으로 메모리가 해제되면 CreditCard의 참조 횟수도 1이 줄어듬
// CreditCard 참조횟수: 0