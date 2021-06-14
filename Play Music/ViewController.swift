//
//  ViewController.swift
//  Play Music
//
//  Created by Kirill Drozdov on 14.06.2021.
//
import  AVFoundation
import UIKit

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet var buttin: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player?.numberOfLoops = 0
        player?.delegate = self
        
    }
    
    @IBAction func didTapButton(){
        if let player = player, player.isPlaying{
            //stop
            buttin.setImage(UIImage(systemName: "stop.fill"), for: .normal)
            player.stop()
          
        }else{
            
            buttin.setImage(UIImage(systemName: "play.fill"), for: .normal)
            let urlString = Bundle.main.path(forResource: "audio", ofType: "mp3")
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                guard let urlString = urlString else {
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                guard let player = player else {
                    return
                }
                player.play()
            }
            catch {
                print("что-то пошло не так")
            }
            
            ///
            audioPlayerDidFinishPlaying(player!, successfully: false)
            ///
        }
    }
    @IBAction func minVolume(_ sender: Any) {
//        player?.volume = 0.1
        for i in 0...10{
            player?.volume -= 0.1
        }
    }
    @IBAction func maxVolume(_ sender: Any) {
//        player?.volume = 1
        
        for i in 1...10{
            player?.volume += 0.1
        }
    }
    
    
    
    
    ////
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("Stop")
        player.play()
    }
    
    
    
}



