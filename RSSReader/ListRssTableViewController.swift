//
//  ListRssTableViewController.swift
//  RSSReader
//
//  Created by Yogiswara Utama on 7/14/15.
//  Copyright (c) 2015 RssReader. All rights reserved.
//

import UIKit


class ListRssTableViewController: UITableViewController, MWFeedParserDelegate {

    var getThumbnail:String! = String()
    var linkThumbnail : [String]!
    var items = [MWFeedItem]()
    var url:String!
//    var linkGambar:Array<String> = Array()
    var selected:String?
    
    func request()
    {
        var urlRss = NSURL(string: url)
//        var urlRss = NSURL(string: "http://www.kapanlagi.com/feed/music.xml")
        var feedParser = MWFeedParser(feedURL: urlRss)
        feedParser.delegate = self
        feedParser.parse()
    }
    
    func terpilih()
    {
        switch url
        {
        case "Music Weekly Asia" :
            url = "http://musicweekly.asia/feed"
            break
            
        case "Jpop Asia" :
            url = "http://www.jpopasia.com/rss/jpopasia.xml"
            break
        case "SBS PopAsia - non-stop Asian pop!" :
            url = "http://www.sbs.com.au/popasia/rss/blogs"
            break
        case "Asianpopnews" :
            url = "http://asianpopnews.com/feed"
            break
        default :
            url = nil
            break
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        request()
    }
    
    func feedParserDidStart(parser: MWFeedParser!) {
        SVProgressHUD.show()
        self.items = [MWFeedItem]()
    }
    
    func feedParserDidFinish(parser: MWFeedParser!) {
        SVProgressHUD.dismiss()
        self.tableView.reloadData()
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedInfo info: MWFeedInfo!) {
        self.title = info.title
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedItem item: MWFeedItem!) {
        self.items.append(item)
//        getThumbnail = item.enclosures[0].valueForKey("url") as! String
//        linkThumbnail.append(getThumbnail)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var item = self.items[indexPath.row] as MWFeedItem
        var connect = KINWebBrowserViewController()
        var url = NSURL(string: item.link)
        connect.loadURL(url)
        self.navigationController?.pushViewController(connect, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        terpilih()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellRSS", forIndexPath: indexPath) as! UITableViewCell
        let item = self.items[indexPath.row] as MWFeedItem
        (cell.contentView.viewWithTag(2) as! UILabel).numberOfLines = 0
        (cell.contentView.viewWithTag(2) as! UILabel).text = item.title
        
//        (cell.contentView.viewWithTag(3) as! UILabel).text = item.summary
//        if linkThumbnail == nil
//        {
////            (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(named: "a.jpg")
//            (cell.contentView.viewWithTag(2) as! UILabel).text = item.title
//        }
//        else
//        {
//            var alamat:NSURL = NSURL(string: linkThumbnail[indexPath.row])!
//            var data:NSData = NSData(contentsOfURL: alamat)!
//            (cell.contentView.viewWithTag(2) as! UILabel).text = item.title
////            (cell.contentView.viewWithTag(1) as! UIImageView).image = UIImage(data: data)
//        }
        

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
