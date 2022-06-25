//
//  UIViewController+Extention.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/24.
//

import UIKit

extension UIViewController {
    
    static var identifier: String { String(describing: self) }
    
    func show(next: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if let nav = self.navigationController {
                nav.pushViewController(next, animated: animated)
                completion?()
            } else {
                next.modalPresentationStyle = .fullScreen
                self.present(next, animated: animated, completion: completion)
            }
        }
    }
    
}
