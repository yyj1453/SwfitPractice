func someFunction() {
    print("1")

    defer {
        print("2")
    }

    do {
        defer {
            print("3")
        }
        print("4")
    }

    defer {
        print("5")
    }

    print("6")
}

someFunction()

// defer{..}문은 해당 블록이 끝날 때 실행이 됨
// 한 블록 안에 defer{..}문이 여러개 있을 경우 역순으로 실행