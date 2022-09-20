//
//  ContentView.swift
//  EduTainment
//
//  Created by Tony Vu on 10/13/21.
//

import SwiftUI

struct Question {
    var firstNumber: Int
    var secondNumber: Int
    var answer: Int
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

struct ContentView: View {
    @State private var playingGame = false
    
    // Game variables
    @State private var questionsArray = [Question]()
    @State private var currentQuestion = 0
    @State private var input = ""
    @State private var score = 0
    
    @State private var correctAnswer = false
    @State private var wrongAnswer = false
    @State private var hasAnswered = false
    @State private var allowPoints = true
    @State private var stillPlaying = false
    
    @State private var showGame = true
    
    
    // Settings variables
    @State private var multiplicationIndex = 1
    @State private var questionCountIndex = "5"
    
    let questionCountOptions = ["5", "10", "20", "All"]
    
    var chosenQuestionCount: Int {
        if questionCountIndex == "All" {
            return multiplicationIndex * 12
        } else {
            return Int(questionCountIndex) ?? 0
        }
    }
    
    
    var body: some View {
        NavigationView {
            ZStack {
                    if playingGame {
                    // Game block
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [.pink, .purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .edgesIgnoringSafeArea(.all)
                            if stillPlaying {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Question \(currentQuestion + 1) / \(chosenQuestionCount)")
                                        .font(.title)
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                    
                                    VStack(alignment: .leading) {
                                        HStack(spacing: 0) {
                                            Text("What's ")
                                                .font(.system(size: 30))
                                                .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 50, alignment: .center)
                                            
                                            Text("\(questionsArray[currentQuestion].firstNumber)")
                                                .font(.system(size: 30).bold())
                                                .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 50, alignment: .center)
                                                .foregroundColor(Color.yellow)
                                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.yellow, lineWidth: 1))
                                            
                                            Text(" x ")
                                                .font(.system(size: 30).bold())
                                                .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 50, alignment: .center)
                                                .foregroundColor(Color.white)
                                            
                                            Text("\(questionsArray[currentQuestion].secondNumber)")
                                                .font(.system(size: 30))
                                                .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 50, alignment: .center)
                                                .foregroundColor(Color.blue)
                                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                                            
                                            Text("?")
                                                .font(.system(size: 30))
                                                .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 50, alignment: .center)
                                        }
                                        .padding(.leading)
                                        .padding(.top)
                                        
