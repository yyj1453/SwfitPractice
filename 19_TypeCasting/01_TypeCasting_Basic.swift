// C언어와 스위프트의 타입 변환 비교
/*
    // C 언어
    double value = 3.3
    int convertedValue = (int)value
    convertedValue = 5.5
    printf(convertedValue)                  // 5

    // 스위프트
    var value: Double = 3.3
    var convertedValue: Int = Int(value)
    convertedValue = 5.5
    print(convertedValue)                   // 오류!
*/

var stringValue: String = "123"
var integerValue: Int? = Int(stringValue)

print(integerValue)

stringValue = "A123"
integerValue = Int(stringValue)

print(integerValue)