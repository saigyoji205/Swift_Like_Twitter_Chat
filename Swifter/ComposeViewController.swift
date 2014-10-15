//
//  ComposeViewController.swift
//  Swifter
//
//  Created by Hirokazu on 2014/10/11.
//  Copyright (c) 2014年 Hirokazu. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var sweetTextView: UITextView! = UITextView()
    @IBOutlet weak var charRemainingLabel: UILabel! = UILabel()
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sweetTextView.layer.borderColor = UIColor.blackColor().CGColor
        sweetTextView.layer.borderWidth = 0.5
        sweetTextView.layer.cornerRadius = 5
        sweetTextView.delegate = self
        
        
        
        sweetTextView.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendSweet(sender: AnyObject) {
        var sweet:PFObject = PFObject(className:"Sweets")
        sweet["content"] = sweetTextView.text
        sweet["sweeter"] = PFUser.currentUser()
        
        sweet.saveInBackground()
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    func textView(textView:UITextView!,shouldChangeTextInRange range:NSRange,replacementText text:String!)->Bool{
        
        var newLength:Int = (textView.text as NSString).length + (text as NSString).length - range.length
        var remainingChar:Int = 140 - newLength
        
        charRemainingLabel.text = "\(remainingChar)"
        
        return (newLength > 140) ? false : true
   
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
