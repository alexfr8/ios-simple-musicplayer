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
    @IBOutlet weak var lblArtis: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var lblDisc: UILabel!
    
    public var musicItemIndex: Int = -1
    public var datasource : MusicSearch?

    
     public let detailPresenter = DetailPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailPresenter.attachView(view:self as DetailView)
       
        detailPresenter.setupUI(musicIndex: musicItemIndex, datasource: datasource!)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func btnShare(_ sender: Any) {
    }
    
    
    @IBAction func btnPrev(_ sender: Any) {
    }
   
    
    @IBAction func btnPause(_ sender: Any) {
    }
    
    @IBAction func btnPlay(_ sender: Any) {
    }
    
    @IBAction func btnNext(_ sender: Any) {
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

extension DetailViewController : DetailView {
    func setupText(textProvided: NSDictionary) {
        
    }
    
    func setupImages(images: NSDictionary) {
        
    }
    
    func setupViews() {
        
    }
    
    func showloading() {
        
    }
    
    func hideloading() {
        
    }
    
    func showError(txt: String) {
        
    }
}
