
import Foundation

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "405D3920-A6C4-491D-B1D7-02821C7CFEE9"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
//                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                let dataAsString = String(data: data!, encoding: .utf8)
                print(dataAsString)
//                if let safeData = data {
//                    if let weather = self.parseJSON(safeData) {
//                        delegate?.didUpdateWeather(self, weather: weather)
//                    }
//                }
            }
            task.resume()
        }
    }
    
    
}
