// 반환값 전에 throws 키워드를 적으면 오류를 던질 수 있는 함수로 설정됨
func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        throw SomeError.justSomeError
    }
    return 100
}

let x: Optional = try? someThrowingFunction(shouldThrowError: true)
// 오류처리를 하게 되면 반환값이 반환되지 않고 오류만 던지고 끝이 남
print(x)

let y: Optional = try? someThrowingFunction(shouldThrowError: false)
print(y)