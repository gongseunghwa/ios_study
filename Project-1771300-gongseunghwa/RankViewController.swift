//
//  RankViewController.swift
//  Project-1771300-gongseunghwa
//
//  Created by mac003 on 2022/06/13.
//

import UIKit

class RankViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var hello :[LeagueItemDTO] = []
    let baseURLString = "https://kr.api.riotgames.com/lol/league/v4/challengerleagues/by-queue/RANKED_SOLO_5x5"
//    ?api_key=RGAPI-b99d6eaa-6f60-4b3a-ab7e-4ec2b8fa41b9"
    let apiKey = "RGAPI-b99d6eaa-6f60-4b3a-ab7e-4ec2b8fa41b9"

    override func viewDidLoad() {
        super.viewDidLoad()
        getRankData()
        sleep(1)
//        hello = hello.sorted(by: {$0.leaguePoints > $1.leaguePoints} )
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
}

extension RankViewController{
    func getRankData(){
        var urlStr = baseURLString + "?api_key=" + apiKey
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let session = URLSession(configuration: .default)
        let url = URL(string: urlStr)
        let request = URLRequest(url: url!)
        
        let dataTask = session.dataTask(with: request){
            (data,response,error) in
            guard let jsonData = data else{print(error!); return}
//            if let jsonStr = String(data:jsonData, encoding: .utf8){
//                print(jsonStr)
//            }
            let decoder = JSONDecoder()
            do{
                let decodeData = try decoder.decode(Hello.self,from: jsonData)
//                print(decodeData)
//                for entri in decodeData.entries{
//                    print(decodeData.tier + " " + entri.rank)
//                }
                let a = decodeData.entries.sorted(by: {$0.leaguePoints > $1.leaguePoints} )
                self.hello = a
            }catch{
                print(error)
            }
            
        }
        dataTask.resume()
        
    }
}

extension RankViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int{
        return self.hello.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableview_cell") else{
            fatalError("not exist cell")
        }
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.black.cgColor
//        cell.textLabel?.text = hello[indexPath.row].summonerName
        (cell.contentView.subviews[0] as! UILabel).text = String(indexPath.row + 1)
        (cell.contentView.subviews[1] as! UILabel).text = hello[indexPath.row].summonerName
        (cell.contentView.subviews[2] as! UILabel).text = "Callenger " + hello[indexPath.row].rank
        (cell.contentView.subviews[3] as! UILabel).text = String(hello[indexPath.row].leaguePoints)
        if(hello[indexPath.row].leaguePoints > 1500){
            cell.backgroundColor = UIColor.systemBlue
        }else if(hello[indexPath.row].leaguePoints > 1200){
            cell.backgroundColor = UIColor.lightGray
        }else if(hello[indexPath.row].leaguePoints < 800){
            cell.backgroundColor = UIColor.systemRed
        }
        
        return cell
    }
    
    
    
}
