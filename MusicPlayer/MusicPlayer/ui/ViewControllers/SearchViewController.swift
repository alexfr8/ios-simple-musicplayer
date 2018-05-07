//
//  SearchViewController.swift
//  MusicPlayer
//
//  Created by Alejandro Fernández Ruiz on 2/4/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit
import SwiftSpinner

protocol SearchView: NSObjectProtocol {
    func setupText(textProvided: NSDictionary)
    func setupImages(images: NSDictionary)
    func setupViews()
    
    func showloading()
    func hideloading()
    func loadTable(value: MusicSearch)
    func showError(txt: String)
}

class SearchViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSub1: UILabel!
    @IBOutlet weak var lblSub2: UILabel!
    @IBOutlet weak var txtSearch: UITextField! { didSet { txtSearch.delegate = self } }

   
    @IBOutlet weak var tableViewSearch: UITableView!
    weak var animationTypeLabel:UILabel!
    var datasource : MusicSearch?
    
    public let searchPresenter = SearchPresenter()
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        searchPresenter.attachView(view:self)
        // Do any additional setup after loading the view.
        searchPresenter.setupUI()
        searchPresenter.fetchMusic(term: "queen")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        searchPresenter.detachView()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        if let editorVC = segue.destinationViewController as? NoteEditorViewController {
//            
//            if "CellSelected" == segue.identifier {
//                if let path = tableView.indexPathForSelectedRow() {
//                    editorVC.note = notes[path.row]
//                }
//            } else if "AddNewNote" == segue.identifier {
//                let note = Note(text: " ")
//                editorVC.note = note
//                notes.append(note)
//            }
//        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (datasource != nil) {
            return (datasource?.resultCount)!
        } else {
            return 0
        }
        

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewSearch.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let musicItem: MusicElement     = datasource!.results![indexPath.row]
        
       // cell.lblTitle?.text             = musicItem.trackName
       // cell.lblAuthor?.text            = musicItem.artistName
       // cell.imgArtWork?.imageFromURL(urlString: musicItem.artworkUrl100!)
        cell.textLabel?.text = musicItem.trackName
        return cell
    }

}

extension SearchViewController: SearchView {
    
    func showloading() {
        
        SwiftSpinner.show("TRY", animated: true)
    }
    
    func hideloading() {
        SwiftSpinner.hide()
    }
    
    func showError(txt: String) {
        
    }
    
    func setupText(textProvided: NSDictionary) {
        lblTitle.text           =   textProvided.object(forKey: SearchPresenterConstant.lblTitle) as? String
        lblSub1.text            =   textProvided.object(forKey: SearchPresenterConstant.lblSubtitle1) as? String
        lblSub2.text            =   textProvided.object(forKey: SearchPresenterConstant.lblSubtitle2) as? String
        txtSearch.placeholder   =   textProvided.object(forKey: SearchPresenterConstant.txtFindHolder) as? String
    }
    
    func setupImages(images: NSDictionary) {
        
    }
    
    func setupViews() {
      
    }
    
   
    
    func loadTable(value: MusicSearch) {
        
        datasource = value
      tableViewSearch.reloadData()
        
    }
    
    
}

extension SearchViewController: UITextFieldDelegate{
    // UITextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
}


