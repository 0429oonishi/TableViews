//
//  CollectionTableViewCell.swift
//  CollectionViewInTableView
//
//  Created by 大西玲音 on 2021/03/31.
//

import UIKit

final class CollectionTableViewCell: UITableViewCell {
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = CollectionTableViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: CollectionTableViewCell.toString, bundle: nil)
    }
    private var models = [Model]()

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.id)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with models: [Model]) {
        self.models = models
        collectionView.reloadData()
    }
    
}

extension CollectionTableViewCell: UICollectionViewDelegate {
    
}

extension CollectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        let model = models[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    
}
