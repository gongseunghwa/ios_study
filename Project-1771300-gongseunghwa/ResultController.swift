//
//  ResultController.swift
//  Project-1771300-gongseunghwa
//
//  Created by mac003 on 2022/06/12.
//

import UIKit
import Kingfisher

class ResultController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    let apiKey = "RGAPI-b99d6eaa-6f60-4b3a-ab7e-4ec2b8fa41b9"
    let baseURLString = "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/"
    var labelString :String = ""
    var matchList : MatchList = []
    var resultList : [Match] = []
    var gameList : [MatchParticipant] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print("=====resultcontroller======")
        print(labelString)
        /// matchList 를 가져오기
        getMatchList(matchId: labelString)
        sleep(1)
        /// 가져온 matchList로 루프를 돌면서 gameList를 가져오기
        for match in matchList{
            getGameList(matchId: match)
        }
        sleep(1)
        
        resultList = resultList.sorted(by: {$0.info.gameCreation > $1.info.gameCreation})
        
        for game in resultList{
            for part in game.info.participantsInfo{
                if(part.puuid == self.labelString){
                    gameList.append(part)
                }
            }
        }

//        let imageUrl = URL(string: "https://ddragon.leagueoflegends.com/cdn/10.18.1/img/profileicon/6.png")
//        image.kf.setImage(with: imageUrl)
        self.tableView.rowHeight = 150
        tableView.delegate = self
        tableView.dataSource = self


    }
    

}

extension ResultController{
    func getMatchList(matchId : String!){
        var urlStr = baseURLString + labelString + "/ids?start=0&count=20&api_key=" + apiKey
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let session = URLSession(configuration: .default)
        let url = URL(string: urlStr)
        let request = URLRequest(url: url!)
        
        let dataTask = session.dataTask(with: request){ [self]
            (data,response,error) in
            guard let jsonData = data else{print(error!); return}

            if let jsonStr = String(data:jsonData, encoding: .utf8){
                print(jsonStr)
            }
            
            let decoder = JSONDecoder()
            do{
                let out = try decoder.decode(MatchList.self, from:jsonData)
                self.matchList = out
                print(matchList.count)
            }catch{
                print(error)
            }
        }
        dataTask.resume()
    }
}
extension ResultController{
    func getGameList(matchId : String){
        var urlStr = "https://asia.api.riotgames.com/lol/match/v5/matches/" + matchId + "?api_key=" + apiKey
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let session = URLSession(configuration: .default)
        let url = URL(string: urlStr)
        let request = URLRequest(url: url!)
        
        let dataTask = session.dataTask(with: request){
            (data,response,error) in
            guard let jsonData = data else{print(error!); return }
            let decoder = JSONDecoder()
            do{
                let out = try decoder.decode(Match.self, from:jsonData)

                self.resultList.append(out)

                print(self.resultList.count)
            }catch{
                print(error)
            }
        }
        
        dataTask.resume()
    }
}

extension ResultController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gameList.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "result_cell") else{
            fatalError("No given type sell")
        }
        
        (cell.contentView.subviews[0] as! UILabel).text = "솔랭"
        if(gameList[indexPath.row].win){
            (cell.contentView.subviews[1] as! UILabel).text = "승리"
            cell.backgroundColor = UIColor.blue.withAlphaComponent(0.8)
        }else{
            (cell.contentView.subviews[1] as! UILabel).text = "패배"
            cell.backgroundColor = UIColor.red.withAlphaComponent(0.8)
        }
        (cell.contentView.subviews[2] as! UILabel).text = String(gameList[indexPath.row].timePlayed/100) + ":" + String(gameList[indexPath.row].timePlayed%100)
        let urlStr = "https://ddragon.leagueoflegends.com/cdn/12.7.1/img/champion/" + gameList[indexPath.row].championName + ".png"
//        print("====================")
//        print(urlStr)
        let imageUrl = URL(string: urlStr)
        (cell.contentView.subviews[3] as! UIImageView).kf.setImage(with: imageUrl)
        
        let urlStr2 = "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/item/" + String(gameList[indexPath.row].item0) + ".png"
        let imageUrl2 = URL(string: urlStr2)
        (cell.contentView.subviews[4] as! UIImageView).kf.setImage(with: imageUrl2)
        
        let urlStr3 = "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/item/" + String(gameList[indexPath.row].item1) + ".png"
                let imageUrl3 = URL(string: urlStr3)
                (cell.contentView.subviews[5] as! UIImageView).kf.setImage(with: imageUrl3)
        
        let urlStr4 = "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/item/" + String(gameList[indexPath.row].item2) + ".png"
                let imageUrl4 = URL(string: urlStr4)
                (cell.contentView.subviews[6] as! UIImageView).kf.setImage(with: imageUrl4)
        
        let urlStr5 = "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/item/" + String(gameList[indexPath.row].item3) + ".png"
                let imageUrl5 = URL(string: urlStr5)
                (cell.contentView.subviews[7] as! UIImageView).kf.setImage(with: imageUrl5)
        
        let urlStr6 = "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/item/" + String(gameList[indexPath.row].item4) + ".png"
                let imageUrl6 = URL(string: urlStr6)
                (cell.contentView.subviews[8] as! UIImageView).kf.setImage(with: imageUrl6)
        
        let urlStr7 = "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/item/" + String(gameList[indexPath.row].item5) + ".png"
                let imageUrl7 = URL(string: urlStr7)
                (cell.contentView.subviews[9] as! UIImageView).kf.setImage(with: imageUrl7)
        
        let urlStr8 = "https://ddragon.leagueoflegends.com/cdn/12.11.1/img/item/" + String(gameList[indexPath.row].item6) + ".png"
                let imageUrl8 = URL(string: urlStr8)
                (cell.contentView.subviews[10] as! UIImageView).kf.setImage(with: imageUrl8)
        (cell.contentView.subviews[11] as! UILabel).text = String(gameList[indexPath.row].kills) + "/" + String(gameList[indexPath.row].deaths) + "/" + String(gameList[indexPath.row].assists)
        
        if(gameList[indexPath.row].deaths == 0){
            (cell.contentView.subviews[12] as! UILabel).text = "Perfect"
        }else{
            (cell.contentView.subviews[12] as! UILabel).text = String(Float(gameList[indexPath.row].kills + gameList[indexPath.row].assists) / Float(gameList[indexPath.row].deaths))
        }


        return cell
    }
}

typealias MatchList = [String]

