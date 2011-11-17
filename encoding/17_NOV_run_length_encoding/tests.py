#testes

from run_length_encoding import encode, decode

def test_AABBCC_should_return_A2B2C2():
    entrada = "AABBCC"
    saida_desejada = "A2B2C2"

    assert saida_desejada == encode(entrada)

def test_A_should_return_A1():
    entrada = "A"
    saida_desejada = "A1"

    assert saida_desejada == encode(entrada)

def test_AAAAAABBC_should_return_A6B2C1():
    entrada = "AAAAAABBC"
    saida_desejada = "A6B2C1"

    assert saida_desejada == encode(entrada)

def test_decode_string_with_single_symbol():
    entrada = "A1"
    saida_desejada = "A"

    assert saida_desejada == decode(entrada)


def test_A2B2C2_should_return_AABBCC():

    saida_desejada = "AABBCC"
    entrada = "A2B2C2"

    assert saida_desejada == decode(entrada)


def test_A6B2C1_should_return_AAAAAABBC():
    entrada = "A6B2C1"
    saida_desejada = "AAAAAABBC"

    assert saida_desejada == decode(entrada)

def test_A10_should_return_AAAAAAAAAAAAA(): #tem 10 as
    entrada = "A10"
    saida_desejada = "A" * 10

    assert saida_desejada == decode(entrada)

def test_A100B1_should_return_the_right_result(): #tem 100 às
    entrada = "A100B1"
    saida_desejada = "A" * 100 + "B"

    assert saida_desejada == decode(entrada)

