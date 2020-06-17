//
//  DrawCircle.swift
//  LoadingIndicatorFrameworkDev
//
//  Created by Marissa Gonzales on 6/17/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

class DrawCircle {
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    let center: CGPoint
    let radius: CGFloat
    let startAngle: CGFloat
    let endAngle: CGFloat
    let clockwise: Bool

    let fillColor: CGColor
    let strokeColor: CGColor
    let lineWidth: CGFloat
    var strokeEnd: CGFloat
    let view: UIView
    let circularPath: UIBezierPath
    let withTrack: Bool
    var trackColor: CGColor

    init(withTrack: Bool,
                trackColor: CGColor,
                radius: CGFloat,
                center: CGPoint,
                clockwise: Bool,
                fillColor: CGColor,
                strokeColor: CGColor,
                lineWidth: CGFloat,
                view: UIView) {
        //path params
        self.center = center
        self.radius = radius
        self.startAngle =  -CGFloat.pi / 2
        self.endAngle = 1.5 * CGFloat.pi
        self.clockwise = clockwise
        self.circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        //shape params
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.strokeEnd = 0
        self.lineWidth = lineWidth

        //view to attach to
        self.view = view
        self.withTrack = withTrack
        if withTrack {
            self.trackColor = trackColor
        } else {
            self.trackColor = UIColor.clear.cgColor
        }
    }

    func draw() {
        if withTrack {
            drawTrack()
        }
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = strokeColor
        shapeLayer.fillColor = fillColor
        shapeLayer.lineWidth = self.lineWidth
        shapeLayer.strokeStart = startAngle
        shapeLayer.strokeEnd = self.strokeEnd
        shapeLayer.lineCap = .round
        view.layer.addSublayer(shapeLayer)
    }

    private func drawTrack() {
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = trackColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = self.lineWidth
        trackLayer.lineCap = .round
        view.layer.addSublayer(trackLayer)
    }

}

