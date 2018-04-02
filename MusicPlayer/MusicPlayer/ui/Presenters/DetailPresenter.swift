//
//  DetailPresenter.swift
//  MusicPlayer
//
//  Created by Alejandro Fernández Ruiz on 2/4/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import Foundation
// MARK: Constant section
public struct DetailPresenterConstant {
    
    
    static let navBarTitle : String             =       "NAVBARTITLE"
    static let lblTitle : String                =       "LBLTITLE"
    static let lblSubtitle1 : String            =       "LBLSUBITLE1"
    static let lblSubtitle2 : String            =       "LBLSUBITLE2"
}

class DetailPresenter {
    
    
    weak private var mySearchView: SearchView?
    
    init() {
        
    }
    
    func attachView(view: SearchView){
        mySearchView = view
    }
    
    func detachView(){
        mySearchView = nil
    }
    func setupUI() {
        
    }
}
