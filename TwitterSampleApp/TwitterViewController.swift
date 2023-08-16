//
//  ViewController.swift
//  TwitterSampleApp
//
//  Created by 佐々木遼平 on 2023/07/27.
//

import Foundation
import UIKit

class TwitterViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mainTextView: UITextView!
    @IBAction func cancelAddButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var postOutletAddButton: UIButton!
    
    
    @IBAction func postAddButton(_ sender: UIButton) {
        
    }
    
    
    private var toolbar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.becomeFirstResponder()
        self.mainTextView.becomeFirstResponder()
        postOutletAddButton.backgroundColor = UIColor.yellow
        postOutletAddButton.layer.cornerRadius = 10
        postOutletAddButton.layer.borderWidth = 0.5
    
    }
}


