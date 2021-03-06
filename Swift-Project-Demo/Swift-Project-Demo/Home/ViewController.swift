//
//  ViewController.swift
//  Swift-Project-Demo
//
//  Created by 陈文杰 on 2021/12/17.
//

import UIKit
import SnapKit
import Hero
import HealthKit

typealias HomeItemTapHandler = (HomeItem) -> Void

struct HomeItem {
    var title = ""
    var content = ""
    var color: UIColor
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
                     color: .purple,
                     handler: { [unowned self] _ in
                         let dest = RSwiftDemoController()
                         self.navigationController?.pushViewController(dest, animated: true)
                     }),
            HomeItem(title: "Hero",
                     content: "",
                     color: R.color.bH()!,
                     handler: { [unowned self] item in
                         let dest = HeroDemoViewController()
                         dest.curHomeItem = item
                         // present
                         let navi = UINavigationController(rootViewController: dest)
                         navi.modalPresentationStyle = .fullScreen
                         navi.hero.isEnabled = true
                         self.present(navi, animated: true, completion: nil)
                     })
        ]
    }









    private func testCodeLint() {
        /// swiftlint:disable:next implicitly_unwrapped_optional
        var str: String! = "111"
        let str2 = str!
        str = "s"

        let obj: Any? = 0
        _ = obj as! Int

        print("str = \(str ?? ""), str2 = \(str2)")

        let ret = ["1","2","3"].map{ str in
            return"NO." + str
        }
        print(ret)

//        // identifier_name
//        let some_var: Int = 0
//        print(some_var)
    }
}

// type_name & identifier_name
// class aClass {
//    let a = 1
// }
