enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}

var friends: [Friend] = [Friend]()
friends.append(Friend(name: "Youngjin1", gender: .male, location: "서울1", age: 24))
friends.append(Friend(name: "Youngjin2", gender: .male, location: "서울2", age: 25))
friends.append(Friend(name: "Youngjin3", gender: .male, location: "서울3", age: 26))
friends.append(Friend(name: "Youngjin4", gender: .female, location: "서울4", age: 27))
friends.append(Friend(name: "Youngjin5", gender: .male, location: "서울5", age: 28))
friends.append(Friend(name: "Youngjin6", gender: .unknown, location: "서울6", age: 29))
friends.append(Friend(name: "Youngjin7", gender: .male, location: "서울7", age: 30))

// map 메소드를 사용해 friends 배열에 있던 친구들에서 나이를 +1 해서 result에 저장
var result: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1) }
// result 배열의 원소들중에 loaction이 "서울1"과 다르고 나이가 25세 이상인 친구들만 골라 result에 재저장
result = result.filter{ $0.location != "서울1" && $0.age >= 25}

// reduce를 통해 출력
let string: String = result.reduce("서울1 외의 지역에 거주하며 24세 이상인 친구"){
    $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세"
}
print(string)