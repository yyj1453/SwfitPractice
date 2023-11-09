// 매개변수로 [String: String]형태의 딕셔너리를 받음
func greet(_ person: [String: String]) {
    // 멤버변수 name을 String타입으로 선언하고 초기값으로 키"name"에 대한 값이 부여됨
    // "name"에 대한 값이 없어서 초기값 부여에 실페한다면 return(함수종료)실행
    guard let name: String = person["name"] else {
        return
    }

    print("Hello \(name)")

    // 멤버변수 lovation을 String타입으로 선언하고 초기값으로 키"location"에 대한 값이 부여됨
    // "location"데 대한 값이 없어서 초기값 부여에 실페한다면 print("...")과 return 실행
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }

    print("I hope the weather is nice in \(location)")
}

// personInfo라는 이름의 딕셔너리[String: String] 생성
var personInfo: [String: String] = [String: String]()

// 키 "name"에 대한 값 "Jenny"부여
personInfo["name"] = "Jenny"

// 키 "name"에 대한 값은 있지만 키 "location"에 대한 값은 없음
greet(personInfo)

// 키 "location"에 대한 값 "Korea"부여
personInfo["location"] = "Korea"

// 키 "name"과 "location"에 대한 값이 다 있음
greet(personInfo)