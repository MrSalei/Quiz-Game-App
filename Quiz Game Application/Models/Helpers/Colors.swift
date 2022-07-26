//
//  Colors.swift
//  Quiz Game Application
//
//  Created by luqrri on 26.07.22.
//

import UIKit

class Colors {
    var gl: CAGradientLayer!

    init() {
        let top = UIColor(red: 0.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
        let bottom = UIColor(red: 0.0 / 255.0, green: 68.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0).cgColor
        self.gl = CAGradientLayer()
        self.gl.colors = [top, bottom]
        self.gl.locations = [0.0, 1.0]
    }
}
