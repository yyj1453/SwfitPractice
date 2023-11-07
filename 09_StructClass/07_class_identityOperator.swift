class Person {
    var name: String = ""
    var age: Int = 0
}

var yagom: Person = Person()
let friend: Person = yagom
let anotherFriend: Person = Person()

print(yagom === friend)
print(yagom === anotherFriend)
print(friend === anotherFriend)