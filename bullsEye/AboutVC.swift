//
//  AboutVC.swift
//  bullsEye
//
//  Created by Magdi Zamel on 4/12/17.
//  Copyright © 2017 Magdi Zamel. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html"){
            if let htmlData = try? Data(contentsOf: url){
                let baseUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
//            webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
                let s = String(data: htmlData,encoding: String.Encoding.utf8)
                
                
                
                webView.loadHTMLString(s!, baseURL: nil)
            }
        
        }
    
    }

    @IBAction func back(){
    self.dismiss(animated: true, completion: nil)
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
