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
    static let imgUrl   : String                =       "IMGURLDETAIL"
    
}

class DetailPresenter {
    
    
    weak private var myDetailView: DetailView?
    
    init() {
        
    }
    
    func attachView(view: DetailView){
        myDetailView = view
    }
    
    func detachView(){
        myDetailView = nil
    }
    func setupUI(musicIndex: Int, datasource: MusicSearch) {
        
        let item:MusicElement = datasource.getResultList()[musicIndex]
        
        //RETRIEVE TEXTS FROM THE LOCALIZABLE.STRINGS.
        let  mTexts:NSMutableDictionary = [
            DetailPresenterConstant.navBarTitle : item.artistName ?? ""
            ,   DetailPresenterConstant.lblTitle : item.collectionName ?? ""
            
        ]
        myDetailView?.setupText(textProvided: mTexts as NSDictionary)
        myDetailView?.setupViews()
        myDetailView?.setupImages(images: [DetailPresenterConstant.imgUrl: item.artworkUrl100 ?? ""])
    }
}
