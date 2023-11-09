var customersInLine1: [String] = ["youngjin1", "youngjin2", "youngjin3", "youngjin4"]
print(customersInLine1.count)

// 클로저를 선언(생성)할 때는 실행되지 않음
let customerProvider1: () -> String = {
    // 배열이름.removeFirst()의 값은 배열의 첫번째 요소
    return customersInLine1.removeFirst()
}
print(customersInLine1.count)

print("Now serving \(customerProvider1())!")         // 클로저이름 뒤에 () 키워드를 사용해야 실행이 됨
print(customersInLine1.count)

print("-------------------------------------")

var customersInLine2: [String] = ["youngjin1", "youngjin2", "youngjin3", "youngjin4"]

// 매개변수로 (매개변수가 없고 반환타입이 String인 클로저)customerProvider2를 받고 반환타입이 Void(반환값이 없음)인 클로저 생성
func serveCustomer2(_ customerProvider2: () -> String) {
    // 출력문을 통해 클로저 customerProvider2를 실행하고 반환값 출력
    print("Now serving \(customerProvider2())")
}

// 매개변수로 함수(클로저)가 있고 이름과 return키워드는 암시적으로 표현
serveCustomer2( { customersInLine2.removeFirst() } )
// func 함수이름() -> String {
//      return customersInLine2.removeFirst()
//}