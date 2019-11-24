//
//  GithubSearchViewReactor.swift
//  ReactorKit-Tutorial
//
//  Created by Atsushi KONISHI on 2019/11/24.
//  Copyright © 2019 小西篤志. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift

final class GithubSearchViewReactor: Reactor {
    enum Action {
        case updateQuery(String?)
    }
    
    // stateの変更はmutationからのみ許される
    enum Mutation {
        // update State.repos
        case setRepos([String])
    }
    
    struct State {
        // search result
        var repos: [String]
    }
    
    let initialState = State(repos: [])
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .updateQuery(query): // user update the search query
            if let query = query {
                 let dummyRepos = ["\(query)1", "\(query)2", "\(query)3"] // dummy result
                return Observable.just(Mutation.setRepos(dummyRepos))
            } else {
                return Observable.just(Mutation.setRepos([]))
            }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        switch mutation {
        case let .setRepos(repos):
            return State(repos: repos)
        }
    }
    
}
