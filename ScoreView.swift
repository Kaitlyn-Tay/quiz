import SwiftUI

struct ScoreView: View {
    
    var score: Int
    var totalQuestions: Int
    
    var body: some View {
        VStack {
            Text("👏")
                .font(.system(size:36))
            CircularProgressView(score:CGFloat(score/totalQuestions), imageName: (score == 0) ? "Fail" : "Pass")
                .frame(width: 150, height: 150)
            Text("You got")
                .font(.system(size:36))
                .bold()
                .padding(10)
            Text("\(score)/\(totalQuestions)")
                .font(.system(size:24))
                .padding()
                .background(.black)
                .foregroundColor(.white)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 3, totalQuestions: 5)
    }
}
