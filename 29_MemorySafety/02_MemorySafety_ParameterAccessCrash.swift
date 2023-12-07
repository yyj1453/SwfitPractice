var step: Int = 1
var copyOfStep: Int = step

func increment(_ number: inout Int) {
    // number변수가 step을 장기적 참조 하고 있는 와중에 step을 한번더 참조하므로 접근 오류 발생
    number += step // 오류 발생!
    number += copyOfStep
}

increment(&step)

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore: Int = 42
var playerTwoScore: Int = 30
balance(&playerOneScore, &playerTwoScore)
// 첫번째 매개변수인 playerOneScore을 참조하면서 동시에 같은 변수를 또 참조하므로 접근 오류 발생
balance(&playerOneScore, &playerOneScore) // 오류 발생!