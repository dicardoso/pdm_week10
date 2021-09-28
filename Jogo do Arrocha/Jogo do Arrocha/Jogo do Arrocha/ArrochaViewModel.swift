//
//  ArrochaViewModel.swift
//  Jogo do Arrocha
//
//  Created by IFPB on 28/09/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import SwiftUI

class ArrochaViewModel: ObservableObject {
    var menor:Int
    var maior:Int
    var sorteio:Int
    @Published var status:String
    
    init(){
        self.menor = 1
        self.maior = 100
        self.sorteio = Int.random(in: self.menor + 1...self.maior - 1)
        self.status = "executando"
    }
    
    func valido(valor: Int) -> Bool{
        return valor > self.menor && valor < self.maior && valor != self.sorteio
    }
    
    func arrochado() -> Bool {
        return self.menor + 1 == self.maior - 1
    }
    
    func jogada(chute: Int){
        print(chute)
        if self.valido(valor: chute){
            if chute < self.sorteio{
                self.menor = chute
            } else {
                self.maior =  chute
            }
            if arrochado(){
                self.status = "venceu"
            }else{
                self.status = "executando"
            }
        } else{
            self.status = "perdeu"
        }
        print(self.status)
    }
}
