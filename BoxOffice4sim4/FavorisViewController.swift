//
//  FavorisViewController.swift
//  BoxOffice4sim4
//
//  Created by Mac Mini 9 on 23/10/2023.
//

import UIKit
import CoreData

class FavorisViewController: UIViewController ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Favoris.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let cv =  cell?.contentView
        let label = cv?.viewWithTag(2)as! UILabel
        let image = cv?.viewWithTag(1)as! UIImageView
        
        label.text=Favoris [indexPath.row]
        image.image=UIImage(named: Favoris[indexPath.row])
        return cell!
    }
    
    var Favoris=[String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItem()
        // Do any additional setup after loading the view.
    }
    
   
    func fetchItem(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistantContainer = appDelegate.persistentContainer
        let managedContext = persistantContainer.viewContext //copie of data
        
        //fetchRequest<Favorie>
        let data = NSFetchRequest<NSManagedObject> (entityName:"Film")
        //try
        //boucle
        do{
            let result = try managedContext.fetch(data)
            for item in result{
                Favoris.append(item.value(forKey: "name")as! String)
            }
        }catch{
            print("ERROR")
        }
    }
    
    func predicate(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let persistantContainer = appDelegate.persistentContainer
        let managedContext = persistantContainer.viewContext //copie of data
        //fetchRequest
        //predicate("name@=")
        //data= predicate = predicate
        //result = managedconted.fetch(data)
        //if(result.cont>1
       // return true
        //else
        //return false
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
