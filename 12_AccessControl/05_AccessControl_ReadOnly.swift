public struct SomeType {
    private var count: Int = 0

    public var publicStoredProperty: Int = 0

    public private(set) var publicGetOnlyStoredProperty: Int = 0

    internal var internalComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }

    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }

    public subscript() -> Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }

    public internal(set) subscript(some: Int) -> Int {
        get{
            return count
        }
        set {
            count += 1
        }
    }
}

var someInstance: SomeType = SomeType()

print(someInstance.publicStoredProperty)
someInstance.publicStoredProperty = 100

print(someInstance.publicGetOnlyStoredProperty)

print(someInstance.internalComputedProperty)
someInstance.internalComputedProperty = 100

print(someInstance.internalGetOnlyComputedProperty)

print(someInstance[])
someInstance[] = 100

print(someInstance[0])
someInstance[0] = 100