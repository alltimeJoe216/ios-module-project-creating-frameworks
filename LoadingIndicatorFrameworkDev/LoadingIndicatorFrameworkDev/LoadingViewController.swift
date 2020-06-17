//
//  LoadingViewController.swift
//  LoadingIndicatorFrameworkDev
//
//  Created by Marissa Gonzales on 6/17/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

open class LoadingViewController: UIViewController {
    lazy var artist = DrawCircle(withTrack: true,
                                 trackColor: UIColor.white.cgColor,
                                 radius: 20,
                                 center: view.center,
                                 clockwise: true,
                                 fillColor: UIColor.clear.cgColor,
                                 strokeColor: UIColor.green.cgColor,
                                 lineWidth: 8,
                                 view: self.view)

    var countdownTimer: Timer?
    let totalTime = 5
    var currentTime = 5

    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)

    }

    @discardableResult fileprivate func progress() -> CGFloat {
        let elapsedTime = totalTime - currentTime
        let progress = CGFloat(elapsedTime) / CGFloat(self.totalTime)
        print("\(elapsedTime)/\(totalTime): \(progress)")
        return progress
    }

    @objc func updateTime() {
        if currentTime != 0 {
            currentTime -= 1
        } else {
            endTimer()
        }
        drawProgress()
    }

    func drawProgress() {
        DispatchQueue.main.async() {
            self.artist.strokeEnd = self.progress()
            self.artist.draw()
        }

    }

    func endTimer() {
        countdownTimer?.invalidate()
        countdownTimer = nil
        self.currentTime = 0
        drawProgress()
        //timerLbl.text = "\(timeFormatted(currentTime))"
    }

    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        //let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d", seconds)
    }

    open func load(on view: UIView) {
        artist = DrawCircle(withTrack: true,
                            trackColor: UIColor.white.cgColor,
                            radius: view.frame.width / 4,
                            center: view.center,
                            clockwise: true,
                            fillColor: UIColor.clear.cgColor,
                            strokeColor: UIColor.systemGreen.cgColor,
                            lineWidth: 4,
                            view: self.view)
        artist.draw()
        self.view.layoutIfNeeded()
        self.startTimer()
    }
}
