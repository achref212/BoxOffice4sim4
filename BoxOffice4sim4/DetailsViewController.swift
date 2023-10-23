//
//  DetailsViewController.swift
//  BoxOffice4sim4
//
//  Created by Mac Mini 9 on 23/10/2023.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {
    var movieName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(named: movieName!)
        filName.text = movieName!
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var filName: UILabel!
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func addtoFavorite(_ sender: Any) {
        
        insertItem()
    }
    func insertItem(){
        /*
         0- add the entity and atrtrubutes in xcdatamodeld
         1- Define appDelegate
         2- Define persistantContainer (ORM)
         3- define managedContext (data copy)
         4- define entityDescreption (identity schema)
         5- Define an object NSManagedObject (Copie it s an array of NSManagedObject for insert sth i have to save same type )
         6- object.setValue
         7- managedContext.save()
         */
        if !checkMovie(){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let persistantContainer = appDelegate.persistentContainer
            let managedContext = persistantContainer.viewContext //copie of data
            
            let entityDescreption = NSEntityDescription.entity(forEntityName: "Film", in: managedContext)  //call entity declared in boxOffice.xcdatamodeld forEntityName: "Movie" get list of attrubites and place in managedContext
            let object  = NSManagedObject(entity: entityDescreption!, insertInto: managedContext)
            
            object.setValue(movieName!, forKey: "name")
            
            do {
                
                try managedContext.save()
                
                print("INSERT good")
                
            } catch  {
                print("INSERT failed")
            }
            
        }
        else
        {print("erreur") }
        
    }
    func checkMovie()->Bool{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistantContainer = appDelegate.persistentContainer
        let managedContext = persistantContainer.viewContext //copie of data
        let request = NSFetchRequest<NSManagedObject>(entityName: "Film")
        let predicate = NSPredicate(format: "name == %@",movieName!)
        request.predicate=predicate
        do{
            let  result = try managedContext.fetch(request)
            
            if result.count>1{print("Entities with name found.")
                return true
            } else {
                print("No entities with name found.")
                return false
            }
        }catch{
            print("Fetch failed")
            return false
        }
        
        
    }
}
