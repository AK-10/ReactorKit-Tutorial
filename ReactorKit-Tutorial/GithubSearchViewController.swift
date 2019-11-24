//
//  ViewController.swift
//  ReactorKit-Tutorial
//
//  Created by Atsushi KONISHI on 2019/11/24.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import RxCocoa

final class GithubSearchViewController: UIViewController, View {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reactor = GithubSearchViewReactor()
        // Do any additional setup after loading the view.
    }
    
    func bind(reactor: GithubSearchViewReactor) {
        // Action
        searchBar.rx.text
            .map{ Reactor.Action.updateQuery($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    
        // State
        reactor.state.map { $0.repos }
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { indexPath, repo, cell in
                cell.textLabel?.text = repo
            }
            .disposed(by: disposeBag)
    }

}

