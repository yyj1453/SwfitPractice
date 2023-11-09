let evenNumbers: [Int] = [0, 2, 4, 6, 8]
let oddNumbers: [Int] = [0, 1, 3, 5, 7]
// 같은 일련의 과정을 map 메소드를 활용해 사용할 예정이면 그냥 하나의 클로저로 만들고 사용
let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubledEvenNumbers = evenNumbers.map(multiplyTwo)
print(doubledEvenNumbers)

let doubledOddNumbers = oddNumbers.map(multiplyTwo)
print(doubledOddNumbers)