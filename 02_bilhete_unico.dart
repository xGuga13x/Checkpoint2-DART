class BilheteUnico {
  final String titular;
  final double tarifa;
  double _saldo = 0;

  BilheteUnico(this.titular) : tarifa = 5.00;

  BilheteUnico.estudante(this.titular) : tarifa = 2.50;

  double get saldo => _saldo;

  void recarregar(double valor) {
    if (valor > 0) {
      _saldo += valor;
      print(
        '$titular recarregou R\$ ${valor.toStringAsFixed(2)} - '
        'saldo: R\$ ${_saldo.toStringAsFixed(2)}',
      );
    } else {
      print('$titular: valor de recarga inválido.');
    }
  }

  void passarCatraca() {
    if (_saldo >= tarifa) {
      _saldo -= tarifa;
      print(
        '$titular passou na catraca (-R\$ ${tarifa.toStringAsFixed(2)}) - '
        'saldo: R\$ ${_saldo.toStringAsFixed(2)}',
      );
    } else {
      print('$titular: saldo insuficiente (R\$ ${_saldo.toStringAsFixed(2)}).');
    }
  }
}

void main() {
  BilheteUnico comum = BilheteUnico('Ana');
  BilheteUnico estudante = BilheteUnico.estudante('Bruno');

  comum.recarregar(12);
  comum.passarCatraca();
  comum.passarCatraca();
  comum.passarCatraca();

  estudante.recarregar(5);
  estudante.passarCatraca();
  estudante.passarCatraca();
  estudante.recarregar(-10);

  print('Saldo final de Ana: R\$ ${comum.saldo.toStringAsFixed(2)}');
  print('Saldo final de Bruno: R\$ ${estudante.saldo.toStringAsFixed(2)}');
}
