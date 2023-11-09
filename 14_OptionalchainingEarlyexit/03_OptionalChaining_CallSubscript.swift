let optionalArray: [Int]? = [1, 2, 3]
print(optionalArray?[1])

// 서브스크립트로 딕셔너리 사용
var optionalDictionary: [String: [Int]]? = [String: [Int]]()
optionalDictionary?["numberArray"] = optionalArray
print(optionalDictionary?["numberArray"]?[2])