///
/// @Generated by Mockolo
///



import Foundation


internal class AppInfoRepositoryMock: AppInfoRepository {
    internal init() { }
    internal init(appVersion: String = "") {
        self.appVersion = appVersion
    }


    internal private(set) var appVersionSetCallCount = 0
    internal var appVersion: String = "" { didSet { appVersionSetCallCount += 1 } }
}
