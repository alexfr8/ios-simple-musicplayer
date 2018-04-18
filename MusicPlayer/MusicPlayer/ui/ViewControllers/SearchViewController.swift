//
//  SearchViewController.swift
//  MusicPlayer
//
//  Created by Alejandro Fernández Ruiz on 2/4/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit


protocol SearchView: NSObjectProtocol {
    func setupText(textProvided: NSDictionary)
    func setupImages(images: NSDictionary)
    func setupViews()
    
    func showloading()
    func hideloading()
    func loadTable(mValues: NSDictionary)
}

class SearchViewController: BaseViewController {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSub1: UILabel!
    @IBOutlet weak var lblSub2: UILabel!
    @IBOutlet weak var txtSearch: UITextField! { didSet { txtSearch.delegate = self } }
    @IBOutlet weak var tableSearch: UITableView!
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchViewController: SearchView {
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
    
    func showloading() {
        
    }
    
    func hideloading() {
        
    }
    
    func loadTable(mValues: NSDictionary) {
        
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

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) // as! CustomTableViewCell
        // Configure the cell...
        // let dataObject = dataSource[indexPath.row] // of type DataObject
        // Set up background color
        //cell.backgroundColor = dataObject.backgroundColor
        
        // Set label text
        //cell.textLabel.text = dataObject.textForLabel
        
        // Set anything else you want to set. If you subclass UITableViewCell,
        // you can cast it as that object (above) and set things here, same as
        // everything you've already set.
        return cell
    }
    
    
}
