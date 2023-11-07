private class AClass {
    // public(공개 접근수준)을 부여해도 AClass의 접근수준이 private이므로 someMethod() 또한 private으로 취급
    public func someMethod() {
        // ...
    }
}

// AClass의 접근수준이 private이므로 public 함수의 매개변수나 반환 타입으로 사용 불가능
public func sonFunction(a: AClass) -> AClass {
    return a
}