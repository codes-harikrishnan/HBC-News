//
//  Speaker.swift
//  HBC News
//
//  Created by Harikrishnan on 04/11/2021.
//

import Foundation
import AVKit

final class Speaker: NSObject, ObservableObject {
    
    @Published var state: State = .inactive
    var speechCompleted: (() -> Void)? = nil
    
    enum State: String {
        case inactive, speaking, paused
    }

    override init() {
        super.init()
        
        synth.delegate = self
    }
    
    func speak(words: String, completed: @escaping () -> Void) {
        speechCompleted = completed
        
        synth.speak(draftSpeech(speech:words))
    }
    
    func draftSpeech(speech : String) -> AVSpeechUtterance {
        let utterance = AVSpeechUtterance(string:speech)
        let voice = AVSpeechSynthesisVoice(language: Configuration.shared.speakingLanguage)
        utterance.voice = voice
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate;
        utterance.pitchMultiplier = 0.5
        utterance.preUtteranceDelay = 2
        return utterance
    }
    
     let synth: AVSpeechSynthesizer = .init()
    
}

extension Speaker: AVSpeechSynthesizerDelegate {
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        self.state = .speaking
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        self.state = .paused
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.state = .inactive
        if let speechCompleted = self.speechCompleted {
            speechCompleted()
        }
    }
    
}
