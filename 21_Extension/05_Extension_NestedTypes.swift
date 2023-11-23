extension Int {
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
            case 0:
                return .zero
            case let x where x > 0:
                return .positive
            default:
                return .negative
        }
    }
}

// 정수는 Int의 인스턴스이므로 kind 메소드 사용 가능
print(1.kind)
print(0.kind)
print((-1).kind)

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
            case .negative:
                print("- ", terminator: "")  // terminator는 줄바꿈을 없애주는 전달인자, terminator의 값은 추가로 출력할 문구
            case .zero:
                print("0 ", terminator: "")
            case .positive:
                print("+ ", terminator: "")
        }
    }
    print("")
}
printIntegerKinds(numbers:[3, 19, -27, 0, -6, 0, 7])