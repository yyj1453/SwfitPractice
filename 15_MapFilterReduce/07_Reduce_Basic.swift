let numbers: [Int] = [1, 2, 3]

// 첫 번째 형태인 reduce(_:_:) 메소드의 사용

// 초기값이 0이고 정수 배열의 모든 값을 더합니다.
var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    // result에 초기값 0이 부여되고 numbers의 첫 번째 원소인 1이 next에 부여됨
    // 첫 번째 return result + next가 실행되고 반환된 값은 다시 result에 부여
    // result에는 0 + 1인 1이 부여되고 next에는 numbers의 두 번째 원소인 2가 부여
    // 사용된 배열의 모든 원소가 소진될 때까지 반복
    print("\(result) + \(next)")
    // 0 + 1
    // 1 + 2
    // 3 + 3
    return result + next
})

print(sum) // 최종값인 6출력

// 초기값이 0이고 정수 배열의 모든 값을 뺍니다.
let subtract: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    print("\(result) - \(next)")
    // 0 - 1
    // -1 - 2
    // -3 - 3
    return result - next
})

print(subtract) // -6

// 클로저 축약법을 이용해 간략하게 표현
// result -> $0,    next -> $1
// result의 초기값으로는 3부여
let sumFromThree: Int = numbers.reduce(3) {
    print("\($0) + \($1)")
    // 3 + 1
    // 4 + 2
    // 6 + 3
    return $0 + $1
}

print(sumFromThree) // 최종값인 9출력

var subtractFromThree: Int = numbers.reduce(3) {
    print("\($0) - \($1)")
    // 3 - 1
    // 2 - 2
    // 0 - 3
    return $0 - $1
}

print(subtractFromThree) // -3

// 정수 배열이 아닌 문자 배열에 resuce 사용
let names: [String] = ["Chope", "Jay", "Joker", "Nova"]

// result의 초기값으로 "youngjin's friend: " 부여
let reduceNames: String = names.reduce("youngjin's friend: ") {
    return $0 + ", " + $1
    // "youngjin's friend: " + ", " + "Chope"
    // "youngjin's friend: , Chope" + ", " + "Jay"
    // "youngjin's friend: , Chope, Jay" + ", " + "Joker"
    // "youngjin's friend: , Chope, Jay, Joker" + ", " + "Nova"
}

print(reduceNames) // "youngjin's friend: , Chope, Jay, Joker, Nova"

// 두 번째 형태인 reduce(into:_:) 메소드 사용 (※ 첫 번째 전달인자에 inout키워드를 사용해야 첫 번째 전달인자의 값을 직접 수정가능)

//초기값이 0이고 정수 배열의 모든 값을 더합니다.
// 첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 핞고 내부에서
// 직접 이전 값을 변경한다는 점이 다릅니다.
sum = numbers.reduce(into: 0, { (result: inout Int, next: Int) in 
    // result에 초기값 0을 부여하고 next에 numbers의 첫 번째 값인 1부여
    // result += next을 실행하면서 result에 result + next값이 누적됨
    print("\(result) + \(next)")
    // 0 + 1
    // 1 + 2
    // 3 + 3
    result += next
})

print(sum) // 최종값인 6출력

subtractFromThree = numbers.reduce(into: 3, {
    // $0에 초기값 3을 부여하고 $1에는 numbers의 첫 번째 값인 1부여
    // $0 -= $1을 실행하면서 $0에 $0 - $1값이 누적됨
    print("\($0) - \($1)")
    // 3 - 1
    // 2 - 2
    // 0 - 3
    $0 -= $1
})

print(subtractFromThree) // 최종값인 -3 출력

// 첫 번째 리듀스 형태와 다르기 때문에 다른 컨테이너에 값을 변경하여 넣어줄 수도 있습니다.
// 이렇게 하면 맵이나 필터와 유사한 형태로 사용할 수도 있습니다.
// 홀수는 걸러내고 짝수만 두 배로 변경하면 초기값인 [1, 2, 3] 배열에 직접 연산합니다.
var doubledNumbers: [Int] = numbers.reduce(into: [1, 2]) { (result: inout[Int], next: Int) in 
    // result을 정수 배열로 선언하고 초기값으로 [1, 2]를 부여하고 next에는 numbers의 첫번째 원소인 1부연
    print("result: \(result) next: \(next)")
    print("\(result) append \(next)")
    /* result: [1, 2] next: 1
       [1, 2] append 1*/
    /* result: [1, 2, 2] next: 2
       [1, 2, 2] append 2*/
    /* result: [1, 2, 2, 4] next: 3
       [1, 2, 2, 4] append 3*/
    // result: [1, 2, 2, 4, 6]

    result.append(next * 2)
}

print(doubledNumbers) // [1, 2, 2, 4, 6]

// 필터와 맵을 사용한 모습
// nmubers의 원소가 2의 배수일 때를 필터링
// 필터된 것들을 map 메소드를 이용해 2를 곱함
doubledNumbers = [1, 2] + numbers.filter{ $0.isMultiple(of: 2) }.map{ $0 * 2 }
print(doubledNumbers)

// 이름을 모두 대문자로 변환하여 초기값인 빈 배열에 직접 연산합니다.
var upperCasedNames: [String]
upperCasedNames = names.reduce(into: [], {
    // $0의 초기값에 빈 배열을 넣고 $1에는 names의 초기값인 "Chope" 부여
    // $0에 $1의 문자열을 대문자로 바꿔 추가(append)
    // names의 모든 원소를 소진할 때 까지 반복
    $0.append($1.uppercased())

})

print(upperCasedNames) // ["CHOPE", "JAY", "JOKER", "NOVA"]

// 맵을 사용한 모습
// 맵 메소드를 사용해 각 원소들을 대문자로 전환해 저장
upperCasedNames = names.map{ $0.uppercased() }
print(upperCasedNames) // ["CHOPE", "JAY", "JOKER", "NOVA"]