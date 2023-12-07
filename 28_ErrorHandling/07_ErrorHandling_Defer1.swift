func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    defer {
        print("First")
    }

    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        throw SomeError.justSomeError
    }

    defer {
        print("Second")
    }

    defer {
        print("Third")
    }

    return 100
}

try? someThrowingFunction(shouldThrowError: true)
// First
// 오류를 던지는 즉시 함수는 중단됨

try? someThrowingFunction(shouldThrowError: false)
// defer{..}은 선언된 역순으로 실행됨 (리소스 누수 방지)
// Third
// Second
// First