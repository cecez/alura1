
class Item {
    var nome: String
    var calorias: Double

    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }

}

var itens = Array<Item>()

class Refeicao {
    
    var itens: Array<Item>
    
    init(itens: Array<Item>) {
        self.itens = itens
    }
    
}
