//
//  DetailViewController.swift
//  MusicPlayer
//
//  Created by Alejandro Fernández Ruiz on 2/4/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit


protocol DetailView: NSObjectProtocol {
    func setupText(textProvided: NSDictionary)
    func setupImages(images: NSDictionary)
    func setupViews()
    
    func showloading()
    func hideloading()
    func showError(txt: String)
}
class DetailViewController: BaseViewController {
    
    public var musicItemIndex: Int = -1
    public var datasource : MusicSearch?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
