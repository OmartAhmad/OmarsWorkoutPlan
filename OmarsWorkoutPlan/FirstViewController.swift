import Foundation
import UIKit

class FirstViewController: UITableViewController {
    
    var WorkoutArray = [Routine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJSONData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWP",
           let indexPath = tableView.indexPathForSelectedRow,
           let destController = segue.destination as? PlansController {
            let selectedPlan = WorkoutArray[indexPath.row]
            destController.SplitViewHT = selectedPlan
            destController.selectedPlanType = selectedPlan.PlanName.lowercased() // Assuming the plan name is "Bulking", "Cutting", or "Maintaining"
            print("Selected Routine Index: \(indexPath.row)")
            print("WorkoutArray: \(WorkoutArray)")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WorkoutArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellIndex = indexPath.row
        let WP = WorkoutArray[cellIndex]

        myCell.textLabel!.text = WP.PlanName
        myCell.detailTextLabel!.text = " \(WP.DescriptionTitle) "
        myCell.textLabel!.font = UIFont.boldSystemFont(ofSize: 20)
        myCell.textLabel!.textColor = UIColor.white

        PullImage(imageName: "https://github.com/oahmad6/JSONProjectsIT315/raw/master/Table%20Pic.jpg") { image in
            DispatchQueue.main.async {
                if let img = image {
                    myCell.imageView?.image = img
                    myCell.setNeedsLayout()
                } else {
                    print("Error: Failed to set image for cell")
                }
            }
        }

        return myCell
    }
    
    func PullImage(imageName: String, completion: @escaping (UIImage?) -> Void) {
        guard let imageUrl = URL(string: imageName) else {
            print("Invalid image URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error fetching image from URL \(imageUrl): \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            if let image = UIImage(data: data) {
                completion(image)
            } else {
                print("Error: Failed to create UIImage from image data")
                completion(nil)
            }
        }
        
        task.resume()
    }

    func getJSONData() {
        let endPointURL = URL(string: "https://raw.githubusercontent.com/oahmad6/JSONProjectsIT315/master/WorkoutPlan.json")
        
        let task = URLSession.shared.dataTask(with: endPointURL!) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let routines = dictionary["Routine"] as? [[String: Any]] {
                    var newWorkoutArray = [Routine]()
                    for routineDict in routines {
                        let routine = Routine()
                        routine.PlanName = routineDict["PlanName"] as? String ?? ""
                        routine.DescriptionTitle = routineDict["DescriptionTitle"] as? String ?? ""
                        routine.Description = routineDict["Description"] as? String ?? ""
                        newWorkoutArray.append(routine)
                    }
                    DispatchQueue.main.async {
                        self.WorkoutArray = newWorkoutArray
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        task.resume()
    }
}
