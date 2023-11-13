/*
    ※ Map과 (CompactMap, FlatMap)의 차이 (옵셔널을 다룰때 경우)
        -> Map은 반환값이 옵셔널같은 컨텍스트에 감싸져있지만 
           CompactMap이나 FlatMap같은 경우엔 옵셔널 같은 컨텍스트(포장)을 완전히 풀음
*/
func doubleEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}
print(Optional(3).flatMap(doubleEven))
/*
    1. 옵셔널이라는 컨텍스트에서 3이라는 컨텐츠 추출
    2. flatMap 메소드를 통해 추출 값인 3을 doubleEven 함수에 전달
    3. 함수코드 실행
    4. 반환 값이 없음(nil)
    5. 빈 컨텍스트 반환
*/

print(Optional.none.flatMap(doubleEven))
/*
    1. 옵셔널이라는 컨텍스트 안에 아무것도 없음 (빈 컨텍스트)
    2. 추출 값이 없으므로 flatMap은 아무것도 하지 않음
    3. 결국에 빈 컨텍스트 반환
*/

/*
    ※ CompactMap과 FlatMap의 차이 (옵셔널을 다룰때 경우)
        -> CompactMap은 반환된 값들 중 nil이 아닌 값 들만 골라서 새로운 배열 생성
           FlatMap은 nil값도 포함해서 새로운 배열을 생성 (FlatMap은 주로 중첩 배열을 풀어서 1차원배열을 만드는데 사용)
*/
let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map{ $0 }
let compactMapped: [Int] = optionals.compactMap{ $0 }

print(mapped)
print(compactMapped)