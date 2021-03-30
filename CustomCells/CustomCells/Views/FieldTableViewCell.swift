//
//  FieldTableViewCell.swift
//  CustomCells
//
//  Created by 大西玲音 on 2021/03/30.
//

import UIKit

class FieldTableViewCell: UITableViewCell {
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = FieldTableViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: FieldTableViewCell.toString, bundle: nil)
    }
    
    @IBOutlet var myTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        myTextField.placeholder = "Enter Somthing"
        myTextField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension FieldTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("\(textField.text ?? "")")
        return true
    }
}
