
import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billLabel: UITextField!

    @IBOutlet weak var zeroPercentTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    
    @IBOutlet weak var splitLabel: UILabel!

    @IBOutlet weak var splitVal: UIStepper!
    
    var tipVal = 0.1
    var totalPeople = 2
    var strVal:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func percentPressed(_ sender: UIButton) {
        
        billLabel.endEditing(true)
        zeroPercentTip.isSelected = false
        tenPercentTip.isSelected = false
        twentyPercentTip.isSelected = false
        sender.isSelected = true
        tipVal = Double(sender.tag)/100.0
    }
    
    
    
    @IBAction func splitAdder(_ sender: UIStepper) {
        splitLabel.text = String(Int(sender.value))
        totalPeople = Int(splitLabel.text ?? "2") ?? 2
    }
    
    
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let cost = Double(billLabel.text ?? "0")
        let costVal = ((cost ?? 0)+((cost ?? 0) * tipVal))
        let splittedValue = costVal/Double(totalPeople)
        strVal = String(format: "%0.2f",splittedValue)
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculatedVariable = strVal ?? "0.0"
            destinationVC.totalPeople = totalPeople 
            destinationVC.tipVal = tipVal
        }
    }
    

}

