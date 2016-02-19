//
//  Colleges.swift
//  College Profile
//
//  Created by TSoto1 on 1/25/16.
//  Copyright © 2016 TSoto1. All rights reserved.
//

import UIKit

class Colleges: NSObject
{
    
    var collegeName = ""
    var location = ""
    var mascot = ""
    var numberOfStudents = 0
    var image = UIImage(named: "Defualt")
    
    
    init(CollegeName: String, Location: String, Mascot: String, NumberOfStudents: Int, Image: UIImage)
    {
        super.init()
        collegeName = CollegeName
        location = Location
        mascot = Mascot
        numberOfStudents = NumberOfStudents
        image = Image
    }
    
    init(CollegeName: String, Location: String, Mascot: String, NumberOfStudents: Int)
    {
        super.init()
        collegeName = CollegeName
        location = Location
        mascot = Mascot
        numberOfStudents = NumberOfStudents
    }
}
