//
//  MineViewController.swift
//  Algorithm
//
//  Created by mac on 2022/2/9.
//

import UIKit
import MJRefresh

class MineViewController: BaseViewController {
    
    let tableView : UITableView = {
        let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        table.separatorStyle = .none
        table.estimatedRowHeight = 64.ar
        table.rowHeight = UITableView.automaticDimension
        table.tableFooterView = UIView.init(frame: CGRect.zero)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "MineCell")
        table.contentInsetAdjustmentBehavior = .never
        return table
    }()

    var rows = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBar.title = "我的"
        navBar.backBtn.isHidden = true
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.navBar.snp.bottom)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-Screen.safeAreaBottom()-49)
        }
        
        configRefresh()
    }
    
    func configRefresh() {
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.featchData(refresh: true)
            }
        })
        
        let footer = MJRefreshAutoNormalFooter()
        footer.setTitle("", for: .idle)
        footer.isRefreshingTitleHidden = true
        footer.loadingView?.color = UIColor.gray
        footer.refreshingBlock = { [self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.featchData(refresh: false)
            }
        }
        tableView.mj_footer = footer
    }
    
    @objc func featchData(refresh: Bool) {
        if refresh == true {
            rows = 5
            tableView.mj_header?.endRefreshing()
            if tableView.mj_footer?.state == MJRefreshState.noMoreData {
                tableView.mj_footer?.resetNoMoreData()
            }
        }else {
            rows += 5
            if rows >= 45 {
                tableView.mj_footer?.endRefreshingWithNoMoreData()
            }else {
                tableView.mj_footer?.resetNoMoreData()
            }
        }
        
        tableView.reloadData()
    }
    
}

extension MineViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MineCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < rows {
            let scrollVC = ScrollViewController()
            scrollVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(scrollVC, animated: true)
        }
    }
}
