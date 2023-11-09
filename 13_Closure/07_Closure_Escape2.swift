typealias VoidVoidClosure = () -> Void          // 매개변수로 아무것도 받지않고 반환도 하지 않는 클로저(함수)의 별칭으로 VoidVoidClosure를 설정
let firstClosure: VoidVoidClosure = {           // firstClosure 라는 상수를 선언하고 VoidVoidClosure 형식의 클로저를 부여
    print("Closure A")
}
let secondClosure: VoidVoidClosure = {          // secondClosure 라는 상수를 선언하고 VoidVoidClosure 형식의 클로저를 부여
    print("Closure B")
}

// 매개변수 first와 second에는 외부에 있는 클로저인 firstClosure와 secondClosure가 와야하기 때문에 @escaping 키워드가 필요함
func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
    return shouldReturnFirstClosure ? first : second
}

let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)
// 상수 returnedClosure를 선언하고 반환값이 없는 VoidVoidClosure 형식의 클로저를 부여
// 클로저의 내용으로 returnOneClosure를 부여
// returnOneClosure의 first와 second 매개변수로 외부의 클로저가 사용됨

returnedClosure()
// returendClosure는 상수로 선언되었지만 클로저가 부여되었고
// 클로저 내용을 실행하기 위해선 뒤에 () 키워드가 붙어야함

var closures: [VoidVoidClosure] = []
// 반환값이 없는 VoidVoidClosure 타입의 클로저들로 이루어진 배열 closures을 선언

// appendClosure가 호출될 때 마다 closures 배열에 탈출 클로저를 추가
func appendClosure(closure: @escaping VoidVoidClosure) {
    closures.append(closure)
    closure()                   // 매개변수로 들어온 외부 클로저를 따로 실행
}

// appendClosure의 매개변수로 외부 클로저가 사용됨
appendClosure(closure: firstClosure)
appendClosure(closure: secondClosure)