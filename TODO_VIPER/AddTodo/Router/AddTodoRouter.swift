//
//  TodoDetailRouter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/21.
//

import UIKit

protocol AddTodoWireframe: AnyObject {
    func addedTodo(row: Int)
}

final class AddTodoRouter {
    // 画面遷移のためにViewControllerが必要。initで受け取る
    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    static func assembleModules() -> UIViewController {
        let view = UIStoryboard.addTodo.instantiateInitialViewController() as! AddTodoViewController
        let interactor = AddTodoInteractor()
        let router = AddTodoRouter(viewController: view)
        // presenterが中継役なので、全てと繋げる
        let presenter = AddTodoPresenter(view: view,
                                         interactor: interactor,
                                         router: router)
        interactor.presenter = presenter
        // viewからpresenterに通知する必要があるため繋ぐ
        view.inject(presenter: presenter)
        return view
    }
}

extension AddTodoRouter: AddTodoWireframe {
    
    func addedTodo(row: Int) {
        let next = DetailTodoRouter.assembleModules(row: row)
        viewController.show(next: next)
    }
}
