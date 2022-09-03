//
//  MockTodoListInteractor.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/07/31.
//

@testable import TODO_VIPER

class MockTodoListInteractor: TodoListUsecase {
    var output: TodoListInteractorOutput?
    
    var callCountFetchTodos = 0
    var callCountDeleteTOdo = 0

    func fetchTodos() {
        callCountFetchTodos += 1
    }
    
    func deleteTodo(row: Int) {
        callCountDeleteTOdo += 1
    }
}

class MockTodoListInteractorOutput: TodoListInteractorOutput {
    var callCountGetSuccess = 0
    var callCountGetFailure = 0
    var result: [[String]]? = nil
    
    func getSuccess(_ todos: [[String]]) {
        callCountGetSuccess += 1
        result = todos
    }
    
    func getFailure() {
        callCountGetFailure += 1
    }
}
