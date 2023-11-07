class Person {                                                  // 사용자의 정보를 나타낼 클래스 생성
    let name: String                                            // 사용자의 이름을 나타낼 프로퍼티
    init(name: String) {                                        // 생성자
        self.name = name
    }
}

struct Stuff {                                                  // 물건의 정보를 나타낼 구조체 생성
    var name: String                                            // 물건의 이름을 나타내는 프로퍼티
    var owner: Person                                           // 물건의 주인을 나타내는 프로퍼티
}

// 사용자의 인스턴스 생성
let yagom = Person(name: "yagom")
let youngjin = Person(name: "youngjin")
// 물건의 인스턴스 생성
let macbook = Stuff(name: "MacBook Pro", owner: yagom)
var iMac = Stuff(name: "iMac", owner: yagom)
let iPhone = Stuff(name: "iPhone", owner: youngjin)

let stuffNameKeyPath = \Stuff.name                              // 물건이름의 경로를 저장하는 변수
let ownerkeyPath = \Stuff.owner                                 // 사용자 정보의 경로를 저장하는 변수

let ownerNameKeyPath = ownerkeyPath.appending(path: \.name)     // 사용자 정보중 이름까지의 경로를 저장하는 변수 (ownerkeyPath에 경로 추가)

print(macbook[keyPath: stuffNameKeyPath])                       // print(macbook[keyPath: \Stuff.name])
print(iMac[keyPath: stuffNameKeyPath])                          // print(iMac[keyPath: \Stuff.name])
print(iPhone[keyPath: stuffNameKeyPath])                        // print(iPhone[keyPath: \Stuff.name])

print(macbook[keyPath: ownerNameKeyPath])                       // print(macbook[keyPath: \Stuff.owner.name])
print(iMac[keyPath: ownerNameKeyPath])                          // print(iMac[keyPath: \Stuff.owner.name])
print(iPhone[keyPath: ownerNameKeyPath])                        // print(iPhone[keyPath: \Stuff.owner.name])

iMac[keyPath: stuffNameKeyPath] = "iMac Pro"                    // 키 경로를 통해 프로퍼티 값 변경
iMac[keyPath: ownerkeyPath] = youngjin                          // 키 경로를 통해 프로퍼티 값 변경

print(iMac[keyPath: stuffNameKeyPath])                          // print(iMac[keyPath: \Stuff.name])
print(iMac[keyPath: ownerNameKeyPath])                          // print(iMac[keyPath: \Stuff.owner.name])