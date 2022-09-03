//
//  MockDetailTodoRouter.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/31.
//

import UIKit
@testable import TODO_VIPER

class MockDetailTodoRouter: DetailTodoWireframe {
    var callCountTappedBackButton: Int = 0
    var callCountDeletedTodo: Int = 0
    
    func tappedBackButton() {
        callCountTappedBackButton += 1
    }
    
    func deletedTodo() {
        callCountDeletedTodo += 1
    }
}
