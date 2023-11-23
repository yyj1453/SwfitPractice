// 확장으로 통해 서브스크립트도 추가 가능
extension String {
    subscript(appedValue: String) -> String {
        return self + appedValue
    }

    subscript(repeatCount: UInt) -> String {
        var str: String = ""

        for _ in 0..<repeatCount {
            str += self
        }
        return str
    }
}

print("abc"["def"])
print("abc"[3])