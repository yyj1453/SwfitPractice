let names: [String] = ["yagom", "youngjin", "goungjun", "heejun"]

let revered1: [String] = names.sorted { (first, second) in          // (first: String, second: String) 이라고 안적어줘도 타입을 추측함
    return first > second
}

let revered2: [String] = names.sorted {
    return $0 > $1                                                  // 전달인자를 명시해주지 않아도 타입추측 후 전달인자들을 $0, $1, $2, ... 순으로 표현
}

let revered3: [String] = names.sorted { $0 > $1 }                   // return을 안적어도 암시적으로 반환함

let revered4: [String] = names.sorted(by: >)                        // 함수는 클로저의 일종으로 > 함수를 클로저로서 사용
// > 연산자 함수 정의
// public func ><T : Comparable>(lhs: T, rhs: T) -> Bool'