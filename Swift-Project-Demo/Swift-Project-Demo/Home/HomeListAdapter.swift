//
//  HomeListAdapter.swift
//  BDGameLive
//
//  Created by 陈文杰 on 2021/10/21.
//

import UIKit

class HomeListAdapter: NSObject {
    var collectionView: UICollectionView?

    var list: [HomeItem] = [] {
        didSet {
            collectionView?.reloadData()
        }
    }

    init(collectionView: UICollectionView) {
        super.init()

        self.collectionView = collectionView
        initView()
    }

    func initView() {
        collectionView?.backgroundColor = .clear
        collectionView?.collectionViewLayout = flowLayout(itemCountOnLine: 2, margin: 16)
        collectionView?.register(R.nib.homeListItemCell)

        collectionView?.dataSource = self
        collectionView?.delegate = self
    }

    func flowLayout(itemCountOnLine: Int, margin: CGFloat) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let lineItemCount = CGFloat(itemCountOnLine)

        let itemw = (UIScreen.main.bounds.width - margin * (lineItemCount + 1)) / lineItemCount
        layout.itemSize = CGSize(width: itemw, height: itemw)
        layout.sectionInset = UIEdgeInsets(top: 20, left: margin, bottom: margin, right: margin)
        layout.minimumLineSpacing = margin
        layout.minimumInteritemSpacing = 10 // 最小item间距
        return layout
    }
}

extension HomeListAdapter: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeListItemCell = collectionView.dequeueReusableCell(withReuseIdentifier:
                                                                            R.reuseIdentifier.homeListItemCell,
                                                                        for: indexPath)!
        let item = list[indexPath.row]
        cell.titleLabel.text = item.title
        cell.contentLabel.text = item.content
        cell.backImageView.backgroundColor = item.color
        cell.hero.id = item.title
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = list[indexPath.row]
        item.handler?(item)
    }
}
