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

    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }

    func fullAddress() -> String? {
        var restAddress: String? = nil

        if let buildingInfo: Building = self.building {
            restAddress = buildingInfo.name
        } else if let detail = self.detailAddress {
            restAddress = detail
        }

        if let rest: String = restAddress {
            var fullAddress: String = self.province

            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest

            return fullAddress
        } else {
            return nil
        }
    }

    func printAddress() {
        if let address: String = self.fullAddress() {
            print(address)
        }
    }
}

class Person {
    var name: String
    var address: Address?

    init(name: String) {
        self.name = name
    }
}

var youngjin: Person = Person(name: "youngjin")
youngjin.address = Address(province: "경기도", city: "서울특별시", street: "목동서로100")
youngjin.address?.building = Building(name: "목동3단지아파트")
youngjin.address?.building?.room = Room(number: 0)
youngjin.address?.building?.room?.number = 106
print(youngjin.address?.fullAddress()?.isEmpty)
youngjin.address?.printAddress()