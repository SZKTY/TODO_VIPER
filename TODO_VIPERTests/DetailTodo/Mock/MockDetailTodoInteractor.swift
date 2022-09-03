//
//  MockDetailTodoInteractor.swift
//  TODO_VIPERTests
//
//  Created by 鈴木登也 on 2022/08/31.
//

@testable import TODO_VIPER

class MockDetailTodoInteractor: DetailTodoUsecase {
    var callCountFetchTodo: Int = 0
    var callCountFinishTodo: Int = 0
    var callCountSaveTodo: Int = 0
    var todoIdFetchTodo: Int?
    var todoIdFinishTodo: Int?
    
    func fetchTodo(todoId: Int) {
        callCountFetchTodo += 1
        todoIdFetchTodo = todoId
    }
    
    func finishTodo(todoId: Int) {
        callCountFinishTodo += 1
        todoIdFinishTodo = todoId
    }
    
    func saveTodo(todos: [[String]]) {
        callCountSaveTodo += 1
    }
    
}
