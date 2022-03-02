//
//  TeamDetailsVC.swift
//  SportsAppITI
//
//  Created by abdrahman on 01/03/2022.
//

import UIKit
import SDWebImage

class TeamDetailsVC: UIViewController {
    
    var teamViewModel: TeamVM?
    
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamBadge: UIImageView!
    @IBOutlet weak var teamYear: UILabel!
    @IBOutlet weak var teamCountry: UILabel!
    @IBOutlet weak var teamStudium: UIImageView!
    @IBOutlet weak var teamStuduimCountry: UILabel!
    @IBOutlet weak var teamWebsiteBtn: UIButton!
    @IBOutlet weak var teamFacebookBtn: UIButton!
    @IBOutlet weak var teamWhatsAppBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let teamVM = teamViewModel else {
            return
        }
        navigationItem.title = teamVM.strTeam
        configData(teamVM)
    }
    
    func configData(_ vm: TeamVM){
        teamBadge.sd_setImage(with: URL(string: vm.strBadge), placeholderImage: UIImage(systemName: "gear"))
        teamLogo.sd_setImage(with: URL(string: vm.strBadge), placeholderImage: UIImage(systemName: "gear"))
        teamYear.text = vm.formedYear
        teamCountry.text = vm.strCountry
        teamStudium.sd_setImage(with: URL(string: vm.strTeamFanart1), placeholderImage: UIImage(systemName: "gear"))
        teamStuduimCountry.text = vm.strTeamFanart1
    }
    @IBAction func teamWebsiteBtnTapped(_ sender: Any) {
        if teamViewModel?.strWebsite != "" {
            let url = URL(string: teamViewModel!.strWebsite)
            print(url)
            guard let safeURL = url else {
                return
            }
            UIApplication.shared.open(safeURL)
            
        }else {
            print("no Website link")
            //Toast.showToast(controller: self, message: "No link found", seconds: 1)
        }
        
    }
    
    @IBAction func facebookBtnTapped(_ sender: Any) {
        if teamViewModel?.strFacebook != "" {
            let url = URL(string: teamViewModel!.strFacebook)
            print(url)
            guard let safeURL = url else {
                return
            }
            UIApplication.shared.open(safeURL)
            
        }else {
            print("no facebook link")
            //Toast.showToast(controller: self, message: "No link found", seconds: 1)
        }
    }
    @IBAction func whatsAppBtnTapped(_ sender: Any) {
    }
}
