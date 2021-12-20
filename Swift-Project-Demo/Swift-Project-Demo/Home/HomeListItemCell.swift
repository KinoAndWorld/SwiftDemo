//
//  HomeListItemCell.swift
//  BDGameLive
//
//  Created by 陈文杰 on 2021/10/21.
//

import UIKit

class HomeListItemCell: UICollectionViewCell {

    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.masksToBounds = true
        layer.cornerRadius = 12
    }

}
