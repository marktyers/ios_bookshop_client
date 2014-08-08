import UIKit

class GenreViewController: UITableViewController {
    
    var genreList:NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        Bookshop.getGenres {
            genres in
                self.genreList = genres // copies data to the public NSArray
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData() // this returns the data async so need to reload the tableview
                println("records: \(self.genreList?.count)") // displays the array of dictionaries correctly
            }
            
        }
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if self.genreList != nil {
            println("Rows in section: \(self.genreList?.objectAtIndex(0))")
            return self.genreList.count
        }
        return 3
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("GenreCell", forIndexPath: indexPath) as UITableViewCell
        
        if genreList != nil {
            var item = self.genreList[indexPath.row] as NSDictionary
            dump(item) // just to show the dictionary in this scenario
            cell.textLabel.text = item["title"] as String
        }
        else {
            cell.textLabel.text = "Loading..."
        }
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
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
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
