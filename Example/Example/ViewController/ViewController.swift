//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2023/9/11.
//  ~/Library/Caches/org.swift.swiftpm/

import UIKit
import WWJavaScriptContext
import WWJavaScriptContext_ChineseConvert

final class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// 簡體 => 正體
    /// - Parameter sender: UIBarButtonItem
    @IBAction func convert_zh_TW(_ sender: UIBarButtonItem) {
        
        let traditionalChinese = WWJavaScriptContext.ChineseConvert.shared.convert(text: myLabel.text, to: .tw)
        myLabel.text = traditionalChinese
    }
    
    /// 繁體 => 簡體
    /// - Parameter sender: UIBarButtonItem
    @IBAction func convert_zh_CN(_ sender: UIBarButtonItem) {
        
        let simplifiedChinese = WWJavaScriptContext.ChineseConvert.shared.convert(text: myLabel.text, to: .cn)
         myLabel.text = simplifiedChinese
    }
}

