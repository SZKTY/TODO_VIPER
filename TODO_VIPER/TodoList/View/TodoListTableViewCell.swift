//
//  TodoListTableViewCell.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/21.
//

import UIKit

protocol Finish: AnyObject {
    func tappedFinishButton(row: Int)
}

class TodoListTableViewCell: UITableViewCell {

    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!

    weak var delegate: Finish?

    override func awakeFromNib() {
        super.awakeFromNib()
        checkButton.addTarget(self, action: #selector(tappedFinishButton), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

@objc private extension TodoListTableViewCell {
    func tappedFinishButton() {
        delegate?.tappedFinishButton(row: indexPath!.row)
    }
}

extension TodoListTableViewCell {

    var tableView: UITableView? {
        return next(UITableView.self)
    }

    var indexPath: IndexPath? {
        return tableView?.indexPath(for: self)
    }
}
