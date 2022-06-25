//
//  TodoListTableViewCell.swift
//  TODO_VIPER
//
//  Created by 鈴木登也 on 2022/06/21.
//

import UIKit

class TodoListTableViewCell : UITableViewCell {
    
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
