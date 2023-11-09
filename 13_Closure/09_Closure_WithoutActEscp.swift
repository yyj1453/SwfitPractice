let numbers: [Int] = [2, 4, 6, 8]                                                   // 정수 타입 배열 numbers 선언

let evenNumberPredicate = { (number: Int) -> Bool in                                // 정수타입의 매개변수 number을 받아서 Bool타입의 반환값을 가지는 클로저 선언
    return number % 2 == 0
}

let oddNumberPredicate = { (number: Int) -> Bool in                                 // 정수타입의 매개변수 number을 받아서 Bool타입의 반환값을 가지는 클로저 선언
    return number % 2 == 1
}

// 매개변수로 (정수타입 배열(array), 정수받아 Bool타입을 반환하는 클로저(predicate))를 받아 Bool타입을 반환하는 클로저 선언
func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do: { escapablePredicate in           // escapablePredicate는 predicate의 별칭
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false)      // array가 비어있으면 true 비어있지 않으면 false 반환
    })
}

let hasEvenNumber = hasElements(in: numbers, match: evenNumberPredicate)            // array로 numbers를 가져오고 predicate로는 evenNumberPredicate를 가져옴
let hasOddNumber = hasElements(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber)
print(hasOddNumber)