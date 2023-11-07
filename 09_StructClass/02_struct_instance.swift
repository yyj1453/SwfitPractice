struct BasicInformation {
    var name: String
    var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 24)
yagomInfo.age = 100
yagomInfo.name = "youngjin"
print(yagomInfo)