                                        HStack (spacing: 0){
                                            TextField("", text: $input)
                                                .font(.system(size: 30))
                                                .foregroundColor(.orange)
                                                .keyboardType(.decimalPad)
                                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
                                                .foregroundColor(Color.orange)
                                                .background(Color.white)
                                                .cornerRadius(10, corners: [.topLeft, .bottomLeft])
                                            
                                            Button(action: checkAnswer) {
                                                Text("Check")
                                            }
                                            .font(.system(size: 30))
                                            .frame(minWidth: 0, maxWidth: 120, minHeight: 0, maxHeight: 50, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(Color.orange)
                                            .cornerRadius(10, corners: [.topRight, .bottomRight])
                                        }
                                        .padding()
                                    }
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: .center)
                                    .foregroundColor(Color.white)
                                    .background(Color.white.opacity(0.3))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    HStack(spacing: 12) {
                                        ZStack {
                                            Text("""
                                                 Correct 🥳
                                                 You get
                                                 1 point!
                                                 """)
                                                    .font(.system(size: 30))
                                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: .center)
                                                    .foregroundColor(correctAnswer ? Color.white : Color.clear)
                                                    .background(correctAnswer ? Color.green.opacity(0.8) : Color.clear)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                                 
                                            Text("""
                                                Wrong 😥
                                                Try again!
                                                """)
                                                    .font(.system(size: 30))
                                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: .center)
                                                    .foregroundColor(wrongAnswer ? Color.white : Color.clear)
                                                    .background(wrongAnswer ? Color.red.opacity(0.8) : Color.clear)
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                        }
                                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200, alignment: .center)
                                        .background(Color.white.opacity(0.3))
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                        VStack(spacing: 0) {
                                            VStack {
                                                Text("Current score:")
                                                        .font(.system(size: 25))
                                                Text("\(score)")
                                                        .font(.system(size: 30))
                                                        .frame(minWidth: 0, maxWidth: 50, minHeight: 0, maxHeight: 50, alignment: .center)
                                                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                                                        .padding(.bottom, 5)
                                                        
                                            }
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(Color.white.opacity(0.3))
                                            .cornerRadius(10, corners: [.topLeft, .topRight])
                                            
                                            Button(action: nextQuestion) {
                                                withAnimation {
                                                    Text(allowPoints ? "Skip" : "Next")
                                                }
                                            }
                                            .font(.system(size: 30))
                                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .center)
                                            .foregroundColor(Color.white)
                                            .background(Color.orange)
                                            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .padding()
                            } else {
                                VStack (spacing: 15){
                                    Text("\(endTitle(score))")
                                        .font(.title)
                                    Text("Your final score is \(score).")
                                        .font(.title2)
                                    Button("Let's play again!") {
                                        self.score = 0
                                        self.currentQuestion = 0
                                        
                                        withAnimation {
                                            self.playingGame.toggle()
                                        }
                                    }
                                    .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 50, alignment: .center)
                                    .foregroundColor(Color.white)
                                    .background(Color.orange)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .offset(y: 25)
                                }
                                .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 300, alignment: .center)
                                .foregroundColor(Color.white)
                                .background(Color.white.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .offset(y: -40)
                            }
                        }
                } else {
                    // Settings block
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Text("Pick your multiplication tables")
                                .font(.title2)
                                .foregroundColor(Color.white)
                                .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 50, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                                .padding(.top)
                            
                                    
                            Stepper(value: $multiplicationIndex, in: 1...12) {
                                HStack {
                                    Text("Multiply up to")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.black)
                                        .padding(.leading)
                                    Spacer()
                                    Text("\(multiplicationIndex)")
                                        .font(.system(size: 20))
                                        .bold()
                                        .foregroundColor(Color.black)
                                }
                            }
                            .background(Color.white.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                            
                            Text("How many questions?")
                                .font(.title2)
                                .foregroundColor(Color.white)
                                .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 50, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                                .padding(.top)
                            
                            Picker("Pick how many questions to answer", selection: $questionCountIndex) {
                                ForEach(questionCountOptions, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            .background(Color.white.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                            
                            Button("Start game") {
                                self.generateQuestions()
                                
                                withAnimation{
                                    self.playingGame.toggle()
                                    self.stillPlaying.toggle()
                                }
                            }
                            .font(.system(size: 30))
                            .foregroundColor(Color.white)
                            .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 50, alignment: .center)
                            .background(Color.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.bottom)
                            
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 380, alignment: .center)
                        .background(Color.white.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding()
                        .offset(y: -40)
                    }
                }
            }
            .navigationTitle(playingGame ? "Multiplication Game" : "Settings")
        }
    }
    
    func generateQuestions() {
        for i in 1...multiplicationIndex {
            for j in 1...12 {
                questionsArray.append(Question(firstNumber: i, secondNumber: j, answer: i*j))
            }
        }
        questionsArray.shuffle()
        if questionsArray.count > chosenQuestionCount {
            questionsArray = Array(questionsArray[0...chosenQuestionCount - 1])
        }
    }
    
    func checkAnswer() {
        if Int(self.input) == self.questionsArray[self.currentQuestion].answer {
            withAnimation(Animation.linear(duration: 1)) {
                correctAnswer = true
                wrongAnswer = false
            }
            if allowPoints {
                self.score += 1
                allowPoints = false
            }
        } else {
            withAnimation(Animation.linear(duration: 1)) {
                wrongAnswer = true
                correctAnswer = false
            }
        }
        
    }
    
    func nextQuestion() {
        self.input = ""
        self.currentQuestion += 1
        self.correctAnswer = false
        self.wrongAnswer = false
        allowPoints = true
        if currentQuestion == questionsArray.count {
            self.stillPlaying = false
        }
    }
    
    func endTitle(_ score: Int) -> String {
        if score == chosenQuestionCount {
            return "Congratulations!!!"
        } else if 5 * score >= 4 * chosenQuestionCount {
            return "Well done!!"
        } else if 5 * score >= 3 * chosenQuestionCount {
            return "Keep it up!"
        } else {
            return "Better luck next time!"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
