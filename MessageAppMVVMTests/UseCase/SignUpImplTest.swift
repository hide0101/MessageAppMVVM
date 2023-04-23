//
//  SignUpImplTest.swift
//  MessageAppMVVMTests
//
//  Created by hide0101 on 2023/04/17.
//

import Foundation
import Combine
@testable import MessageAppMVVM
import XCTest

internal class SignUpImplTest: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    private lazy var exp = expectation(description: "wait for complete api")
    private lazy var authRepoMock: AuthRepositoryMock = {
        ContainerResolver.shared.resolve(AuthRepository.self) as! AuthRepositoryMock
    }()
    private lazy var dbRepoMock: DBRepositoryMock = {
        ContainerResolver.shared.resolve(DBRepository.self) as! DBRepositoryMock
    }()
    private lazy var useCase: SignUp = {
        SignUpImpl()
    }()
    
    override internal func setUp() {
        ContainerResolver.shared.setDependencyMockContainer()
    }
    
    internal func testSuccessful() {
        authRepoMock.createUserWithEmailAndPasswordHandler = { _, _ in
            Just(("uid")).setFailureType(to: AuthError.self).eraseToAnyPublisher()
        }
        dbRepoMock.createUserHandler = { _, _ in
            Just(()).setFailureType(to: DBError.self).eraseToAnyPublisher()
        }
        useCase.execute(name: "", email: "", password: "")
            .sink { [weak self] result in
                XCTAssertEqual(result.status, SignUpStatus.success)
                XCTAssertEqual(self?.authRepoMock.createUserWithEmailAndPasswordCallCount, 1)
                XCTAssertEqual(self?.dbRepoMock.createUserCallCount, 1)
                self?.exp.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [exp], timeout: 1)
    }
    
    internal func testFailureAuthErrorCaseInvalidEmail() {
        authRepoMock.createUserWithEmailAndPasswordHandler = { _, _ in
            Fail<String, AuthError>(error: AuthError.invalidEmail).eraseToAnyPublisher()
        }
        useCase.execute(name: "", email: "", password: "")
            .sink { [weak self] result in
                XCTAssertEqual(result.status, SignUpStatus.invalidEmail)
                XCTAssertEqual(self?.dbRepoMock.createUserCallCount, 0)
                self?.exp.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [exp], timeout: 1)
    }
    
    internal func testFailureAuthErrorCaseEmailAlreadyInUse() {
        authRepoMock.createUserWithEmailAndPasswordHandler = { _, _ in
            Fail<String, AuthError>(error: AuthError.emailAlreadyInUse).eraseToAnyPublisher()
        }
        useCase.execute(name: "", email: "", password: "")
            .sink { [weak self] result in
                XCTAssertEqual(result.status, SignUpStatus.emailAlReadyInUse)
                XCTAssertEqual(self?.dbRepoMock.createUserCallCount, 0)
                self?.exp.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [exp], timeout: 1)
    }
    
    internal func testFailureAuthErrorCaseWeakPasssword() {
        authRepoMock.createUserWithEmailAndPasswordHandler = { _, _ in
            Fail<String, AuthError>(error: AuthError.weakPasssword).eraseToAnyPublisher()
        }
        useCase.execute(name: "", email: "", password: "")
            .sink { [weak self] result in
                XCTAssertEqual(result.status, SignUpStatus.weakPassword)
                XCTAssertEqual(self?.dbRepoMock.createUserCallCount, 0)
                self?.exp.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [exp], timeout: 1)
    }
    
    internal func testFailureAuthErrorCaseUnexpected() {
        authRepoMock.createUserWithEmailAndPasswordHandler = { _, _ in
            Fail<String, AuthError>(error: AuthError.unexpected).eraseToAnyPublisher()
        }
        useCase.execute(name: "", email: "", password: "")
            .sink { [weak self] result in
                XCTAssertEqual(result.status, SignUpStatus.unexpectedError)
                XCTAssertEqual(self?.dbRepoMock.createUserCallCount, 0)
                self?.exp.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [exp], timeout: 1)
    }
    
    
    internal func testFailureDBErrorCaseUnexpected() {
        authRepoMock.createUserWithEmailAndPasswordHandler = { _, _ in
            Just(("uid")).setFailureType(to: AuthError.self).eraseToAnyPublisher()
        }
        dbRepoMock.createUserHandler = { _, _ in
            Fail<Void, DBError>(error: DBError.unexpected).eraseToAnyPublisher()
        }
        useCase.execute(name: "", email: "", password: "")
            .sink { [weak self] result in
                XCTAssertEqual(result.status, SignUpStatus.unexpectedError)
                XCTAssertEqual(self?.authRepoMock.createUserWithEmailAndPasswordCallCount, 1)
                XCTAssertEqual(self?.dbRepoMock.createUserCallCount, 1)
                self?.exp.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [exp], timeout: 1)
    }
}
