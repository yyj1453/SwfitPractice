/*
    ※ 메모리 접근 충돌 발생 요소
        1. 최소한 한 곳에서 쓰기 접근
        2. 같은 메모리 위치에 접근
        3. 접근 타이밍이 겹침
*/

// 순차적, 순간적으로 메모리에 접근한다면 충돌할 일이 없음
func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber: Int = 1
myNumber = oneMore(than: myNumber)
print(myNumber)