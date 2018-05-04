//
//  SearchPresenter.swift
//  MusicPlayer
//
//  Created by Alejandro Fernández Ruiz on 2/4/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import Foundation

// MARK: Constant section
public struct SearchPresenterConstant {
    
    
    static let navBarTitle : String             =       "NAVBARTITLE"
    static let lblTitle : String                =       "LBLTITLE"
    static let lblSubtitle1 : String            =       "LBLSUBITLE1"
    static let lblSubtitle2 : String            =       "LBLSUBITLE2"
    static let txtFindHolder: String            =       "TXTFINDHOLDER"
}

class SearchPresenter {
    
    
    weak private var mySearchView: SearchView?
    weak private var api: API?
    
    init() {
       
    }
    
    func attachView(view: SearchView){
        mySearchView = view
    }
    
    func detachView(){
        mySearchView = nil
    }
    func setupUI() {
        
        //RETRIEVE TEXTS FROM THE LOCALIZABLE.STRINGS.
        let  mTexts:NSMutableDictionary = [
            SearchPresenterConstant.navBarTitle : NSLocalizedString("SearchView.navBarTitle", comment: "navBarTitle")
            ,SearchPresenterConstant.lblTitle : NSLocalizedString("SearchView.lblTitle", comment: "lblTitle")
            ,SearchPresenterConstant.lblSubtitle1 : NSLocalizedString("SearchView.lblDescription", comment: "lblDescription")
            ,SearchPresenterConstant.lblSubtitle2 : NSLocalizedString("SearchView.lblYourIdTitle", comment: "lblYourIdTitle")
            ,SearchPresenterConstant.lblSubtitle2 : NSLocalizedString("SearchView.lblYourIdTitle", comment: "lblYourIdTitle")
            ,SearchPresenterConstant.txtFindHolder : NSLocalizedString("SearchView.txtFindHolder", comment: "txtFindHolder")
        ]
        
      
        mySearchView?.setupText(textProvided: mTexts as NSDictionary)
        mySearchView?.setupViews()
        mySearchView?.setupImages(images: [:])
    }
    
    func fetchMusic(term: String) {
        self.mySearchView?.showloading()
        API.search(termParam:term) { (success, musicSearch, message) in
            if (success) {
                self.mySearchView?.loadTable(value: musicSearch!)
            } else {
                self.mySearchView?.showError(txt: NSLocalizedString("data-notfound", comment: ""))
            }
            self.mySearchView?.hideloading()
        }
    }
}
