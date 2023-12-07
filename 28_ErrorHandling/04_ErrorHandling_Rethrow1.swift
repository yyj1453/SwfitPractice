func someThrowingFunction() throws {
    enum SomeError: Error {
        case justSomeError
    }
    throw SomeError.justSomeError
}

// 오류를 던지는 함수 callback을 받아 다시 callback을 시도
func someFunction(callback: () throws -> Void) rethrows {
    try callback()
}

do {
    try someFunction(callback: someThrowingFunction)
} catch {
    print(error)
}