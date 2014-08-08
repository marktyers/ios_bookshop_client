//
//  Bookshop.swift
//  Bookshop
//
//  Created by Mark Tyers on 08/08/2014.
//  Copyright (c) 2014 Coventry University. All rights reserved.
//

import Foundation

class Bookshop {
    class func getGenres(completionHandler: (genres: NSArray) -> ()) {
        //println("Hello inside getGenres")
        let urlPath = "http://creative.coventry.ac.uk/~bookshop/v1.1/index.php/genre/list"
        //println(urlPath)
        let url: NSURL = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        var resultsArray:NSArray!
        let task = session.dataTaskWithURL(url) {
            data, response, error in
            //println("Task completed")
            if(error) {
                println(error.localizedDescription)
            }
            //println("no error")
            var err: NSError?
            var options:NSJSONReadingOptions = NSJSONReadingOptions.MutableContainers
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: options, error: &err) as NSDictionary
            if(err != nil) {
                println("JSON Error \(err!.localizedDescription)")
            }
            //NSLog("jsonResults %@", jsonResult)
            let results: NSArray = jsonResult["genres"] as NSArray
            //NSLog("jsonResults %@", results)
            //resultsArray = results
            //println("calling completion handler")
            completionHandler(genres: results)
        }
        task.resume()
    }
    
}