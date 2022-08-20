//
//  MockTodoListPresenter.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/07/31.
//

@testable import TODO_VIPER

class MockTodoListPresenter: TodoListPresentation {
    var callCountViewWillAppear = 0
    var callCountDidFetchedTodos = 0
    var callCountTappedAddButton = 0
    var callCountDidSelect = 0
    var callCountTappedFinishButton = 0
    
    func viewWillAppear() {
        callCountViewWillAppear += 1
    }
    
    func didFetchedTodos(_ todos: [[String]]) {
        callCountDidFetchedTodos += 1
    }
    
    func tappedAddButton() {
        callCountTappedAddButton += 1
    }
    
    func didSelect(row: Int) {
        callCountDidSelect += 1
    }
    
    func tappedFinishButton(row: Int) {
        callCountTappedFinishButton += 1
    }
}
