///
/// @Generated by Mockolo
///



import Combine
import Foundation


internal class AppInfoRepositoryMock: AppInfoRepository {
    internal init() { }
    internal init(appVersion: String = "") {
        self.appVersion = appVersion
    }


    internal private(set) var appVersionSetCallCount = 0
    internal var appVersion: String = "" { didSet { appVersionSetCallCount += 1 } }
}

internal class AuthRepositoryMock: AuthRepository {
    internal init() { }


    internal private(set) var createUserWithEmailAndPasswordCallCount = 0
    internal var createUserWithEmailAndPasswordHandler: ((String, String) -> (AnyPublisher<Void, Error>))?
    internal func createUserWithEmailAndPassword(email: String, password: String) -> AnyPublisher<Void, Error> {
        createUserWithEmailAndPasswordCallCount += 1
        if let createUserWithEmailAndPasswordHandler = createUserWithEmailAndPasswordHandler {
            return createUserWithEmailAndPasswordHandler(email, password)
        }
        fatalError("createUserWithEmailAndPasswordHandler returns can't have a default value thus its handler must be set")
    }

    internal private(set) var signOutCallCount = 0
    internal var signOutHandler: (() -> (AnyPublisher<Void, Error>))?
    internal func signOut() -> AnyPublisher<Void, Error> {
        signOutCallCount += 1
        if let signOutHandler = signOutHandler {
            return signOutHandler()
        }
        fatalError("signOutHandler returns can't have a default value thus its handler must be set")
    }
}

