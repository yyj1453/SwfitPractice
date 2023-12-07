protocol SomeProtocol {
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) throws
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows
}

class SomeClass: SomeProtocol {
    func someThrowingFunction(callback: () throws -> Void) throws {}
    func someFunction(callback: () throws -> Void) rethrows {}

    // 던지기와 다시 던지기 또한 프로토콜을 준수 해야함
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) throws {} // 오류 발생!!
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) rethrows {} // 오류 발생!!
}

class SomeChildClass: SomeClass {
    // 부모 클래스의 던지기 함수는 자식 클래스에서 다시 던지기 함수로 재정의 가능
    override func someThrowingFunction(callback: () throws -> Void) rethrows {}
    // 부모 클래스의 다시 던지기 함수는 자식 클래스에서 던지기 함수로 재정의 불가능
    override func someFunction(callback: () throws -> Void) throws {}
}