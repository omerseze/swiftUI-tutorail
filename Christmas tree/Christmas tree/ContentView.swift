//
//  ContentView.swift
//  Christmas tree
//
//  Created by ömer  faruk sezer on 27.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isSpinning = false
    @State private var showDeer = false
    @State private var deerOffset: CGFloat = 0
    @State private var deerScale: CGFloat = 0.5
    @State private var lidOffset: CGFloat = 0
    @State private var lidRotation: Double = 0
    @State private var showLid = true
    @State private var showText = false
    @State private var textScale: CGFloat = 0.1
    
    // Custom gold color
    let goldColor = Color(red: 255/255, green: 215/255, blue: 0/255)
    
    // Colors
    let coral = Color(#colorLiteral(red: 1, green: 0.4941176471, blue: 0.4745098039, alpha: 1))
    let peach = Color(#colorLiteral(red: 1, green: 0.831372549, blue: 0.4745098039, alpha: 1))
    let lightLimeGreen = Color(#colorLiteral(red: 0.831372549, green: 0.9843137255, blue: 0.4745098039, alpha: 1))
    let springGreen = Color(#colorLiteral(red: 0.2862745098, green: 0.9803921569, blue: 0.4745098039, alpha: 1))
    let paleAqua = Color(#colorLiteral(red: 0.2862745098, green: 0.9882352941, blue: 0.8392156863, alpha: 1))
    let skyBlue = Color(#colorLiteral(red: 0.2901960784, green: 0.8392156863, blue: 1, alpha: 1))
    let softLavender = Color(#colorLiteral(red: 0.4784313725, green: 0.5058823529, blue: 1, alpha: 1))
    let electricPurple = Color(#colorLiteral(red: 0.8470588235, green: 0.5137254902, blue: 1, alpha: 1))
    let olive = Color(#colorLiteral(red: 0.5764705882, green: 0.3529411765, blue: 0, alpha: 1))
    let forestGreen = Color(#colorLiteral(red: 0, green: 0.5607843137, blue: 0, alpha: 1))
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    // Happy New Year Text
                    if showText {
                        Text("Happy New Year 2026")
                            .font(.custom("Lato-Bold", size: 24))
                            .foregroundStyle(goldColor)
                            .shadow(color: goldColor.opacity(0.9), radius: 8, x: 0, y: 0)
                            .scaleEffect(textScale)
                            .offset(y: -120)
                    }
                    
                    // Base of gift box
                    Text("📦")
                        .font(.system(size: 64))
                        .hueRotation(.degrees(isSpinning ? 0 : 150))
                        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true).delay(0.5), value: isSpinning)
                    
                    // Lid of gift box
                    if showLid {
                        Text("🎁")
                            .font(.system(size: 64))
                            .offset(y: lidOffset)
                            .rotationEffect(.degrees(lidRotation))
                            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: lidOffset)
                            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: lidRotation)
                    }
                    
                    // Deer
                    if showDeer {
                        Text("🦌")
                            .font(.system(size: 40))
                            .offset(y: deerOffset)
                            .scaleEffect(deerScale)
                    }
                }
                
                ZStack {
                    // First circle (smallest)
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 1)
                            .frame(width: 20, height: 20)
                            .foregroundStyle(coral.gradient)
                        
                        ForEach(0..<4) { index in
                            Text("✨")
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -10)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 4, height: 4)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: -160)
                    
                    // Second circle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 2)
                            .frame(width: 50, height: 50)
                            .foregroundStyle(peach.gradient)
                        
                        ForEach(0..<4) { index in
                            Text("✨")
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -25)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 6, height: 6)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.1), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: -120)
                    
                    // Third circle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(lightLimeGreen.gradient)
                        
                        ForEach(0..<4) { index in
                            Text("💫")
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -40)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 8, height: 8)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.2), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: -80)
                    
                    // Fourth circle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: 110, height: 110)
                            .foregroundStyle(springGreen.gradient)
                        
                        ForEach(0..<4) { index in
                            Circle()
                                .foregroundColor(.red)
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -55)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 8, height: 8)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.3), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: -40)
                    
                    // Fifth circle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: 140, height: 140)
                            .foregroundStyle(paleAqua.gradient)
                        
                        ForEach(0..<4) { index in
                            Circle()
                                .foregroundStyle(.red.gradient)
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -70)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 10, height: 10)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.4), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 0)
                    
                    // Sixth circle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: 170, height: 170)
                            .foregroundStyle(skyBlue.gradient)
                        
                        ForEach(0..<4) { index in
                            Circle()
                                .foregroundStyle(.red.gradient)
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -85)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 8, height: 8)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.5), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 40)
                    
                    // Seventh circle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 200, height: 200)
                            .foregroundStyle(softLavender.gradient)
                        
                        ForEach(0..<4) { index in
                            Image(systemName: "star")
                                .foregroundStyle(.red.gradient)
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -100)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.6), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 80)
                    
                    // Eighth circle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 4)
                            .frame(width: 230, height: 230)
                            .foregroundStyle(electricPurple.gradient)
                        
                        ForEach(0..<4) { index in
                            Circle()
                                .foregroundStyle(.red.gradient)
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -115)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 10, height: 10)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.7), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 120)
                    
                    // Ninth circle
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 260, height: 260)
                            .foregroundStyle(olive.gradient)
                        
                        ForEach(0..<4) { index in
                            Text("🧧")
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -130)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .frame(width: 12, height: 12)
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.8), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 160)
                    
                    // Tenth circle (largest)
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 5)
                            .frame(width: 290, height: 290)
                            .foregroundStyle(forestGreen.gradient)
                        
                        ForEach(0..<4) { index in
                            Text("💐")
                                .rotationEffect(.degrees(-45))
                                .hueRotation(.degrees(isSpinning ? Double(index) * 310 : Double(index) * 50))
                                .offset(y: -145)
                                .rotationEffect(.degrees(Double(index) * -90))
                                .rotationEffect(.degrees(isSpinning ? 0 : -180))
                                .animation(.linear(duration: 1.5).repeatForever(autoreverses: false).delay(0.9), value: isSpinning)
                        }
                    }
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: 200)
                }
            }
        }
        .phaseAnimator([false, true]) { content, chromaRotate in
            content
                .hueRotation(.degrees(chromaRotate ? 420 : 0))
        } animation: { _ in
            .easeInOut(duration: 2)
        }
        .preferredColorScheme(.dark)
        .onAppear {
            isSpinning.toggle()
            
            // Open the lid after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                lidOffset = -50
                lidRotation = -45
                
                // Hide lid after opening animation
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showLid = false
                    
                    // Show deer after lid is hidden
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        showDeer = true
                        deerOffset = -70
                        deerScale = 1.0
                        
                        // Show text after deer appears
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            showText = true
                            textScale = 1.0
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
