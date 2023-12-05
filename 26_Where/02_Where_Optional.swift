let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]

// for case .. in 으로 배열 순회 가능
for case let number? in arrayOfOptionalInts where number > 2 {
    print("Found a \(number)")
}