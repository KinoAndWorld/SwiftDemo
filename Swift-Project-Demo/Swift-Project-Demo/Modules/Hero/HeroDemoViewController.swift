//
//  HeroDemoViewController.swift
//  Swift-Project-Demo
//
//  Created by 陈文杰 on 2021/12/20.
//

import UIKit
import Hero
import SnapKit

class HeroDemoViewController: UIViewController {

    // MARK: Variable
    var curHomeItem: HomeItem?

    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = curHomeItem?.color
        view.hero.id = (curHomeItem?.title) ?? ""
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Swift Demo"
        view.backgroundColor = .white
        // layout

        commonInit()
    }

    private func commonInit() {
        view.addSubview(backView)
        backView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 300, height: 300))
        }
        view.layoutIfNeeded()
    }

}
