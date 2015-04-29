//
//  MainViewController.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 4/22/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit


public struct Storyboard {
    static let CellReuseIdentifier = "cell"
}

public struct URL {
    static let main = "http://localhost:3000"
    static let gallery = "http://localhost:3000/gallery"
}


class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    var titleArray:NSArray = []
    
    @IBOutlet var lorem: UIButton!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! MainTableViewCell
        if let data = titleArray[indexPath.row] as? NSDictionary {
            cell.coll = data
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = NSURL(string: URL.main) {
            if let data = NSData(contentsOfURL: url) {
                titleArray =  NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error:nil) as! NSArray
            }
        }
        println("from Main")
        
        self.navigationController?.navigationBarHidden = true
    
        if self.revealViewController() != nil {
          lorem.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: .TouchUpInside)
        }
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
