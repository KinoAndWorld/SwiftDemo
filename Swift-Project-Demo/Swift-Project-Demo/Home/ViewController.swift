//
//  ViewController.swift
//  Swift-Project-Demo
//
//  Created by 陈文杰 on 2021/12/17.
//

import UIKit
import SnapKit

typealias HomeItemTapHandler = () -> Void

struct HomeItem {
    var title = ""
    var content = ""
    var handler: HomeItemTapHandler?
}

class ViewController: UIViewController {

    // MARK: Variable
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    private lazy var adapter: HomeListAdapter = {
        let adapter = HomeListAdapter(collectionView: collectionView)
        return adapter
    }()
    private var items: [HomeItem] = []

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Swift Demo"
        view.backgroundColor = .white
        // layout
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        // setup
        configItems()
        adapter = HomeListAdapter(collectionView: collectionView)
        adapter.list = items
    }

    // MARK: Private
    private func configItems() {
        items = [
            HomeItem(title: "R.swift",
                     content: "",
                     handler: { [unowned self] in
                         let dest = RSwiftDemoController()
                         self.navigationController?.pushViewController(dest, animated: true)
                     }),
            HomeItem(title: "Hero",
                     content: "",
                     handler: { [unowned self] in
                         
                     })
        ]
    }

}
