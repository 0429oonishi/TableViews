//
//  MyCollectionViewCell.swift
//  CollectionViewInTableView
//
//  Created by 大西玲音 on 2021/03/31.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = MyCollectionViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: MyCollectionViewCell.toString, bundle: nil)
    }
    
    @IBOutlet private weak var myImageView: UIImageView!
    @IBOutlet private weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with model: Model) {
        myImageView.image = UIImage(named: model.imageName)
        myLabel.text = model.text
    }
    
}
