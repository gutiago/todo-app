import 'package:intl/intl.dart';

abstract class Strings {
  Strings._() : super();

  static const appName = 'Creative Tasks';
  static const splashFooter = 'Made by: CGGJ';

  // Login
  static const signIn = 'Sign In';
  static const emailTitle = 'Email';
  static const emailHint = 'Insira seu email cadastrado';
  static const passwordTitle = 'Senha';
  static const passwordHint = 'Insira sua senha';
  static const loginButton = 'LOGIN';
  static const noAccount = 'Não tem uma conta? ';
  static const registerHere = 'Cadastre-se aqui.';
  static const emailNotValid = 'Insira um email válido';
  static const passwordInvalid = 'Senha inválida';
  static const passwordContentHint =
      'A senha precisa incluir ao menos uma letra maiúscula, uma minúscula e possuir no mínimo 8 dígitos.';

  // Login
  static const createAccount = 'Criar conta';
  static const emailRegisterHint = 'Insira seu email';
  static const passwordRegisterHint = 'Insira uma senha';
  static const registerButton = 'CRIAR';
  static const hasAccount = 'Já tem uma conta? ';
  static const accessHere = 'Accesse aqui.';

  // Firebase
  static const weakPassword = 'Senha muito fraca.';
  static const inUseEmail = 'O email escolhido já está em uso.';
  static const userNotFound = 'Usuário não encontrado.';
  static const wrongPassword = 'Senha incorreta.';
  static const commonErrorMessage =
      'Ocorreu um erro, por favor tente novamente.';

  // Home
  static const logout = 'Encerrar sessão';
  static const morning = 'Bom dia!';
  static const afternoon = 'Boa tarde!';
  static const night = 'Boa noite!';
  static const todayTaskSection = 'Tarefas de hoje:';

  static String todayTasks(int count) => 'Parece que está tudo bem.'
      '\nVocê possui $count ${_checkTaskPlural(count)} para hoje.';

  static String todayDate(String date) => 'HOJE: $date';

  static String numberOfTasks(int count) =>
      '$count ${toBeginningOfSentenceCase(_checkTaskPlural(count))}';

  static String _checkTaskPlural(int count) {
    return (count == 1) ? 'tarefa' : 'tarefas';
  }

  // Category
  static const categories = 'Categorias';
  static const emptyList = 'Oops... \nVocê não criou nada aqui.';
  static const createCategory = 'Crie sua categoria';
  static const createCategoryTitle = 'Nome';
  static const createCategoryHint = 'Adicione o nome da categoria';
  static const createCategoryAction = 'Criar categoria';
  static const createCategoryError = 'O nome não pode estar vazio.';

  // Task
  static const createTaskTitle = 'Criar tarefa';
  static const createTaskButtonTitle = 'Criar';
  static const createTaskFieldTitle = 'Nome';
  static const createTaskCategoryFieldTitle = 'Categoria';
  static const createTaskAdd = 'Adicionar';
  static const createTaskDateFildTitle = 'Data';
  static const createTaskFieldHint = 'Adicione o nome da sua tarefa';
  static const createTaskError = 'O nome não pode estar vazio.';

  // Error
  static const errorAlertTitle = 'Ocorreu um erro';
  static const errorCreateCategoryMessage =
      'Não foi possível criar a categoria, tente novamente.';
  static const errorCreateTaskMessage =
      'Não foi possível criar a tarefa, tente novamente.';
  static const errorActionOK = 'OK';
}
