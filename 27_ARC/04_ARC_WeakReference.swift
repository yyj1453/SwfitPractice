class Person {
    let name: String

    init(name: String) {
        self.name = name
    }

    var room: Room?

    deinit {
        print("\(name) is being deinitialized")
    }
}

class Room {
    let number: String

    init(number: String) {
        self.number = number
    }

    weak var host: Person?

    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var youngjin: Person? = Person(name: "youngjin") // Person 참조 횟수: 1
var room: Room? = Room(number: "106") // Room 참조 횟수: 1

room?.host = youngjin // Person 참조 횟수: 1 (약한 참조)
youngjin?.room = room // Room 참조 횟수: 2

youngjin = nil // Person 참조 횟수: 0 , Room 참조 횟수: 1
// room?.host가 참조하던 인스턴스가 해제되면 자동으로 자기 자신도 해제됨 (약한 참조 특징)
print(room?.host)

room = nil // Room 참조 횟수: 0