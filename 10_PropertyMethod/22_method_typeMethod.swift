struct SystemVolume {
    static var volume: Int = 5

    static func mute() {
        self.volume = 0
    }
}

class Navigation {
    var volume: Int = 5

    func guideWay() {
        SystemVolume.mute()
    }

    func finishGuideWay() {
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10
let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume)

myNavi.finishGuideWay()
print(SystemVolume.volume)