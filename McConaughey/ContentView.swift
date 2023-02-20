//
//  ContentView.swift
//  McConaughey
//
//  Created by Andy Jung on 2/20/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var stepperValue = 1
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack {
            
            Text("How is Matt?")
                .font(.largeTitle)
                .fontWeight(.black)
            
            
            Image("matt")
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
            
            Spacer()
            
            Stepper("How Alright is Matt?", value: $stepperValue, in: 1...5)
                .font(.title2)
            
            Text("\(stepperValue)")
                .font(.largeTitle)
            
            Button("Tell me!"){
                playSound(soundName: "alright")
            }
            .buttonStyle(.bordered)

            Spacer()
            
        }
        .padding()
    }
    func playSound(soundName: String){
        guard let soundFile = NSDataAsset(name: soundName)else{
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.numberOfLoops = stepperValue - 1
            audioPlayer.play()
        }catch{
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
