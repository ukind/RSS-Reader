//
//  MasterViewController.swift
//  RSSReader
//
//  Created by Yogiswara Utama on 7/13/15.
//  Copyright (c) 2015 RssReader. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var siteNames:[String]?
    var siteAddress:[String]?
    var labelDetail:[String]?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Channel"
        {
            if let selectedIndex = self.tableView.indexPathForSelectedRow()
            {
                let urlString = siteNames?[selectedIndex.row]
                
               //let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! CountryTableViewController
            controller.titleJudul = urlString!
            controller.titleLabel?.append(urlString!)
            controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
            controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    

    var detailViewController: CountryTableViewController? = nil
    var objects = [AnyObject]()
    
    


    override func awakeFromNib() {
        super.awakeFromNib()
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            self.clearsSelectionOnViewWillAppear = false
            self.preferredContentSize = CGSize(width: 320.0, height: 600.0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        siteNames = ["Asia","Europe","America","Africa"]
        labelDetail = ["Music Weekly Asia,Jpop Asia,SBS PopAsia - non-stop Asian pop!,Asianpopnews","b","c","d"]
//        siteAddress = ["http://google.com","http://theused.net"]
        
        
//        if var split = splitViewController
//        {
//            let controllers = split.viewControllers
//            detailViewController = controllers[controllers.count-1].topViewController as? CountryTableViewController
//        }
        
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem()

//        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
//        self.navigationItem.rightBarButtonItem = addButton
//        if let split = self.splitViewController {
//            let controllers = split.viewControllers
//            self.detailViewController = controllers[controllers.count-1].topViewController as? CountryTableViewController
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func insertNewObject(sender: AnyObject) {
//        objects.insert(NSDate(), atIndex: 0)
//        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
//        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//    }

    // MARK: - Segues

  

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return siteNames!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = siteNames![indexPath.row]
        cell.detailTextLabel?.text = labelDetail![indexPath.row]
        return cell
    }

//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }

//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            objects.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }


}

