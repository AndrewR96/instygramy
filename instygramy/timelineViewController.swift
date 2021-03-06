//
//  timelineViewController.swift
//  instygramy
//
//  Created by Andrew Rivera on 3/20/16.
//  Copyright © 2016 Andrew Rivera. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class timelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [PFObject]?
    
    @IBAction func logOut(sender: AnyObject) {
        PFUser.logOut()
        self.performSegueWithIdentifier("loginPage", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    
    func getData(){
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                print("data fetched")
                self.posts = posts
                self.tableView.reloadData()
            } else {
                print ("Error: data not fetched")
            }
        }
    }
    
    
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if posts != nil{
            return posts!.count
        }else{
            return 0
        }
    }
    
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
    let cell = tableView.dequeueReusableCellWithIdentifier("PhotoCell", forIndexPath: indexPath) as! PhotoCell
    let photo = posts![indexPath.row]
    cell.instagramPost = posts![indexPath.row]
    
    return cell
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
