import UIKit

class BookViewController: UITableViewController {
    
    var genreTitle:String = ""
    var genreId:Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        println("genreTitle: \(self.genreTitle)")
        self.navigationController.title = genreTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("bookCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = "Hello World!"
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
    }

}
