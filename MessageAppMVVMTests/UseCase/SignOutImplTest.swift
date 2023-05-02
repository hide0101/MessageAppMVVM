//
//  SignOutImplTest.swift
//  MessageAppMVVMTests
//
//  Created by hide0101 on 2023/05/01.
//

import Foundation
import Combine
@testable import MessageAppMVVM
import XCTest

internal class SignOutImplTest: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    private lazy var exp = expectation(description: "wait for complete api")
    private lazy var authRepoMock: AuthRepositoryMock = {
        ContainerResolver.shared.resolve(AuthRepository.self) as! AuthRepositoryMock
    }()
    private lazy var useCase: SignOut = {
        SignOutImpl()
    }()
    
    override internal func setUp() {
        ContainerResolver.shared.setDependencyMockContainer()
    }
    
    internal func testSuccsessful() {
        authRepoMock.signOutHandler = {
            Just(()).setFailureType(to: AuthError.self).eraseToAnyPublisher()
        }
        useCase.execute()
            .sink { [weak self] result in
                XCTAssertEqual(result.status, SignOutStatus.success)
                XCTAssertEqual(self?.authRepoMock.signOutCallCount, 1)
                self?.exp.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [exp], timeout: 1)
    }
    
    internal func testFailure() {
        authRepoMock.signOutHandler = {
            Fail(error: AuthError.unexpected).eraseToAnyPublisher()
        }
        useCase.execute()
            .sink { [weak self] result in
                XCTAssertEqual(result.status, SignOutStatus.unexpectedError)
                XCTAssertEqual(self?.authRepoMock.signOutCallCount, 1)
                self?.exp.fulfill()
            }
            .store(in: &cancellables)
        wait(for: [exp], timeout: 1)
    }
}
