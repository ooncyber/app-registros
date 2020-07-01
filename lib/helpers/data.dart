class Data{
  static String dataAtual(){
    return "${DateTime.now().day.toString().padLeft(2,'0')}/${DateTime.now().month.toString().padLeft(2,'0')}";
  }

  static horaAtual(){
    return "${DateTime.now().hour.toString().padLeft(2,'0')}/${DateTime.now().minute.toString().padLeft(2,'0')}";
  }
}