//
//  DrawPendulum.swift
//  Pendulum
//
//  Created by techmaster on 5/24/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit
class Pedulum {
    var conlax: UIImageView!
    var cat: UIImageView!
    
    func pedulum1() {
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

}
