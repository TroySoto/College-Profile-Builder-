//
//  ViewController.swift
//  College Profile
//
//  Created by TSoto1 on 1/25/16.
//  Copyright © 2016 TSoto1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    var colleges : [Colleges] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        colleges.append(Colleges(CollegeName: "USC", Location: "Los Angeles, California", Mascot: "Trojans",NumberOfStudents: 43000, Image: UIImage(named: "usc")!))
        colleges.append(Colleges(CollegeName: "UCLA", Location: "Los Angeles, California", Mascot: "Bruins",NumberOfStudents: 43239, Image: UIImage(named: "ucla")!))
        colleges.append(Colleges(CollegeName: "UC Berkeley", Location: "Berkeley, California", Mascot: "Oski", NumberOfStudents: 37581, Image: UIImage(named: "berkeley")!))
        
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let collegeNameTextField = myAlert.textFields![0] as UITextField
            let locationTextField = myAlert.textFields![1] as UITextField
            let mascotTextField = myAlert.textFields![2] as UITextField
            let numberOfStudentsTextField = myAlert.textFields![3] as UITextField
            self.colleges.append(Colleges(CollegeName: collegeNameTextField.text!, Location: locationTextField.text!, Mascot: mascotTextField.text!, NumberOfStudents: Int(numberOfStudentsTextField.text!)!))
            self.myTableView.reloadData()
        }
        
        myAlert.addTextFieldWithConfigurationHandler
            { (collegeNameTextField) -> Void in
                collegeNameTextField.placeholder = "Add College Name"
        }
        
        myAlert.addTextFieldWithConfigurationHandler
            { (locationTextField) -> Void in
                locationTextField.placeholder = "Add Location"
        }
        
        myAlert.addTextFieldWithConfigurationHandler
            {(mascotTextField) -> Void in
                mascotTextField.placeholder = "Add Mascot"
        }
        
        myAlert.addTextFieldWithConfigurationHandler
            {(numberOfStudentsTextField) -> Void in
                numberOfStudentsTextField.placeholder = "Add Number of Students"
                
        }
        myAlert.addAction(addAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = colleges[indexPath.row].collegeName
        myTableViewCell.detailTextLabel?.text = colleges[indexPath.row].location
        return myTableViewCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = segue.destinationViewController as! DetailedViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailVC.college = colleges[selectedRow!]
        
    }
}

