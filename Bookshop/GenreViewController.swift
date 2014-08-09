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
        
        if let genres = self.genreList {
            return genres.count
        }
        else {
            return 0
        }
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        
        if let genres = self.genreList as? [NSDictionary] {
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("GenreCell", forIndexPath: indexPath) as UITableViewCell
            var item = genres[indexPath.row]
            println("item: \(item)")
            cell.textLabel.text = item["title"] as String
            return cell
        }
        else {
            return nil
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.identifier == "genreSegue" {
            println("genreSegue")
            let indexPath = self.tableView.indexPathForSelectedRow()
            println("row: \(indexPath.row)")
            var bookView:BookViewController = segue.destinationViewController as BookViewController
            
            if let genres = self.genreList as? [NSDictionary] {
                var item = genres[indexPath.row]
                println("segueItem: \(item)")
                let title:String = item["title"] as String
                let genreId:Int = item["id"] as Int  // this line crashes the app
                println("title: \(title)")
                bookView.genreTitle = item["title"] as String
                //bookView.genreId = item["id"] as Int  // so I can't test this line
            }
        }
    }

}
