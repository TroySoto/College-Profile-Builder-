//
//  DetailedViewController.swift
//  College Profile
//
//  Created by TSoto1 on 1/25/16.
//  Copyright © 2016 TSoto1. All rights reserved.
//

import UIKit
import SafariServices

class DetailedViewController: UIViewController, SFSafariViewControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var collegeNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var mascotTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var webpageTextField: UITextField!
    
    var college: Colleges!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeNameTextField.text! = college.collegeName
        locationTextField.text! = college.location
        mascotTextField.text! = college.mascot
        numberOfStudentsTextField.text! = String(college.numberOfStudents)
        webpageTextField.text! = college.webpageURL
        myImageView.image = college.image
    }
    
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.collegeName = collegeNameTextField.text!
        college.location = locationTextField.text!
        college.mascot = mascotTextField.text!
        college.numberOfStudents = Int(numberOfStudentsTextField.text!)!
    }
  
    @IBAction func goToSiteButtonTapped(sender: UIButton)
    {
        let url = NSURL(string: college.webpageURL)
        let sVC = SFSafariViewController(URL: url!)
        sVC.delegate = self
        presentViewController(sVC, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
