//
//  MyTableViewCell.swift
//  CustomCells
//
//  Created by 大西玲音 on 2021/03/30.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = MyTableViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: MyTableViewCell.toString, bundle: nil)
    }
    
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var myLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        myImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with title: String, imageName: String) {
        myLabel.text = title
        myImageView.image = UIImage(systemName: imageName)
    }
    
}
