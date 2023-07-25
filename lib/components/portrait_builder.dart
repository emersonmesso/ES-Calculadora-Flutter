import 'package:app_calculadora/models/history.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import '../models/option.dart';
import 'ItemClick.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class PortraitBuilder extends StatefulWidget {
  const PortraitBuilder({super.key});

  @override
  State<PortraitBuilder> createState() => _PortraitBuilderState();
}

class _PortraitBuilderState extends State<PortraitBuilder> {
  late Color background = HexColor("#343957");
  late Color colorPrimary = HexColor("#4f556f");
  late Color colorSecundary = HexColor("#ff3563");
  late Color colorModalBackground = HexColor("#282c44");
  late double width = 0;
  late double space = 0;

  //history

  //calculos
  late bool dot;
  late String result = "";
  late List<Option> operations;
  late List<History> history;
  late String calc = "";

  @override
  void initState() {
    operations = <Option>[];
    history = <History>[];
    dot = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    space = width / 4;
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  //History
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white30,
                    ),
                  ),
                  //actual
                  SizedBox(
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: (history.isNotEmpty),
                          child: IconButton(
                            onPressed: () {
                              showFlexibleBottomSheet(
                                minHeight: 0,
                                initHeight: 0.5,
                                maxHeight: 1,
                                context: context,
                                builder: _buildBottomSheet,
                                anchors: [0, 0.5, 1],
                                isSafeArea: true,
                              );
                            },
                            icon: const Icon(
                              Icons.history,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          calc,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: (space * 5),
            child: Column(
              children: [
                Row(
                  children: [
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "C",
                      colorText: colorSecundary,
                      space: space,
                      actionClick: () {
                        //clean cal
                        setState(() {
                          operations.clear();
                          calc = "";
                          result = "";
                        });
                      },
                    ),
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "%",
                      colorText: colorSecundary,
                      space: space,
                      actionClick: () {
                        actionOperation(5);
                      },
                    ),
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "/",
                      colorText: colorSecundary,
                      space: space,
                      actionClick: () {
                        actionOperation(4);
                      },
                    ),
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "X",
                      colorText: colorSecundary,
                      space: space,
                      actionClick: () {
                        actionOperation(3);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "7",
                      colorText: Colors.white,
                      space: space,
                      actionClick: () {
                        actionNumbers(7);
                      },
                    ),
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "8",
                      colorText: Colors.white,
                      space: space,
                      actionClick: () {
                        actionNumbers(8);
                      },
                    ),
                    ItemClick(
                        colorPrimary: colorPrimary,
                        text: "9",
                        colorText: Colors.white,
                        space: space,
                        actionClick: () {
                          actionNumbers(9);
                        }),
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "-",
                      colorText: colorSecundary,
                      space: space,
                      actionClick: () {
                        actionOperation(2);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "4",
                      colorText: Colors.white,
                      space: space,
                      actionClick: () {
                        actionNumbers(4);
                      },
                    ),
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "5",
                      colorText: Colors.white,
                      space: space,
                      actionClick: () {
                        actionNumbers(5);
                      },
                    ),
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "6",
                      colorText: Colors.white,
                      space: space,
                      actionClick: () {
                        actionNumbers(6);
                      },
                    ),
                    ItemClick(
                      colorPrimary: colorPrimary,
                      text: "+",
                      colorText: colorSecundary,
                      space: space,
                      actionClick: () {
                        actionOperation(1);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            ItemClick(
                              colorPrimary: colorPrimary,
                              text: "1",
                              colorText: Colors.white,
                              space: space,
                              actionClick: () {
                                actionNumbers(1);
                              },
                            ),
                            ItemClick(
                              colorPrimary: colorPrimary,
                              text: "2",
                              colorText: Colors.white,
                              space: space,
                              actionClick: () {
                                actionNumbers(2);
                              },
                            ),
                            ItemClick(
                              colorPrimary: colorPrimary,
                              text: "3",
                              colorText: Colors.white,
                              space: space,
                              actionClick: () {
                                actionNumbers(3);
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ItemClick(
                              colorPrimary: colorPrimary,
                              text: "0",
                              colorText: Colors.white,
                              space: space,
                              actionClick: () {
                                actionNumbers(0);
                              },
                            ),
                            ItemClick(
                              colorPrimary: colorPrimary,
                              text: ".",
                              colorText: Colors.white,
                              space: space,
                              actionClick: () {
                                actionOperation(6);
                              },
                            ),
                            ItemClick(
                              colorPrimary: colorPrimary,
                              text: "/",
                              colorText: Colors.white,
                              space: space,
                              icone: const Icon(
                                Icons.backspace_outlined,
                                color: Colors.white,
                              ),
                              actionClick: () {
                                actionDeleteLast();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        getcalc();
                      },
                      child: Container(
                        width: space - 1,
                        height: (space - 1) * 2,
                        margin: const EdgeInsets.all(0.5),
                        color: colorSecundary,
                        child: const Center(
                          child: Text(
                            "=",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      color: Colors.white,
      child: ListView(
        controller: scrollController,
        children: [
          Container(
            padding: const EdgeInsets.all(15.5),
            child: Center(
              child: Text(
                "Histórico",
                style: TextStyle(
                  color: colorSecundary,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(
            height: (history.length * 150),
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            history[index].history,
                            style: TextStyle(
                              color: colorPrimary,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                " = ",
                                style: TextStyle(
                                  color: colorPrimary,
                                ),
                              ),
                              Text(
                                history[index].result.toString(),
                                style: TextStyle(
                                  color: colorSecundary,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  actionDeleteLast() {
    if (operations.isNotEmpty) {
      operations.removeLast();
      getOperations();
    }
  }

  actionNumbers(double val) {
    //verifica se o último é um numero
    if (operations.isNotEmpty) {
      if (operations.last.op == 0) {
        if (dot) {
          //realiza o cálculo sobre o valor decimal
          int tamanho = operations.length;
          int index = tamanho - 1;
          int decimais = decimalCount(operations.last.val);
          int divisor = 10;
          for (int i = 0; i < decimais; i++) {
            divisor = divisor * 10;
          }
          double valorNovo = (val / divisor) + operations.last.val;
          Option op = Option(val: valorNovo, op: 0);
          operations[index] = op;
          getOperations();
        } else {
          //adicionando o valor a mais
          double soma = ((operations.last.val * 10) + val).toDouble();
          //adicionando um novo numero na conta
          operations.removeLast();
          operations.add(Option(val: soma, op: 0));
          getOperations();
        }
      } else {
        //verifica se já pode adicionar a pontuação
        if (operations.last.op == 6) {
          print("Adicionando o valor no ponto...");
          //removendo o ponto da lista
          int tamanho = operations.length;
          operations.removeLast();
          int indexNovo = tamanho - 2;
          //cria o novo objeto
          double novoValor = (val / 10) + operations[indexNovo].val;
          Option op = Option(val: novoValor, op: 0);
          operations[indexNovo] = op;
          getOperations();
          setState(() {
            dot = true;
          });
        } else {
          operations.add(Option(val: val, op: 0));
          getOperations();
        }
      }
    } else {
      //adicionando um novo numero na conta
      operations.add(Option(val: val, op: 0));
      getOperations();
    }
  }

  actionOperation(int op) {
    if (dot) {
      setState(() {
        dot = false;
      });
    }
    //verifica se já tem algum dado adicionado
    if (operations.isNotEmpty) {
      //verifica se o último adicionado não é um operação
      if (operations[(operations.length - 1)].op == 0) {
        //adicionando um novo numero na conta
        operations.add(Option(val: 0, op: op));
        getOperations();
      }
    }
  }

  calcMult(List<Option> op) {
    double mult = 0;
    int index = 0;
    for (int i = 0; i < op.length; i++) {
      if (op[i].op == 3) {
        index = i;
        //realizando a soma do que se tem
        mult = (op[i - 1].val * op[i + 1].val).toDouble();
        print("Multiplicação: $mult");
        //removendo os valores multiplicados
        op.removeAt(index);
        op.removeAt(index);
        op.removeAt((index - 1) <= 0 ? 0 : (index - 1));
        //adicionando o novo valor
        op.insert((index - 1) <= 0 ? 0 : (index - 1), Option(val: mult, op: 0));
        return op;
      }
    }
  }

  calcDiv(List<Option> op) {
    double div = 0;
    int index = 0;
    for (int i = 0; i < op.length; i++) {
      if (op[i].op == 4) {
        index = i;
        //realizando a soma do que se tem
        div = (op[i - 1].val) / (op[i + 1].val);
        print("Multiplicação: $div");
        //removendo os valores multiplicados
        op.removeAt(index);
        op.removeAt(index);
        op.removeAt((index - 1) <= 0 ? 0 : (index - 1));
        //adicionando o novo valor
        op.insert((index - 1) <= 0 ? 0 : (index - 1), Option(val: div, op: 0));
        return op;
      }
    }
  }

  calcSub(List<Option> op) {
    double sub = 0;
    int index = 0;
    for (int i = 0; i < op.length; i++) {
      if (op[i].op == 2) {
        index = i;
        //realizando a soma do que se tem
        sub = (op[i - 1].val - op[i + 1].val);
        print("Subtração: $sub");
        //removendo os valores somados
        op.removeAt(index);
        op.removeAt(index);
        op.removeAt((index - 1) <= 0 ? 0 : (index - 1));
        //adicionando o novo valor
        op.insert((index - 1) <= 0 ? 0 : (index - 1), Option(val: sub, op: 0));
        return op;
      }
    }
  }

  calcPercent(List<Option> operation) {
    double percent = 0;
    for (int i = 0; i < operations.length; i++) {
      if (operations[i].op == 5) {
        //realizando a porcentagem
        percent = (100 * operations[i - 1].val) / operations[i + 1].val;
        //removendo os valores somados
        operations.removeAt(i);
        operations.removeAt(i);
        operations.removeAt((i - 1) <= 0 ? 0 : (i - 1));
        //adicionando o novo valor
        operations.insert(
            (i - 1) <= 0 ? 0 : (i - 1), Option(val: percent, op: 0));
      }
    }
  }

  calcSoma(List<Option> operation) {
    double soma = 0;
    for (int i = 0; i < operations.length; i++) {
      if (operations[i].op == 1) {
        print("$i");
        //realizando a soma do que se tem
        soma = (operations[i - 1].val + operations[i + 1].val);
        print("Soma: $soma");
        //removendo os valores somados
        operations.removeAt(i);
        operations.removeAt(i);
        operations.removeAt((i - 1) <= 0 ? 0 : (i - 1));
        //adicionando o novo valor
        operations.insert((i - 1) <= 0 ? 0 : (i - 1), Option(val: soma, op: 0));
      }
    }
  }

  getcalc() {
    String res = result;

    if (operations.isNotEmpty) {
      //verifica se o último adicionado não é um operação
      if (operations[(operations.length - 1)].op == 0) {
        List<Option> op = operations;

        //procurando as multiplicações
        int qtdMult = 0;
        op.forEach((element) {
          if (element.op == 3) {
            qtdMult++;
          }
        });
        if (qtdMult > 0) {
          for (int i = 0; i <= qtdMult; i++) {
            calcMult(operations);
          }
        }

        //procurando as divisoes
        int qtdDiv = 0;
        op.forEach((element) {
          if (element.op == 4) {
            qtdDiv++;
          }
        });
        if (qtdDiv > 0) {
          for (int i = 0; i <= qtdDiv; i++) {
            calcDiv(operations);
          }
        }

        //procurando as subtrações
        int qdtSub = 0;
        op.forEach((element) {
          if (element.op == 2) {
            qdtSub++;
          }
        });
        if (qdtSub > 0) {
          for (int i = 0; i <= qdtSub; i++) {
            calcSub(operations);
          }
        }

        //procurando as somas
        int qdtSoma = 0;
        //verifica a quantidade de somas
        operations.forEach((element) {
          if (element.op == 1) {
            qdtSoma++;
          }
        });
        if (qdtSoma > 0) {
          for (int i = 0; i <= qdtSoma; i++) {
            calcSoma(operations);
          }
        }

        //procurando por porcentagem
        calcPercent(operations);

        //
        setState(() {
          calc = operations.last.val.toStringAsFixed(2).toString();
        });

        //pegando os dados e salvando na lista
        history.add(History(history: res, result: operations.last.val));

        //mostra os resultados
        getOperations();
      }
    }
  }

  String getOperationsHistory(List<Option> operations) {
    String res = "";
    for (var operation in operations) {
      if (operation.op != 0) {
        switch (operation.op) {
          case 1:
            res = "$res + ";
            break;
          case 2:
            res = "$res - ";
            break;
          case 3:
            res = "$res x ";
            break;
          case 4:
            res = "$res / ";
            break;
          case 5:
            res = "$res % ";
            break;
          case 6:
            res = "$res.";
            break;
        }
      } else {
        if (decimalCount(operation.val) == 0) {
          res = "$res${operation.val}";
        } else {
          res = "$res${operation.val}";
        }
      }
    }
    return res;
  }

  getOperations() {
    String res = "";
    print("total: ${operations.length}");
    for (var operation in operations) {
      if (operation.op != 0) {
        switch (operation.op) {
          case 1:
            res = "$res + ";
            break;
          case 2:
            res = "$res - ";
            break;
          case 3:
            res = "$res x ";
            break;
          case 4:
            res = "$res / ";
            break;
          case 5:
            res = "$res % ";
            break;
          case 6:
            res = "$res.";
            break;
        }
      } else {
        if (decimalCount(operation.val) == 0) {
          res = "$res${operation.val}";
        } else {
          res = "$res${operation.val}";
        }
      }
    }
    setState(() {
      result = res;
    });
  }

  int decimalCount(double value) {
    var str = value.toString();
    var dot = str.indexOf(".");
    var e = str.indexOf("e", dot + 1);
    if (e < 0) {
      return str.length - (dot + 1);
    }
    // Has an exponent part, something like 1.234e-4. Try to compensate.
    var decimals = e - (dot + 1);
    var exponent = int.parse(str.substring(e + 1));
    decimals -= exponent;
    if (decimals < 0) return 0;
    return decimals;
  }
}
