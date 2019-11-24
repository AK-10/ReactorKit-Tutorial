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
        
        
    }

}

