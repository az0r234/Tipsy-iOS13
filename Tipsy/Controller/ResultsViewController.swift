
import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    var calculatedVariable: String? = nil
    var totalPeople: Int? = nil
    var tipVal: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = calculatedVariable
        overViewLabel.text = "Split between \(totalPeople ?? 0) with \n\(Int(100*(tipVal ?? 0.0)))% tip"
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
