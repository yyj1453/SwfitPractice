class Room {
    var number: Int

    init(number: Int) {
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?

    init(name: String) {
        self.name = name
    }
}

struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
}

class Person {
    var name: String
    var address: Address?

    init(name: String) {
        self.name = name
    }
}

print("옵셔널 체이닝 문법")
let youngjin1: Person = Person(name: "youngjin1")

let youngjin1RoomViaOptionalChaining: Int? = youngjin1.address?.building?.room?.number      // nil
// let youngjinRoomViaOptionalChaining: Int = youngjin1.address!.building!.room!.number    // 오류발생!

print("------------------------------------------------")
print("옵셔널 바인딩의 사용")
let youngjin2: Person = Person(name: "youngjin2")
var roomNumber2: Int? = nil

if let youngjin2Address: Address = youngjin2.address {
    if let youngjin2Building: Building = youngjin2Address.building {
        if let youngjin2Room: Room = youngjin2Building.room {
            roomNumber2 = youngjin2Room.number
        }
    }
}

if let number2: Int = roomNumber2 {
    print(number2)
} else {
    print("Can not find room number")
}

print("------------------------------------------------")
print("옵셔널 체이닝의 사용")

let youngjin3: Person = Person(name: "youngjin3")

// 옵셔널 체이닝을 사용하면 굳이 중첩 if문을 사용할 필요 없이 한줄요약 가능
if let roomNumber3: Int = youngjin3.address?.building?.room?.number {
    print(roomNumber3)
} else {
    print("Can not find room number")
}

print("------------------------------------------------")
print("옵셔널 체이닝을 통한 값 할당")

let youngjin4: Person = Person(name: "youngjin4")
youngjin4.address = Address(province: "경기도", city: "서울특별시", street: "목동서로100", building: nil, detailAddress: nil)
youngjin4.address?.building = Building(name: "목동3단지아파트")
youngjin4.address?.building?.room = Room(number: 0)
youngjin4.address?.building?.room?.number = 106
print(youngjin4.address?.building?.room?.number)