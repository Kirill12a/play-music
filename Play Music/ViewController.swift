//
//  ViewController.swift
//  Play Music
//
//  Created by Kirill Drozdov on 14.06.2021.
//
import  AVFoundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttin: UIButton!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapButton(){
        if let player = player, player.isPlaying{
            //stop
//            buttin.setImage(UIImage(named: <#T##String#>), for: <#T##UIControl.State#>)
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
            
        }
    }
}

