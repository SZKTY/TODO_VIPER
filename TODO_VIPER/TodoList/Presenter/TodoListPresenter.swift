//
//  TodoPresenter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/22.
//

import Foundation

protocol TodoListPresentation: AnyObject {
    func tappedAddButton()

}

final class TodoListPresenter {
    
    private weak var view: TodoListView?
    private var router: TodoListWireframe
    
    init(view: TodoListView, router: TodoListWireframe) {
        self.view = view
        self.router = router
    }
    
}

extension TodoListPresenter: TodoListPresentation {
    
    func tappedAddButton() {
        self.router.addTodo()
    }
}
