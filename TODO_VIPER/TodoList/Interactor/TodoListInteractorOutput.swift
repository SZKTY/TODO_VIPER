//
//  TodoListInteractorOutput.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/08/01.
//

protocol TodoListInteractorOutput: AnyObject {
    func getSuccess(_ todos: [[String]])
    func getFailure()
}
