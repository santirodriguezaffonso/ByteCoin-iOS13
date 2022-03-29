
import UIKit

class CoinViewController: UIViewController {
    
    var coinManager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
    }

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
}

//MARK: – CoinManagerDelegate –

extension CoinViewController: CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.sync {
            valueLabel.text = price
            currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

//MARK: – UIPickerView DataSource & Delegate –

extension CoinViewController: UIPickerViewDataSource {
   
    // This code lines will determinate how many columns should have our PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // This code lines will determinate how many rows should have our PickerView
    // In this case we're using currencyArray directly
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}


extension CoinViewController: UIPickerViewDelegate {
    
    // This method will ask to delegate for a "row title", in this case "func pickerView(: numberOfRowInComponent..."
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
        
    }
    // This method will give you and output from UIPickerView "(: didSelectRow" to use what was selected
    // in this case we call a fucn with an input, dont miss that
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}
