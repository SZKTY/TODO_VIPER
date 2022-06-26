//
//  DetailTodoRouter.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/25.
//

import UIKit

protocol DetailTodoWireframe: AnyObject {
    func tappedBackButton()
    func deletedTodo()
}

final class DetailTodoRouter {
    // 画面遷移のためにViewControllerが必要。initで受け取る
    private unowned let viewController: UIViewController
    
    private init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    static func assembleModules(row: Int) -> UIViewController {
        let view = UIStoryboard.detailTodo.instantiateInitialViewController() as! DetailTodoViewController
        let interactor = DetailTodoInteractor()
        let router = DetailTodoRouter(viewController: view)
        // presenterが中継役なので、全てと繋げる
        let presenter = DetailTodoPresenter(view: view,
                                            interactor: interactor,
                                            router: router,
                                            row: row)
        interactor.presenter = presenter
        // viewからpresenterに通知する必要があるため繋ぐ
        view.inject(presenter: presenter)
        return view
    }
}

extension DetailTodoRouter: DetailTodoWireframe {
    func tappedBackButton() {
        self.viewController.navigationController?.popToRootViewController(animated: true)
    }
    
    func deletedTodo() {
        self.viewController.navigationController?.popToRootViewController(animated: true)
    }
}
