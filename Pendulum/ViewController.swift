//
//  ViewController.swift
//  Pendulum
//
//  Created by techmaster on 5/23/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var conlax: UIImageView!
    var oclock: UIImageView!
    var hour: UIImageView!
    var second: UIImageView!
    var minute:UIImageView!
    var time: Timer!
    var kimS: CGFloat!
    var kimM: CGFloat!
    var kimH: CGFloat!
    var cat: UIImageView!
    var audioPlayer = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                                                                    //timer giay
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeS), userInfo: nil, repeats: true)
                                                                    //timer phut
        time = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(changeM), userInfo: nil, repeats: true)
                                                                    //timer gio
        time = Timer.scheduledTimer(timeInterval: 720, target: self, selector: #selector(changeH), userInfo: nil, repeats: true)
        kimS = CGFloat(M_PI_2)
        kimM = CGFloat(M_PI_4)
        kimH = CGFloat(0)
        pedulum()
        run()
        clock()
        hours()
        minutes()
        seconds()
        playSong()
    }
    
                                                                //Con lac
    func pedulum() {
        conlax = UIImageView(frame: CGRect(x: 175,y: 220,width: 50,height: 200))
        conlax.image = UIImage(named: "123.png")
        conlax.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        conlax.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        view.addSubview(conlax)
                                                                //Chim
        cat = UIImageView(frame: CGRect(x: 185,y: 580,width: 40,height:40))
        cat.image = UIImage(named: "2.jpeg")
        self.cat.alpha = 0
        view.addSubview(cat)
    }

                                                                //Chay con lac,chim
    func run() {
        UIView.animate(withDuration: 1, animations: {
            self.conlax.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.cat.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.cat.alpha = 0
        })  { (complete) in
            UIView.animate(withDuration: 1, animations: {
                self.conlax.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_4))
                self.cat.transform = CGAffineTransform(scaleX: 4.0, y: 4.0)
                self.playSong()
                self.cat.alpha = 1
            })
            { (complete) in
//                UIView.animate(withDuration: 3, animations: {
//                    self.conlax.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
                    self.run()
            //})
            
            }

        }
    }
    
    
    
    
                                                            //Dong ho
    func clock() {
        oclock = UIImageView(frame: CGRect(x: 100,y: 125,width: 200,height:200))
        oclock.image = UIImage(named: "1.png")
        view.addSubview(oclock)
        
            }
                                                            //Kim gio
    func hours() {
        hour = UIImageView(frame: CGRect(x: 189,y: 199 ,width: 25,height: 50 ))
        hour.image = UIImage(named: "hours")
        hour.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        hour.transform = CGAffineTransform(rotationAngle: CGFloat(0))
        view.addSubview(hour)
    }
    
                                                            //Kim phut
    func minutes(){
        minute = UIImageView(frame: CGRect(x: 190 ,y: 195,width: 20,height: 60))
        minute.image = UIImage(named: "miunutes")
        minute.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        minute.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
        view.addSubview(minute)
    }
    
                                                            //Kim giay
    func seconds() {
        second = UIImageView(frame: CGRect(x: 192,y: 193,width: 15,height: 65))
        second.image = UIImage(named:"seconds")
        second.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        second.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
        view.addSubview(second)
    }
    
                                                            //Chay kim giay
    func changeS() {
        kimS = kimS + CGFloat.pi/30
        self.second.transform = CGAffineTransform(rotationAngle: kimS)
        
    }
    
                                                            //Chay kim phut
    func changeM() {
        kimM = kimM + CGFloat.pi/30
        self.minute.transform = CGAffineTransform(rotationAngle: kimM)
    }
    
                                                            //Chay kim gio
    func changeH() {
        kimH = kimH + CGFloat.pi/30
        self.hour.transform = CGAffineTransform(rotationAngle: kimH)
    }
                                                            //mp3
    func playSong()
    {
        let filePath = Bundle.main.path(forResource: "ring", ofType: ".mp3")
        let url = URL(fileURLWithPath: filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer.stop()
    }

    
}


