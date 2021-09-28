//
//  ContentView.swift
//  Jogo do Arrocha
//
//  Created by IFPB on 28/09/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var num: String = ""
    @State private var res: String = ""
    @ObservedObject var arrochaVM: ArrochaViewModel
    var body: some View {
        VStack{
            Text("Jogo do Arrocha")
                .fontWeight(.bold)
                .padding()
                .font(.title)
            infos
            .padding()
            TextField(
                "Chute",
                text: self.$num
            ).padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Jogar", action: onClick)
            Text(res)
        }
    }
    func onClick(){
        let chut:Int = Int(self.num)!
        
        arrochaVM.jogada(chute: chut)
        res = arrochaVM.status
        print(res)
    }
}
extension ContentView{
    var infos: some View{
        HStack{
            Text("1")
                .frame(width: 50)
            Text("100")
                .frame(width: 50)
        }

    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(arrochaVM: ArrochaViewModel())
    }
}
