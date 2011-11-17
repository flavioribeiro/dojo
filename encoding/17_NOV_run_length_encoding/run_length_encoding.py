def encode(entrada_string):
    entrada = list(entrada_string)
    saida = ""
    contador = 1

    anterior = entrada.pop(0)
    saida += anterior
    while entrada:
        proximo = entrada.pop(0)
        if anterior == proximo:
            contador += 1
        else:
            saida += str(contador) + proximo
            contador = 1
        anterior = proximo
    saida += str(contador)
    return saida

def decode(entrada):
    saida = ""
    posicao = 0
    
    while posicao < len(entrada):
        simbolo = entrada[posicao]
        posicao += 1
        quantidade = ""
        while posicao < len(entrada) and entrada[posicao].isdigit():
            quantidade += entrada[posicao]
            posicao += 1
        
        saida += simbolo * int(quantidade)
    return saida

