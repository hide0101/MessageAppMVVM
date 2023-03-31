///
/// @Generated by Mockolo
///



import Combine
import Foundation


internal class FetchAppVersionMock: FetchAppVersion {
    internal init() { }


    internal private(set) var invokeCallCount = 0
    internal var invokeHandler: (() -> (String))?
    internal func invoke() -> String {
        invokeCallCount += 1
        if let invokeHandler = invokeHandler {
            return invokeHandler()
        }
        return ""
    }
}

