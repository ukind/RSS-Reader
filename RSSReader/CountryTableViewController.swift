//
//  CountryTableViewController.swift
//  RSSReader
//
//  Created by Yogiswara Utama on 7/13/15.
//  Copyright (c) 2015 RssReader. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "selectedChannel"
        {
            if let selectedIndex = self.tableView.indexPathForSelectedRow()
            {
                let sendData = titleLabel?[selectedIndex.row]
                
                //let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! CountryTableViewController
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! ListRssTableViewController
//                let controller = segue.destinationViewController as! ListRssTableViewController
                controller.url = sendData
              
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }

    }
    
    
    var image:[String] = []
    var titleJudul:String! = "Asia"
    var titleLabel:[String]?
    var titleDes:[String]?
    
//    "Asia","Europe","America","Africa"
    func pilih()
    {
        switch titleJudul
        {
        case "Asia" :
            titleLabel = ["Music Weekly Asia","Jpop Asia","SBS PopAsia - non-stop Asian pop!","Asianpopnews"]
            titleDes = [
                "Music Weekly is the leading source of digital and music industry news, reviews and interview for South-East Asia",
                "Largest online resource for Asian music, news, lyrics, videos, community J-pop, K-pop, J-rock, C-pop & Anime",
                "Australia's #1 Asian pop network on TV, Radio",
                "Fresh Asian Entertainment News Daily"]
            image.removeAll(keepCapacity: false)
            image.append("a.jpg")
            image.append("b.jpg")
            image.append("a.jpg")
            image.append("b.jpg")
            break
            
        case "Europe" :
            titleLabel = ["theused1","theused2"]
            titleDes = ["berita","portal"]
            image.removeAll(keepCapacity: false)
            image.append("b.jpg")
            image.append("a.jpg")
            
            break
        default :
            titleLabel = nil
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        
        if titleJudul == nil{
            titleJudul = "Asia"
        }
        pilih()
        
      

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        println(titleJudul)
    }
    
  
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return titleLabel!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        SVProgressHUD.dismiss()
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
//        var alamat:NSURL = NSURL(string: image[indexPath.row])!
//        var data:NSData = NSData(contentsOfURL: alamat)!
        (cell.contentView.viewWithTag(3) as! UILabel).numberOfLines = 0
       
        (cell.contentView.viewWithTag(3) as! UILabel).text = titleDes![indexPath.row]
        (cell.contentView.viewWithTag(2) as! UILabel).text = titleLabel![indexPath.row]
        (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(named: image[indexPath.row])
//        cell.detailTextLabel?.text = titleLabel![indexPath.row]
        
        return cell
        
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
