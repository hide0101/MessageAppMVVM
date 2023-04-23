///
/// @Generated by Mockolo
///



import Combine
import FirebaseAuth
import Foundation


internal class AppInfoRepositoryMock: AppInfoRepository {
    internal init() { }
    internal init(appVersion: String = "") {
        self.appVersion = appVersion
    }


    internal private(set) var appVersionSetCallCount = 0
    internal var appVersion: String = "" { didSet { appVersionSetCallCount += 1 } }
}

internal class DBRepositoryMock: DBRepository {
    internal init() { }


    internal private(set) var createUserCallCount = 0
    internal var createUserHandler: ((String, String) -> (AnyPublisher<Void, DBError>))?
    internal func createUser(uid: String, name: String) -> AnyPublisher<Void, DBError> {
        createUserCallCount += 1
        if let createUserHandler = createUserHandler {
            return createUserHandler(uid, name)
        }
        fatalError("createUserHandler returns can't have a default value thus its handler must be set")
    }
}

internal class AuthRepositoryMock: AuthRepository {
    internal init() { }


    internal private(set) var createUserWithEmailAndPasswordCallCount = 0
    internal var createUserWithEmailAndPasswordHandler: ((String, String) -> (AnyPublisher<String, AuthError>))?
    internal func createUserWithEmailAndPassword(email: String, password: String) -> AnyPublisher<String, AuthError> {
        createUserWithEmailAndPasswordCallCount += 1
        if let createUserWithEmailAndPasswordHandler = createUserWithEmailAndPasswordHandler {
            return createUserWithEmailAndPasswordHandler(email, password)
        }
        fatalError("createUserWithEmailAndPasswordHandler returns can't have a default value thus its handler must be set")
    }

    internal private(set) var signInWithEmailAndPasswordCallCount = 0
    internal var signInWithEmailAndPasswordHandler: ((String, String) -> (AnyPublisher<AuthDataResult?, Error>))?
    internal func signInWithEmailAndPassword(email: String, password: String) -> AnyPublisher<AuthDataResult?, Error> {
        signInWithEmailAndPasswordCallCount += 1
        if let signInWithEmailAndPasswordHandler = signInWithEmailAndPasswordHandler {
            return signInWithEmailAndPasswordHandler(email, password)
        }
        fatalError("signInWithEmailAndPasswordHandler returns can't have a default value thus its handler must be set")
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

