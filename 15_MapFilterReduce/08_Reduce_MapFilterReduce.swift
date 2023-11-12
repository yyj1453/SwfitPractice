let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7]

// 짝수를 걸러내어 각 값에 3을 곱해준 후 모든 값을 더합니다.
var result: Int = numbers.filter{ $0.isMultiple(of: 2) }.map{ $0 * 3 }.reduce(0){ $0 + $1 }
// filter 메소드의 $0에는 numbers의 모든 원소가 담김
// map 메소드의 $0에는 numbers의 짝수 원소들만 담김
// result 메소드의 $0에는 초기값 0이 담기지만 $1에 6이 담기고 $0 + $1의 값이 $0에 누적됨
print(result)

result = 0

// for문 사용시
// number를 통해 numbers의 모든 원소를 순환
for number in numbers {
    // number가 짝수가 아닐때 continue 실행
    guard number.isMultiple(of: 2) else {
        continue
    }
    // number가 짝수일 때 실행
    result += number * 3
}
print(result)