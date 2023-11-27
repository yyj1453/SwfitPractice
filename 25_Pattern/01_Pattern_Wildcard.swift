/*
    ※ 스위프트의 패턴
        1. 값을 해제(추출)하거나 무시하는 패턴
            ex) 와일드카드 패턴, 식별자 패턴, 값 바인딩 패턴, 튜플 패턴
        2. 패턴 매칭을 위한 패턴
            ex) 열거형 케이스 패턴, 옵셔널 패턴, 표현 패턴, 타입캐스팅 패턴
*/

let string: String = "ABC"

switch string {
    // 따로 조건 없이 무조건 "ABC" 출력
    case _:
        print(string)
}

let optionalString: String? = "ABC"

switch optionalString {
    // optionalString의 값이 Optional("ABC")일 때만 실행
    case "ABC"? :
        print(optionalString)
    // Optional("ABC")이 아닐 때 실행
    case _?:
        print("Has value, but, not ABC")
    // optionalString의 값이 없을 때 실행
    case nil:
        print("nil")
}

let yagom = ("yagom", 99, "Male")

switch yagom {
    // yagom 튜플의 첫번째 값이 "yagom"이라면 실행
    case ("yagom", _, _):
        print("Hello yagom!!!")
    // 첫 번째 case문에 어긋나면서 튜플에 어떤 값들이 오건 실행
    case (_, _, _):
        print("Who cares~")
}

// 반복문의 전달인자를 따로 정하지 않음
for _ in 0..<2 {
    print("Hello")
}