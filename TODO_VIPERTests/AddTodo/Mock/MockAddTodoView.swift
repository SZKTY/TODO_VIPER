//
//  MockAddTodoView.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/30.
//

import UIKit
@testable import TODO_VIPER

class MockAddTodoView: AddTodoView {
    var presenter: AddTodoPresenter!
    var callCountSaveButton = 0
    
    func tappedSaveButton() {
        callCountSaveButton += 1
    }
}
