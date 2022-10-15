import SwiftUI

struct CircularProgressView: View {   
    var score: CGFloat
    var imageName: String
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 10)
                .foregroundColor(.mint)
                .opacity(0.4)
            Circle()
                .trim(from: 0, to: score)
                .stroke(lineWidth: 15)
                .foregroundColor(.red)
                .opacity(0.4)
//            Circle()
//                .trim(from: 0, to: score)
//                .stroke(style: .init(lineWidth: 40, lineCap: .round))
//                .foregroundColor(.red)
//                .rotationEffect(Angle(degrees: 270))
            //Image(imageName)
            //.resizable()
            //.frame(width: 65, height: 95)
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(score: 0, imageName: "Pass")
    }
}


