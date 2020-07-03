//
//  PlayerDetailsVC.swift
//  MarioParty
//
//  Created by Dana Meshaal Al-Munaikh on 7/3/20.
//  Copyright © 2020 Dalal Alhazeem. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerDetailsVC: UIViewController {
    var plauerSoundEffect: AVAudioPlayer?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var starsImageView: UIImageView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedPlayer.name
        imageView.image = UIImage(named: selectedPlayer.name)
        backgroundImageView.image = UIImage(named: selectedPlayer.bgName())
        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomiseStars(_ sender: UIButton) {
        var stars = ["Star1","Star2","Star3","Star4","Star5"]
        let randomiseStar = stars.randomElement()!
        starsImageView.image = UIImage(named: randomiseStar)
        
    }
    @IBAction func playCharactersSound(_ sender: UIButton) {
        playmusic(musicName: selectedPlayer.musicName())
           }
           
           func playmusic(musicName: String) {
               let path = Bundle.main.path(forResource: musicName, ofType:nil)!
               let url = URL(fileURLWithPath: path)

               do {
                   plauerSoundEffect = try AVAudioPlayer(contentsOf: url)
                   plauerSoundEffect?.play()
               } catch {
                   // couldn't load file :(
               }
           }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


