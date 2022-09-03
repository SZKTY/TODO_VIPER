//
//  MockAddTodoInteractor.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/30.
//

@testable import TODO_VIPER

class MockAddTodoInteractor: AddTodoUsecase {
    var callCountSaveTodo = 0
    
    func saveTodo(todo: [String]) {
        callCountSaveTodo += 1
    }
}
