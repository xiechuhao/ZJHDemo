//
//  ViewController.swift
//  managerDemo
//
//  Created by HouWan on 2021/6/8.
//

import UIKit
import MGJRouter_Swift

class ViewController: UIViewController {

    let cellIdentifier = "cellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 100, width: 500, height: 800)
        tableView.register(tableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    lazy var tableView: UITableView = {
        let tview = UITableView(frame: .zero, style: .plain)
        tview.delegate = self
        tview.dataSource = self
        return tview
    }()
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! tableViewCell
        var contentStr = ""
        switch indexPath.row {
        case 0:
            contentStr = "首页"
        case 1:
            contentStr = "内容"
        default:
            contentStr = "我的"
        }
        cell.contentLab.text = contentStr
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            MGJRouter.open("ZJH://ZJHHome/HomeVC", ["navigation": navigationController as Any]) { (_) in
            }
        default: break
        }
    }
}

class tableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configUI() {
        contentView.addSubview(contentLab)
        contentLab.frame = CGRect(x: 20, y: 10, width: 100, height: 20)
    }

    lazy var contentLab: UILabel = {
        let lab = UILabel()
        lab.text = "内容"
        return lab
    }()
}
