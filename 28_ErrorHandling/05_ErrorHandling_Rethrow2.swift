func someThrowingFunction() throws {
    enum SomeError: Error {
        case justSomeError
    }
    throw SomeError.justSomeError
}

func someFunction(callback: () throws -> Void) rethrows {
    enum AnotherError: Error {
        case justAnotherError
    }

    do {
        try callback()
    } catch {
        throw AnotherError.justAnotherError
    }
    /*
    do {
        try someThrowingFunction()
    } catch {
        throw AnotherError.justAnotherError
    }
    */
}

do {
    // callback에 오류를 던지는 함수인 someThrowingFunction을 부여
    // callback이 justSomeError를 던짐
    // someFunction의 catch문에서 던져진 justSomeError를 받아 다시 justAnotherError를 던짐
    // 결과적으로 try someFunction(callback: someThrowingFunction)은 반환값이 없고 justAnotherError를 던짐
    try someFunction(callback: someThrowingFunction)
} catch {
    // 최종적으로 던져진 justAnotherError를 받은 후 받아진 오류 종류를 출력
    print(error)
}