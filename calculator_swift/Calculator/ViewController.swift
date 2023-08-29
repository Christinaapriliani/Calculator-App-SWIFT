import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var operation = ""
    var isPerformingOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        if let numString = sender.titleLabel?.text {
            if isPerformingOperation {
                resultLabel.text = numString
                isPerformingOperation = false
            } else {
                if resultLabel.text == "0" {
                    resultLabel.text = numString
                } else {
                    resultLabel.text! += numString
                }
            }
            currentNumber = Double(resultLabel.text!) ?? 0
        }
    }

    @IBAction func operationButtonTapped(_ sender: UIButton) {
        if let op = sender.titleLabel?.text {
            operation = op
            previousNumber = currentNumber
            isPerformingOperation = true
        }
    }

    @IBAction func equalsButtonTapped(_ sender: UIButton) {
        switch operation {
        case "+":
            currentNumber = previousNumber + currentNumber
        case "-":
            currentNumber = previousNumber - currentNumber
        case "×":
            currentNumber = previousNumber * currentNumber
        case "÷":
            currentNumber = previousNumber / currentNumber
        default:
            break
        }
        resultLabel.text = String(currentNumber)
        operation = ""
        previousNumber = 0
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        resultLabel.text = "0"
        currentNumber = 0
        previousNumber = 0
        operation = ""
    }


    
}
