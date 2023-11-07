internal class InternalClass {}
private struct PrivateStruct {}

// 내부 요소로 사용되는 InternalClass와 PrivateStruct가 public보다 낮으므로 사용 불가능
public var publicTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())

// 내부 요소로 사용되는 InternalClass와 PrivateStruct가 private보다 높거나 같으므로 사용 가능
private var privateTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())