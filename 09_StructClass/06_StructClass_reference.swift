struct BasicInformation {
    let name: String
    var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 99

var friendInfo: BasicInformation = yagomInfo

print("yagom's age is \(yagomInfo.age)")
print("friend's age is \(friendInfo.age)")

friendInfo.age = 999

print("yagom's age is \(yagomInfo.age)")
print("friend's age is \(friendInfo.age)")

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()
var friend: Person = yagom

print("yagom's height is \(yagom.height)")
print("friend's height is \(friend.height)")

friend.height = 173.5
print("yagom's height is \(yagom.height)")
print("friend's height is \(friend.height)")

func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}
func changePersonInfo(_ info: Person) {
    info.height = 174.5
}

changeBasicInfo(yagomInfo)
print("yagom's age is \(yagomInfo.age)")

changePersonInfo(yagom)
print("yagom's height is \(yagom.height)")