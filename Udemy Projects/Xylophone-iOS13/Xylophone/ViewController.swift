//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        var title: String = sender.currentTitle ?? ""
        playSound(title: title)
    }
    
    func playSound(title: String) {
//      Guarda o som que tem salvo no arquivo (C.wav) em uma constante
        guard let url = Bundle.main.url(forResource: title, withExtension: "wav") else { return }

        do {
//          Serve para tocar o som independente se está no silencioso ou não
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

//          tira o condicional
            guard let player = player else { return }
//          Executa
            player.play()
//      caso o 'do' der erro vem para o catch
        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}

