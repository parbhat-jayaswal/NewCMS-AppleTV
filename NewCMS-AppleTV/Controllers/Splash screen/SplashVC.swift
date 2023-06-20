//
//  SplashVC.swift
//  NewCMS
//
//  Created by Parbhat Jayaswal on 20/06/23.
//

import UIKit
import AVKit

class SplashVC: UIViewController {
    
    private var player: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        guard let path = Bundle.main.path(forResource: "FilmFliksSplash", ofType: "mp4") else {
            return
        }

        let url = URL(fileURLWithPath: path)
        player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player?.play()
        NotificationCenter.default.addObserver(self, selector: #selector(didfinishplaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)

    }

    @objc func didfinishplaying() {

        print("OKOK")
        
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
