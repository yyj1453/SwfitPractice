let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let mappedNumbers: [Int] = numbers.map{ $0 + 3}

let evenNumbers: [Int] = mappedNumbers.filter{ (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

// numbers 배열에 있는 정수들을 map 메소드를 이용해 3씩 더하고 2로 나눴을 때 나머지가 1이 되는 숫자들만 필터링해서 oddNumbers에 저장
let oddNumbers: [Int] = numbers.map{ $0 + 3 }.filter{ $0 % 2 == 1 }
print(oddNumbers)