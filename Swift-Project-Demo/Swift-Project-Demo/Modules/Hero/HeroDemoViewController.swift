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

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = curHomeItem!.title
        label.hero.id = "label-\(curHomeItem!.title)"
        label.font = .systemFont(ofSize: 25, weight: .medium)
        label.textColor = .darkGray
        return label
    }()

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.hero.modifiers = [.cascade]
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 50
        table.backgroundColor = .clear
        table.tableFooterView = UIView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
    }()

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Swift Demo"
        view.backgroundColor = .white
        let barItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(backP))
        self.navigationItem.setLeftBarButton(barItem, animated: true)

        commonInit()
    }

    @objc func backP() {
        dismiss(animated: true, completion: nil)
    }

    private func commonInit() {
        view.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: 300, height: 500))
        }

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(backView.snp.top).offset(-20)
            make.centerX.equalToSuperview()
        }

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(backView)
            make.bottom.equalToSuperview()
        }
    }

}

extension HeroDemoViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 10)
        view.backgroundColor = .clear
        return view
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.hero.modifiers = [.fade, .translate(CGPoint(x: 0, y: 50)), .scale(0.5)]
        // rgb(26, 188, 156)
        cell.backgroundColor = UIColor(red: 26 / 255.0, green: 188 / 255.0, blue: 156 / 255.0, alpha: 1.0)
        return cell
    }
}
