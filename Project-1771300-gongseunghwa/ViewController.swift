//
//  ViewController.swift
//  Project-1771300-gongseunghwa
//
//  Created by mac003 on 2022/06/12.
//

import UIKit

class ViewController: UIViewController {
    var id : String = ""
    let baseURLString = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name"
    let apiKey = "RGAPI-b99d6eaa-6f60-4b3a-ab7e-4ec2b8fa41b9"

    @IBOutlet weak var summonerName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func onClickSearch(_ sender: UIButton) {
        let input = summonerName!.text
        getUserData(summonerName: input)
        sleep(1)
        self.performSegue(withIdentifier: "searchResult", sender: self)
    }
}

extension ViewController{
    func getUserData(summonerName :String!){
        var urlStr = baseURLString+"/"+summonerName+"?api_key="+apiKey
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let session = URLSession(configuration: .default)
        let url = URL(string: urlStr)
        let request = URLRequest(url: url!)
        
        let dataTask = session.dataTask(with: request){
            (data,response,error) in
            guard let jsonData = data else{print(error!); return}
            if let jsonStr = String(data:jsonData, encoding: .utf8){
                print(jsonStr)
            }
            self.id = self.getPuuid(jsonData:jsonData)
            print("=======================")
            print(self.id)
        }
        dataTask.resume()
        
    }
}

extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultController = segue.destination as? ResultController else {return}
        
        resultController.labelString = self.id
    }
}

extension ViewController{
    func getPuuid(jsonData: Data) ->(String){
        let json = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
        
        let puuid = json["puuid"] as! String
        
        return puuid
    }
}

