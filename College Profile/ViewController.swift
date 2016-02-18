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
        
        colleges.append(Colleges(CollegeName: "USC", Location: "Los Angeles, California", Mascot: "Trojans",NumberOfStudents: 43000, Image: UIImage(named: "")!))
        colleges.append(Colleges(CollegeName: "UCLA", Location: "Los Angeles, California", Mascot: "Bruins",NumberOfStudents: 43239, Image: UIImage(named: "")!))
        colleges.append(Colleges(CollegeName: "UC Berkeley", Location: "Berkeley, California", Mascot: "Oski", NumberOfStudents: 37581, Image: UIImage(named: "")!))
        
    }

    @IBAction func addButtonTapped(sender: AnyObject)
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
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let superhero = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(superhero, atIndex: destinationIndexPath.row)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailVC = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailVC.superhero = colleges[selectedRow!]
        
    }
}

