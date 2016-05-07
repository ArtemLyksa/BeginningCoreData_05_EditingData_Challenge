/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit
import CoreData

class DebugViewController: UIViewController {
  var managedObjectContext: NSManagedObjectContext!

  @IBAction func unassignAllTapped(sender: AnyObject) {
    
    let fetchRequest = NSFetchRequest(entityName: "Devices")
    fetchRequest.predicate = NSPredicate(format: "owner != nil")
    
    do {
        if let results = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Device] {
            for device in results {
                device.owner = nil
            }
            
            try managedObjectContext.save()
            
            let alertVC = UIAlertController(title: "Update secceeded!", message: "\(results.count) devices unassigned", preferredStyle: .Alert)
            
            alertVC.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
            presentViewController(alertVC, animated: true, completion: nil)
        }
        
    } catch {
        
        let alertVC = UIAlertController(title: "Update failed!", message: "There was an error while trying to unassigned", preferredStyle: .Alert)
        
        alertVC.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(alertVC, animated: true, completion: nil)
    }

  }

  @IBAction func deleteAllTapped(sender: AnyObject) {
    
  }
  
}
