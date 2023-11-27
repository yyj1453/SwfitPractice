let someValue: Any = 100

switch someValue {
    case is String:
        print("It's String!")
    case let value as Int:
        print(value + 1)
    default:
        print("Int도 String도 아닙니다.")
}