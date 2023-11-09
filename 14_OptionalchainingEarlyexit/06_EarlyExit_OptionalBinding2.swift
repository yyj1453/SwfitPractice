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
        /*
        if let rest: String = restAddress {
            var fullAddress: String = self.province

            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest

            return fullAddress
        } else {
            return nil
        }
        */
        // if 조건 {..} else {..} => guard 조건 else {제어문 전환 명령어} ...
        guard let rest: String = restAddress else {
            return nil
        }

        var fullAddress: String = self.province

        fullAddress += " " + self.city
        fullAddress += " " + self.street
        fullAddress += " " + rest

        return fullAddress
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