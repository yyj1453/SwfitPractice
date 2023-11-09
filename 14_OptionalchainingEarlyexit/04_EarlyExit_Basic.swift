/*  빠른종료(guard) 기본 문법
    guard (Bool 타입 값) else {
        Bool 타입 값에 해당 되지 않는 예외사항 실행문
        제어문 전환 명령어
    }
*/

for i in 0...3 {
    if i == 2 {
        print(i)
    } else {
        continue
    }
}

for i in 0...3 {
    guard i == 2 else {
        continue
    }
    print(i)
}