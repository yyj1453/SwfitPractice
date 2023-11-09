typealias VoidVoidClosure = () -> Void

// 외부에 선언되지 않은 클로저를 매개변수로 받기 때문에 @escaping 키워드를 사용하지 않음
func funcitonWithNoescapeClosure(closure: VoidVoidClosure) {        // 반환 타입을 적지 않으면 기본으로 Void가 설정됨
    // 매개변수로 받은 클로저를 실행
    closure()
}

// 외부에 선언된 클로저를 받아올 것이기 때문에 @escaping 키워드가 사용됨
func functionWithEscapingClosure(completiuonHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {        // 매개변수와 반환값이 없는 함수 형태를 반환
    // 입력된 외부 클로저를 그대로 반환
    return completiuonHandler
}

class SomeClass {
    var x = 10

    func runNoescapeClosure() {                             // 반환값이 없는 Void 타입의 함수 runNoescapeClosure를 선언
        funcitonWithNoescapeClosure {
            // 비탈출 클로저에는 self가 암시적으로 명시됨
            x = 200
        }
    }

    func runEscapeClosure() -> VoidVoidClosure {            // 반환값이 () -> Void 형태의 함수를 반환하는 클로저 runEscapeClosure를 선언
        return functionWithEscapingClosure {                // 반환값이 () -> Void 형태였던 functionWithEscapingClosure를 반환
            // 탈출 클로저에는 self를 직접 명시해 줘야함 
            self.x = 100
        }
    }
}

let instance: SomeClass = SomeClass()                                   // SomeClass의 인스턴스 생성
instance.runNoescapeClosure()                                           // 인스턴스의 맴버메소드 실행
print(instance.x)                                                       // 방금 전의 맴서메소드 실행을 변한 맴버변수 출력

let returnedClosure: VoidVoidClosure = instance.runEscapeClosure()
// runEscapeClosure()를 실행하면 반환값이 VoidVoidClosure 형태의 클로저 이므로 반환값을 받는 상수 또한 선언 후 VoidVoidClosure 형태의 클로저를 부여
returnedClosure()                                                       // 방금 선언된 상수 클로저 실행
print(instance.x)                                                       // 방금 실행된 클로저로 인해 바뀐 맴버변수 출력