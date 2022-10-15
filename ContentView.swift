import SwiftUI

struct ContentView: View {
    var questions = [
        Question(questionTitle: "What do mycologists study?", option1: "mushrooms", option2: "mycoplasma", option3: "mayonnaise", option4: "marshmallows", correctOption: 1),
        Question(questionTitle: "Who invented peanut butter?", option1: "Marshal Helion Grenovoir", option2: "Michael Billius Jordan", option3: "Marcellus Gilmore Edson", option4: "Micheal Bruce Mathers", correctOption: 3),
        Question(questionTitle: "What object does a male penguin often gift to a female penguin to win her over?", option1: "lung", option2: "egg", option3: "fish", option4: "pebble", correctOption: 4),
        Question(questionTitle: "What is entrance in swedish?", option1: "Insadar", option2: "Insider", option3: "Infart", option4: "Infacade", correctOption: 3)
    ]
    
    @State var currentQuestion = 0
    @State var alertShown = false
    @State var isCorrect = false
    
    @State var correctAnswers = 0
    @State var sheetShown = false
    
    var body: some View {
        ZStack{
            LinearGradient(colors:[.orange,.purple,.red],startPoint:.topLeading,endPoint:.bottomTrailing)
            VStack {
                Text("\(questions.count - currentQuestion) question(s) left :D")
                ProgressView(value: Double(currentQuestion),
                             total: Double(questions.count))
                .tint(.mint)
                .padding()
                Text(questions[currentQuestion].questionTitle)
                    .foregroundColor(.white)
                    .font(.title)
                    .multilineTextAlignment(.center)
                HStack{
                    VStack{
                        Button{
                            print(1)
                            didTapOption(option: 1)
                        }label: {
                            Text(questions[currentQuestion].option1)
                                .bold()
                        }
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                        .font(.caption)
                        
                        Button{
                            print(2)
                            didTapOption(option: 2)
                        }label: {
                            Text(questions[currentQuestion].option2)
                                .bold()
                        }
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                        .font(.caption)
                    }
                    .padding()
                    VStack{
                        Button{
                            print(3)
                            didTapOption(option: 3)
                        }label: {
                            Text(questions[currentQuestion].option3)
                                .bold()
                        }
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                        .font(.caption)
                        
                        Button{
                            print(4)
                            didTapOption(option: 4)
                        }label: {
                            Text(questions[currentQuestion].option4)
                                .bold()
                        }
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                        .font(.caption)
                        
                    }
                    
                }
                .foregroundColor(.white)
            }
            .alert(isCorrect ? "Correct" : "Wrong", isPresented: $alertShown){
                Button("OK"){
                    if currentQuestion < questions.count - 1{
                        currentQuestion += 1
                    } else {
                        sheetShown = true
                    }
                } 
            } message: {
                    Text(isCorrect ? "Yay! You did it :D" : ":<")
            }
        }
        .sheet(isPresented: $sheetShown, 
               onDismiss: {
            correctAnswers = 0
            currentQuestion = 0
        },
               content:{
            ScoreView(score: correctAnswers,
                      totalQuestions: questions.count)
        })
    }
    func didTapOption(option: Int) {
        if option == 
            questions[currentQuestion].correctOption{
            isCorrect = true
            correctAnswers += 1
            alertShown = true
        } else {
            isCorrect = false
            alertShown = true
        }
    }
}

