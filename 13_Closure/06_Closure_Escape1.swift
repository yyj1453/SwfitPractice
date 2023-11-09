var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping() -> Void) {      // @escaping : 탈출클로저 키워드
    completionHandlers.append(completionHandler)
}