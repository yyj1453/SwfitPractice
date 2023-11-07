let names1: [String] = ["wizplan", "eric", "yagom", "jenny"]

func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

let reversed1: [String] = names1.sorted(by: backwards)
print(reversed1)

/*   스위프트 표준 라이브러리에서 제공해주는 sorted 메소드 정의
public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
*/

let names2: [String] = ["wizplan", "eric", "yagom", "jenny"]

let reversed2: [String] = names2.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})
print(reversed2)

/* 클로저 기본 형식
{ (매개변수) -> 반환타입 in
    실행 코드
}
*/